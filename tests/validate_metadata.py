#!/usr/bin/env python3
"""Validador determinista de Metadatos YAML Frontmatter.

Inspecciona todos los archivos Markdown (.md) del repositorio excluyendo
directorios temporales o externos (como 'formato_minimo/'), valida la presencia
y tipos de datos de los metadatos obligatorios, verifica conformidad con
JSON Schema (Draft 2020-12) y asegura la unicidad y formato canónico de los IDs.
"""

from __future__ import annotations

import argparse
import datetime
import json
import re
import sys
from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import jsonschema
import yaml


@dataclass(frozen=True)
class ValidationConfig:
    """Configuración inmutable para el proceso de validación de metadatos."""

    id_regex: re.Pattern[str] = re.compile(
        r"^([a-z]{2,12}_[0-9a-hjkmnp-tv-z]{26}|[0-9]{2}_[a-z0-9_]{3,60}|[a-z]{3,12}_[a-z0-9_]{3,50})$"
    )
    name_regex: re.Pattern[str] = re.compile(r"^[a-z0-9_]{3,64}$")
    semver_regex: re.Pattern[str] = re.compile(r"^\d+\.\d+\.\d+$")
    tag_regex: re.Pattern[str] = re.compile(r"^[a-z0-9_-]+$")
    frontmatter_regex: re.Pattern[str] = re.compile(r"^---\s*\n(.*?)\n---\s*\n", re.DOTALL)
    default_ignored_dirs: tuple[str, ...] = (
        "formato_minimo",
        ".venv",
        ".git",
        "__pycache__",
        "output",
        ".pytest_cache",
        ".mypy_cache",
        ".ruff_cache",
    )
    required_fields: tuple[str, ...] = (
        "id",
        "name",
        "title",
        "file_path",
        "version",
        "category",
        "tags",
        "description",
        "owner",
        "status",
        "created_at",
        "updated_at",
        "schema_version",
    )


CONFIG = ValidationConfig()


def normalize_yaml_data(obj: Any) -> Any:
    """Normaliza tipos nativos cargados por PyYAML a tipos estándar serializables.

    Convierte instancias de datetime.datetime y datetime.date a cadenas
    formateadas en ISO 8601 UTC.

    Args:
        obj: Objeto o estructura de datos a normalizar.

    Returns:
        Estructura de datos con tipos normalizados para validación JSON Schema.
    """
    if isinstance(obj, (datetime.datetime, datetime.date)):
        if isinstance(obj, datetime.datetime):
            if obj.tzinfo is not None:
                iso = obj.isoformat()
                return iso.replace("+00:00", "Z")
            return f"{obj.isoformat()}Z"
        return obj.isoformat()
    if isinstance(obj, dict):
        return {k: normalize_yaml_data(v) for k, v in obj.items()}
    if isinstance(obj, list):
        return [normalize_yaml_data(v) for v in obj]
    return obj


def extract_frontmatter(content: str) -> tuple[dict[str, Any] | None, str | None]:
    """Extrae y parsea el encabezado YAML Frontmatter de un archivo Markdown.

    Args:
        content: Contenido textual del archivo Markdown.

    Returns:
        Una tupla con (diccionario_frontmatter, None) en caso de éxito, o
        (None, mensaje_error) si ocurre un fallo de delimitación o parseo.
    """
    match = CONFIG.frontmatter_regex.match(content)
    if not match:
        return None, "No se encontró delimitador YAML Frontmatter inicial ('--- ... ---')"

    yaml_text = match.group(1)
    if yaml is None:
        return None, "El módulo 'pyyaml' no está instalado en el entorno actual"

    try:
        data = yaml.safe_load(yaml_text)
        if not isinstance(data, dict):
            return None, "El bloque Frontmatter no es un diccionario YAML válido"
        return normalize_yaml_data(data), None
    except Exception as exc:
        return None, f"Error de sintaxis YAML: {exc}"


