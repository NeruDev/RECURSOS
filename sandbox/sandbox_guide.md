---
id: 10_sandbox_guide
name: sandbox_guide
title: "Guía de Sandboxing y Blast Radius Controlado en Recursos Didácticos"
file_path: sandbox/sandbox_guide.md
version: 1.0.0
category: guides
tags: [sandbox, blast-radius, isolation, safety, promotion-lifecycle, experimentation]
description: "Guía técnica para la gestión de entornos de experimentación con blast radius controlado y ciclo de vida de promoción a producción."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-08-29T21:00:00Z
updated_at: 2026-09-01T22:45:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture, 03_glossary, 04_buenas_practicas]
schema_version: 1.0.0
---

# Guía de Sandboxing y Blast Radius Controlado (sandbox_guide.md)

Este documento define la **política de aislamiento, niveles de contención de riesgos y el ciclo de promoción de código** para experimentos y prototipos didácticos generados por humanos o agentes de IA.

---

## 1. Filosofía: Blast Radius Controlado

El sistema implementa un modelo formal de **Blast Radius Controlado** graduado en 3 niveles de contención técnica y organizativa:

```mermaid
flowchart TD
    subgraph L1 ["Nivel 1: Aislamiento Organizativo (Default)"]
        A["Directorio sandbox/ en .gitignore"] --> B["src/ NUNCA importa desde sandbox/"]
    end

    subgraph L2 ["Nivel 2: Aislamiento en Control de Versiones (Intermedio)"]
        C["git worktree dedicado"] --> D["Rama efímera agent/scratch-*"]
    end

    subgraph L3 ["Nivel 3: Aislamiento de Entorno de Ejecución (Avanzado)"]
        E["Entorno virtual .venv aislado"] --> F["Subprocesos de compilación no destructivos"]
    end

    L1 -->|Escalamiento según riesgo| L2
    L2 -->|Escalamiento para código no confiable| L3
```

---

## 2. Los 3 Niveles de Aislamiento

1. **Nivel 1: Aislamiento Organizativo (Estándar para Prototipos Didácticos)**
   - El directorio `sandbox/` está excluido de Git mediante `.gitignore` (excepto su `README.md`, `.gitignore` y `sandbox_guide.md`).
   - `MUST_NOT`: Ningún módulo en `src/` o `tests/` puede importar código ubicado en `sandbox/`.
2. **Nivel 2: Aislamiento de Control de Versiones (Para Refactorizaciones Mayores)**
   - Uso de `git worktree` o ramas temporales (`agent/scratch-<id>`) para evitar ensuciar el árbol de trabajo principal.
   - Permite descartar o fusionar selectivamente los cambios experimentales.
3. **Nivel 3: Aislamiento de Entorno de Ejecución (Para Scripts No Confiables o de Estrés)**
   - Ejecución dentro de subprocesos aislados sin privilegios administrativos.
   - Variables de entorno locales sin alterar configuraciones del sistema host.

---

## 3. Protocolo de Promoción a Producción en 5 Pasos

Todo código originado en `sandbox/` que deba incorporarse a la base de código principal DEBE seguir este ciclo formal:

```mermaid
flowchart LR
    P1["1. Prototipar en sandbox/"] --> P2["2. Aislar & Tipar"]
    P2 --> P3["3. Mover a src/<Materia>/"]
    P3 --> P4["4. Crear Tests Unitarios"]
    P4 --> P5["5. Limpieza de sandbox/"]
```

1. **Paso 1 (Prototipado):** Desarrollar y verificar empíricamente la solución en `sandbox/proto_<materia>_<tema>.py`.
2. **Paso 2 (Aislamiento y Tipado):** Añadir anotaciones de tipo PEP 585/604 completas, docstrings y manejo de excepciones de dominio.
3. **Paso 3 (Migración a `src/`):** Mover el archivo o funciones al paquete canónico en `src/` (`src/Circuitos/`, `src/VHDL/`, etc.).
4. **Paso 4 (Cobertura de Pruebas):** Escribir pruebas automatizadas en `tests/` que validen casos de éxito y de borde.
5. **Paso 5 (Limpieza):** Eliminar los archivos temporales de `sandbox/` para no dejar residuos.
