#!/usr/bin/env python3
"""Suite de pruebas automatizadas para el validador de metadatos YAML Frontmatter."""

from __future__ import annotations

from pathlib import Path

import pytest

from tests.validate_metadata import (
    CONFIG,
    extract_frontmatter,
    validate_all_metadata,
    validate_metadata_fields,
)


@pytest.fixture
def repo_root() -> Path:
    """Retorna la ruta raíz del repositorio."""
    return Path(__file__).resolve().parent.parent


def test_repository_all_markdown_metadata_valid(repo_root: Path) -> None:
    """Verifica que todos los archivos Markdown del repositorio cumplan el esquema de metadatos."""
    schema_path = repo_root / "schemas" / "frontmatter.schema.json"
    err_count, errors = validate_all_metadata(
        repo_root=repo_root,
        schema_file=schema_path,
        ignored_dirs=CONFIG.default_ignored_dirs,
    )
    assert err_count == 0, "Se detectaron errores de metadatos:\n" + "\n".join(errors)


def test_extract_frontmatter_valid() -> None:
    """Prueba la extracción correcta de un bloque Frontmatter válido."""
    sample = """---
id: 01_test_doc
name: test_doc
title: "Documento de Prueba"
file_path: docs/test.md
version: 1.0.0
category: standards
tags: [test, unit]
description: "Descripción de prueba para el validador de metadatos."
owner: Test Team
status: active
created_at: 2026-09-01T22:00:00Z
updated_at: 2026-09-01T22:00:00Z
schema_version: 1.0.0
---

# Contenido
"""
    data, err = extract_frontmatter(sample)
    assert err is None
    assert isinstance(data, dict)
    assert data["id"] == "01_test_doc"
    assert data["name"] == "test_doc"
    assert data["tags"] == ["test", "unit"]


def test_extract_frontmatter_missing() -> None:
    """Prueba la detección de archivos sin encabezado Frontmatter."""
    sample = "# Solo título sin frontmatter"
    data, err = extract_frontmatter(sample)
    assert data is None
    assert err is not None
    assert "No se encontró delimitador" in err


def test_validate_metadata_missing_required_field() -> None:
    """Prueba la detección de campos requeridos faltantes."""
    data = {
        "id": "01_sample",
        "name": "sample",
        # Falta title, version, category, etc.
    }
    seen: dict[str, Path] = {}
    errors = validate_metadata_fields(
        data=data,
        file_rel_path="test.md",
        seen_ids=seen,
        source_file=Path("test.md"),
    )
    assert any("Campo obligatorio faltante" in e and "'title'" in e for e in errors)
    assert any("Campo obligatorio faltante" in e and "'description'" in e for e in errors)


def test_validate_metadata_invalid_id_format() -> None:
    """Prueba que un ID con formato incorrecto sea rechazado."""
    data = {
        "id": "INVALID-ID-123",
        "name": "sample_name",
        "title": "Título Válido",
        "file_path": "sample.md",
        "version": "1.0.0",
        "category": "standards",
        "tags": ["valid-tag"],
        "description": "Descripción suficientemente larga para pasar la prueba.",
        "owner": "Team",
        "status": "active",
        "created_at": "2026-09-01T00:00:00Z",
        "updated_at": "2026-09-01T00:00:00Z",
        "schema_version": "1.0.0",
    }
    seen: dict[str, Path] = {}
    errors = validate_metadata_fields(
        data=data,
        file_rel_path="sample.md",
        seen_ids=seen,
        source_file=Path("sample.md"),
    )
    assert any("ID inválido" in e for e in errors)


def test_validate_metadata_duplicate_id() -> None:
    """Prueba la detección de colisiones de IDs entre archivos."""
    data1 = {
        "id": "01_duplicate",
        "name": "dup_one",
        "title": "Doc 1",
        "file_path": "doc1.md",
        "version": "1.0.0",
        "category": "standards",
        "tags": ["tag"],
        "description": "Descripción del documento uno.",
        "owner": "Team",
        "status": "active",
        "created_at": "2026-09-01T00:00:00Z",
        "updated_at": "2026-09-01T00:00:00Z",
        "schema_version": "1.0.0",
    }
    data2 = dict(data1)
    data2["name"] = "dup_two"
    data2["file_path"] = "doc2.md"

    seen: dict[str, Path] = {}
    errors1 = validate_metadata_fields(
        data=data1,
        file_rel_path="doc1.md",
        seen_ids=seen,
        source_file=Path("doc1.md"),
    )
    assert len(errors1) == 0

    errors2 = validate_metadata_fields(
        data=data2,
        file_rel_path="doc2.md",
        seen_ids=seen,
        source_file=Path("doc2.md"),
    )
    assert any("ID duplicado" in e for e in errors2)
