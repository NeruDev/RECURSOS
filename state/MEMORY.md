---
id: 05_memory
name: memory
title: "Memoria Semántica y Lecciones del Sistema Didáctico"
file_path: state/MEMORY.md
version: 1.1.0
category: memory
tags: [memory, state, python314, quarto, typst, latex, schemdraw, gotchas, vhdl, git-lfs]
description: "Memoria semántica permanente: lecciones aprendidas, compatibilidad de librerías y decisiones de diseño técnico."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T21:40:00Z
updated_at: 2026-09-02T00:15:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture, 03_glossary, 04_buenas_practicas]
schema_version: 1.0.0
---

# Memoria Semántica del Sistema (state/MEMORY.md)

Memoria a largo plazo del repositorio para registrar reglas aprendidas, compatibilidad de runtime y heurísticas de ejecución.

---

## 1. Heurísticas y Lecciones Aprendidas

- **2026-09-01 21:40 - Ecosistema Científico en Python 3.14.6:**
  - `numpy` (2.5.2), `scipy` (1.18.1), `matplotlib` (3.11.1), `pandas` (3.0.5) y `pillow` (12.3.0) cuentan con ruedas precompiladas para Windows x64 (`cp314`).
  - No compilar paquetes C/Fortran manualmente; usar el gestor de paquetes de `.venv`.
- **2026-09-01 21:41 - Integración Quarto / VS Code:**
  - Kernel registrado: `recursos-didacticos` apuntando a `.venv\Scripts\python.exe`.
  - Quarto (`v1.9.38`) y Typst (`v0.15.1`) están en PATH y se invocan de forma no interactiva vía CLI (`typst compile`, `quarto render`).
- **2026-09-01 21:55 - Modularidad por Materia Escolar:**
  - Cada materia (`src/Circuitos/`, `src/Electromagnetismo/`, `src/Telecomunicaciones/`, `src/VHDL/`) es un submódulo independiente.
  - La salida gráfica (diagramas de circuitos, campos, espectros) debe emitirse siempre en formato vectorial (`.svg` / `.pdf`) hacia `output/`.
- **2026-09-02 00:10 - Estilizado Vectorial Typst y Gestión Git LFS:**
  - Typst 0.15.1 permite colorear subexpresiones matemáticas mediante reglas `show math.equation` con expresiones regulares (`show regex("[01]"): ...`), aplicando estilos selectivos a variables, números y operadores lógicos.
  - La gestión de imágenes rasterizadas (`.png`) y documentos (`.pdf`) en `output/` se centraliza mediante `.gitattributes` con filtros Git LFS (`filter=lfs diff=lfs merge=lfs -text`), mientras que las imágenes vectoriales `.svg` permanecen como texto plano XML normalizado con finales de línea `LF`.
  - En diseño lógico y VHDL, el Teorema de Expansión de Shannon provee el vínculo directo entre el álgebra booleana y la arquitectura de hardware (multiplexores 2:1 y Look-Up Tables de FPGAs).
- **2026-09-03 23:48 - Inviabilidad de Bypass PDF para Fórmulas Matemáticas OMML:**
  - El formato PDF aplana el árbol de sintaxis abstracta (AST) de las matemáticas a primitivas de renderizado 2D (coordenadas, glifos de fuentes y trazos vectoriales).
  - Los motores estándar de conversión PDF a DOCX (`pdf2docx`, MS Word Reflow, Adobe Acrobat, Poppler) NO poseen reconstructores semánticos de ecuaciones: emiten `0` elementos `<m:oMath>`, omiten barras de fracción y radicales, y convierten los símbolos en texto plano Unicode plano o fragmentado.
  - Para obtener Word nativo con OMML editable (`<m:oMathPara>`, `<m:oMath>`, `<m:f>`, `<m:rad>`), los métodos deterministas son:
    1. `markdocx` (Python con hoja `MML2OMML.XSL` de Microsoft Office).
    2. Bypass estructurado LaTeX: `Markdown -> LaTeX (.tex) -> Word (.docx)` vía Pandoc.
    3. Bypass estructurado HTML+MathML: `Markdown -> HTML (MathML) -> Word (.docx)` vía Pandoc.
    4. Saneamiento sintáctico Markdown: eliminar líneas vacías dentro de `$$`, evitar espacios interiores en `$ ... $` y desanidar `$$` de listas con sangría.

