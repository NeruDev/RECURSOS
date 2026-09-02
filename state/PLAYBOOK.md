---
id: 06_playbook
name: playbook
title: "Procedimientos Operativos Estandarizados y Recetas de Ejecución Didáctica"
file_path: state/PLAYBOOK.md
version: 1.0.0
category: guides
tags: [playbook, sop, recetas, circuitos, electromagnetismo, telecomunicaciones, vhdl, typst, quarto, pdf]
description: "Catálogo de Procedimientos Operativos Estandarizados (SOPs) y recetas deterministas para la creación, validación y compilación de recursos didácticos por materia."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T22:00:00Z
updated_at: 2026-09-01T22:45:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture, 03_glossary, 04_buenas_practicas]
schema_version: 1.0.0
---

# Procedimientos Operativos Estandarizados (state/PLAYBOOK.md)

Este documento define las recetas operativas paso a paso para la generación de recursos didácticos por materia escolar y la compilación de documentos.

---

## 1. Flujo de Ejecución de Procedimientos

```mermaid
flowchart TD
    Req["Solicitud de Recurso Didáctico"] --> SOP["1. Seleccionar Receta en state/PLAYBOOK.md"]
    SOP --> Scratch["2. Formular Parámetros en state/SCRATCHPAD.md"]
    Scratch --> Exec["3. Cómputo & Esquemática en src/<Materia>/"]
    Exec --> Compile["4. Inyección en Plantilla & Compilación (Typst / Quarto)"]
    Compile --> DoD["5. Validación Visual y DoD (mypy, pytest)"]
    DoD --> Progress["6. Actualizar state/PROGRESS.md y state/MEMORY.md"]
```

---

## 2. Receta 1: Creación de Recurso para Circuitos (`src/Circuitos/`)

1. **Parámetros & Unidades:** Definir resistencias, inductancias y capacitancias validando unidades con `pint` en `src/Circuitos/`.
2. **Esquema Vectorial:** Construir el diagrama con `schemdraw.Drawing()` y exportar a `output/circuitos/<nombre>.svg`.
3. **Respuesta Transitoria / Bode:** Calcular función $H(s)$ con `sympy` y respuesta con `scipy.signal`.
4. **Compilación PDF:** Inyectar en plantilla `templates/typst/guia_circuitos.typ` y ejecutar `typst compile`.

---

## 3. Receta 2: Creación de Recurso para Electromagnetismo (`src/Electromagnetismo/`)

1. **Cálculo de Campos:** Definir potencial $V(x,y,z)$ y obtener $\vec{E} = -\nabla V$ con `sympy.vector`.
2. **Visualización 2D/3D:** Graficar líneas de campo y superficies equipotenciales con `matplotlib` / `plotly` hacia `output/electro/`.
3. **Compilación PDF/HTML:** Renderizar guía con ecuaciones de Maxwell en Typst o reporte dinámico en Quarto (`.qmd`).

---

## 4. Receta 3: Creación de Recurso para Telecomunicaciones (`src/Telecomunicaciones/`)

1. **Señales & Modulación:** Generar modulación (AM, FM, QAM, PSK) y espectro FFT con `numpy` y `scipy.signal`.
2. **Gráficos & Constelaciones:** Exportar diagramas de constelación y trazas temporales a SVG con `matplotlib`.
3. **Compilación PDF:** Inyectar parámetros y gráficas en plantilla didáctica.

---

## 5. Receta 4: Creación de Recurso para VHDL y Lógica Digital (`src/VHDL/`)

1. **Lógica & Tablas:** Simplificar función con `sympy.logic` y generar tabla de verdad con `tabulate`.
2. **Esquema de Compuertas:** Dibujar diagrama lógico con `schemdraw.logic`.
3. **Código VHDL & Testbench:** Renderizar plantilla Jinja2 `.vhd` y compilar examen en Typst.

---

## 6. Receta 5: Diagnóstico y Prototipado en Sandbox

1. **Script Temporal:** Crear `sandbox/test_<materia>_proto.py` y anotar hipótesis en `state/SCRATCHPAD.md`.
2. **Promoción:** Mover código validado a `src/<Materia>/`, agregar test en `tests/` y limpiar `sandbox/`.