def validate_metadata_fields(
    data: dict[str, Any],
    file_rel_path: str,
    seen_ids: dict[str, Path],
    source_file: Path,
    validator: Any | None = None,
) -> list[str]:
    """Valida los campos obligatorios, formatos y tipos de datos del frontmatter.

    Args:
        data: Diccionario con los metadatos del frontmatter.
        file_rel_path: Ruta relativa del archivo para reportar errores.
        seen_ids: Registro de IDs ya procesados para detectar colisiones.
        source_file: Ruta absoluta del archivo analizado.
        validator: Validador jsonschema opcional instanciado.

    Returns:
        Lista de mensajes de error detectados (vacía si es válido).
    """
    errors: list[str] = []

    # 1. Validación contra JSON Schema si está disponible
    if validator is not None:
        for schema_err in validator.iter_errors(data):
            field_path = "/".join(str(elem) for elem in schema_err.path) or "root"
            errors.append(
                f"Violación de esquema en '{file_rel_path}' [{field_path}]: {schema_err.message}"
            )

    # 2. Validación de campos obligatorios requeridos
    for field in CONFIG.required_fields:
        if field not in data or data[field] is None:
            errors.append(f"Campo obligatorio faltante en '{file_rel_path}': '{field}'")

    # 3. Validación de ID único y formato canónico
    doc_id = data.get("id")
    if doc_id is not None:
        if not isinstance(doc_id, str) or not CONFIG.id_regex.match(doc_id):
            errors.append(
                f"ID inválido en '{file_rel_path}': '{doc_id}' "
                f"no cumple el formato canónico (Slug Secuencial o TypeID)"
            )
        elif doc_id in seen_ids and seen_ids[doc_id] != source_file:
            prev_file = seen_ids[doc_id]
            errors.append(
                f"ID duplicado '{doc_id}' en '{file_rel_path}' "
                f"(ya utilizado en '{prev_file.as_posix()}')"
            )
        else:
            seen_ids[doc_id] = source_file

    # 4. Validación de Name
    name = data.get("name")
    if name is not None:
        if not isinstance(name, str) or not CONFIG.name_regex.match(name):
            errors.append(
                f"Nombre inválido en '{file_rel_path}': '{name}' debe ser snake_case [a-z0-9_]"
            )

    # 5. Validación de Versión SemVer
    version = data.get("version")
    if version is not None:
        if not isinstance(version, str) or not CONFIG.semver_regex.match(str(version)):
            errors.append(
                f"Versión inválida en '{file_rel_path}': '{version}' debe ser SemVer (X.Y.Z)"
            )

    # 6. Validación de Tags (Array de strings válidos)
    tags = data.get("tags")
    if tags is not None:
        if not isinstance(tags, list) or len(tags) == 0:
            errors.append(f"Tags en '{file_rel_path}' debe ser una lista no vacía")
        else:
            for tag in tags:
                if not isinstance(tag, str) or not CONFIG.tag_regex.match(tag):
                    errors.append(
                        f"Tag inválido en '{file_rel_path}': '{tag}' "
                        f"debe contener solo minúsculas, números o guiones"
                    )

    # 7. Validación de Fechas (created_at, updated_at)
    for date_field in ("created_at", "updated_at"):
        val = data.get(date_field)
        if val is not None:
            if not isinstance(val, str) or len(val.strip()) < 8:
                errors.append(
                    f"Fecha inválida en '{file_rel_path}' para '{date_field}': '{val}'"
                )

    # 8. Validación de Listas Opcionales (dependencies, related_specs)
    for list_field in ("dependencies", "related_specs"):
        if list_field in data and data[list_field] is not None:
            if not isinstance(data[list_field], list):
                errors.append(f"El campo '{list_field}' en '{file_rel_path}' debe ser una lista")

    return errors


def should_ignore(path: Path, repo_root: Path, ignored_dirs: Sequence[str]) -> bool:
    """Determina si un archivo o directorio debe ser omitido de la validación.

    Args:
        path: Ruta del archivo a evaluar.
        repo_root: Raíz del repositorio.
        ignored_dirs: Lista de nombres de carpetas a ignorar.

    Returns:
        True si la ruta coincide con un directorio ignorado, False en caso contrario.
    """
    rel_parts = path.relative_to(repo_root).parts
    for ignored in ignored_dirs:
        if ignored in rel_parts:
            return True
    return False


def validate_all_metadata(
    repo_root: Path,
    schema_file: Path | None = None,
    ignored_dirs: Sequence[str] | None = None,
) -> tuple[int, list[str]]:
    """Ejecuta la validación exhaustiva de metadatos en todos los Markdown del repositorio.

    Args:
        repo_root: Directorio raíz del repositorio a inspeccionar.
        schema_file: Ruta al archivo JSON Schema de frontmatter (opcional).
        ignored_dirs: Secuencia de nombres de directorios a excluir de la búsqueda.

    Returns:
        Tupla con (número_de_errores, lista_de_mensajes_de_error).
    """
    active_ignored = list(ignored_dirs) if ignored_dirs is not None else list(CONFIG.default_ignored_dirs)
    errors: list[str] = []
    seen_ids: dict[str, Path] = {}

    validator: Any | None = None
    if schema_file and schema_file.exists() and jsonschema is not None:
        try:
            schema_data = json.loads(schema_file.read_text(encoding="utf-8"))
            validator = jsonschema.Draft202012Validator(schema_data)
        except Exception as exc:
            errors.append(f"No se pudo inicializar JSON Schema validator: {exc}")

    # Localizar todos los archivos .md elegibles
    md_files: list[Path] = []
    for md_candidate in repo_root.rglob("*.md"):
        if not should_ignore(md_candidate, repo_root, active_ignored):
            md_files.append(md_candidate)

    md_files.sort()

    for md_file in md_files:
        rel_path = md_file.relative_to(repo_root).as_posix()
        try:
            content = md_file.read_text(encoding="utf-8")
        except Exception as exc:
            errors.append(f"Error al leer '{rel_path}': {exc}")
            continue

        frontmatter, parse_err = extract_frontmatter(content)
        if parse_err:
            errors.append(f"Error en '{rel_path}': {parse_err}")
            continue

        assert frontmatter is not None
        file_errors = validate_metadata_fields(
            data=frontmatter,
            file_rel_path=rel_path,
            seen_ids=seen_ids,
            source_file=md_file,
            validator=validator,
        )
        errors.extend(file_errors)

    return len(errors), errors


def main(argv: Sequence[str] | None = None) -> int:
    """Punto de entrada CLI para la validación de metadatos del repositorio.

    Args:
        argv: Argumentos de línea de comandos opcionales.

    Returns:
        0 si la validación es exitosa sin errores, 1 si se detectan violaciones.
    """
    parser = argparse.ArgumentParser(
        description="Validador determinista de Metadatos YAML Frontmatter del repositorio."
    )
    parser.add_argument(
        "-r",
        "--root",
        type=Path,
        default=Path(__file__).resolve().parent.parent,
        help="Ruta a la raíz del repositorio (por defecto la raíz del proyecto)",
    )
    parser.add_argument(
        "-s",
        "--schema",
        type=Path,
        default=None,
        help="Ruta personalizada al archivo frontmatter.schema.json",
    )
    args = parser.parse_args(argv)

    root_dir: Path = args.root.resolve()
    schema_path: Path = (
        args.schema.resolve()
        if args.schema
        else root_dir / "schemas" / "frontmatter.schema.json"
    )

    print(f"[*] Validando metadatos YAML Frontmatter en: {root_dir}")
    print(f"[*] Directorios ignorados: {', '.join(CONFIG.default_ignored_dirs)}")

    err_count, errors = validate_all_metadata(root_dir, schema_path)

    if err_count == 0:
        print("[+] Metadata Validation PASSED: 0 errores detectados en archivos Markdown.")
        return 0

    print(f"[-] Metadata Validation FAILED: Se detectaron {err_count} errores:")
    for err in errors:
        print(f"    - {err}")
    return 1


if __name__ == "__main__":
    sys.exit(main())
