---
id: 02_architecture
name: architecture
title: "Arquitectura del Sistema de Generación de Recursos Didácticos"
file_path: docs/ARCHITECTURE.md
version: 1.0.0
category: architecture
tags: [architecture, recursos-didacticos, circuitos, electromagnetismo, telecomunicaciones, vhdl, quarto, typst, latex, pdf, python]
description: "Especificación arquitectónica modular y pipeline de generación de recursos didácticos para Circuitos, Electromagnetismo, Telecomunicaciones y VHDL mediante Python, Typst, Quarto y LaTeX."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T21:50:00Z
updated_at: 2026-09-01T22:12:00Z
dependencies: [00_agents_contract, 01_readme]
related_specs: [03_glossary, 04_buenas_practicas, 05_memory, 06_playbook, 07_progress, 08_scratchpad]
schema_version: 1.0.0
---

# Arquitectura del Sistema de Recursos Didácticos (ARCHITECTURE.md)

Este documento define la **topología modular, fronteras de dominio, flujo de transformación y estándares de exportación** del sistema de generación de recursos didácticos para **Circuitos**, **Electromagnetismo**, **Telecomunicaciones** y **VHDL**.

---

## 1. Visión y Principios de Diseño

El sistema transforma conceptos de ingeniería eléctrica, electrónica y telecomunicaciones en documentos pedagógicos de alta calidad visual y editorial (PDF, HTML y diapositivas), operando bajo los siguientes principios:

1. **Modularidad por Disciplina Técnica:** Cada materia (`Circuitos`, `Electromagnetismo`, `Telecomunicaciones`, `VHDL`) reside en su propio módulo en `src/` con utilidades de cómputo, esquemas y visualización específicos.
2. **Separación entre Cómputo y Presentación:** El cálculo analítico/numérico y la síntesis esquemática se desacoplan por completo de la sintaxis del documento final (Typst, Quarto o LaTeX).
3. **Salida Vectorial de Alta Definición:** Todos los diagramas de circuitos, líneas de campo, espectros de frecuencia y esquemas lógicos se generan en formatos vectoriales (`.svg`, `.pdf`) para garantizar nitidez tipográfica en impresión y pantalla.
4. **Determinismo y Reproducibilidad:** Las mismas funciones y parámetros de entrada producen idénticos recursos didácticos sin efectos colaterales.

---

## 2. Topología del Sistema y Capas Arquitectónicas

El sistema adopta una **Arquitectura en Capas de Pipeline Modular (*Modular Pipeline Architecture*)** estructurada en cuatro niveles bien definidos:

```mermaid
flowchart TD
    subgraph Capa_CLI ["1. Capa de Entrada e Interfaz"]
        CLI["CLI / Scripts de Generación"]
        Notebooks["Jupyter Notebooks Interactivos"]
    end

    subgraph Capa_Materias ["2. Capa de Dominio Didáctico (src/)"]
        Circuitos["src/Circuitos/ (Kirchhoff, RLC, Bode, Schemdraw)"]
        Electro["src/Electromagnetismo/ (Maxwell, Campos 2D/3D)"]
        Telecom["src/Telecomunicaciones/ (FFT, Modulación AM/FM/QAM)"]
        VHDL["src/VHDL/ (Lógica Booleana, FSM, Código VHDL)"]
    end

    subgraph Capa_Motores ["3. Capa de Cómputo, Visualización & Plantillas"]
        Simbolico["SymPy & NumPy (Fórmulas Analíticas & Cómputo)"]
        Senales["SciPy.signal (Frecuencia, Filtros & FFT)"]
        Esquemas["Schemdraw & boolean.py (Esquemas de Circuitos & Compuertas)"]
        Graficos["Matplotlib, Seaborn & Plotly (Campos & Espectros)"]
        Templating["Jinja2 Engine (Renderizador de Plantillas .typ / .qmd / .tex)"]
    end

    subgraph Capa_Exportacion ["4. Capa de Compilación y Exportación"]
        TypstCLI["Typst CLI -> PDFs Editoriales (.typ)"]
        QuartoCLI["Quarto CLI -> Documentos & Slides (.qmd)"]
        LatexEngine["MiKTeX / pdflatex -> Reportes LaTeX (.tex)"]
        DirectPDF["ReportLab / PyPDF -> Fichas & Merge PDF"]
    end

    CLI --> Capa_Materias
    Notebooks --> Capa_Materias

    Circuitos --> Simbolico & Senales & Esquemas
    Electro --> Simbolico & Graficos
    Telecom --> Senales & Graficos
    VHDL --> Simbolico & Esquemas

    Simbolico & Senales & Esquemas & Graficos --> Templating

    Templating --> TypstCLI
    Templating --> QuartoCLI
    Templating --> LatexEngine
    Templating --> DirectPDF
```

---

## 3. Delimitación de Módulos y Responsabilidades

| **Capa / Módulo** | **Ruta en Repositorio** | **Responsabilidad Principal** | **Librerías / Tecnologías Clave** |
|:---|:---|:---|:---|
| **Configuración Core** | `src/core/` | Parámetros globales inmutables, rutas de salida y utilidades de renderizado. | `@dataclass(frozen=True)`, `pathlib` |
| **Memoria y Estado** | `state/` | Persistencia agéntica (Semántica, Procedimental/SOPs, Trabajo, Episódica). | `MEMORY.md`, `PLAYBOOK.md`, `PROGRESS.md`, `SCRATCHPAD.md` |
| **Circuitos** | `src/Circuitos/` | Análisis CD/CA, transitorios RLC, diagramas de Bode y generación de esquemas circuitales. | `schemdraw`, `sympy`, `scipy.signal`, `pint` |
| **Electromagnetismo** | `src/Electromagnetismo/` | Ecuaciones de Maxwell, operadores diferenciales vectoriales, líneas de campo y superficies 3D. | `sympy.vector`, `numpy`, `matplotlib`, `plotly` |
| **Telecomunicaciones** | `src/Telecomunicaciones/` | Análisis espectral (FFT), modulaciones analógicas/digitales (AM, FM, QAM, PSK) y diagramas de constelación. | `scipy.signal`, `numpy`, `matplotlib`, `plotly` |
| **VHDL** | `src/VHDL/` | Álgebra booleana, tablas de verdad, diagramas de compuertas lógicas, síntesis de FSM y emisión de código VHDL. | `sympy.logic`, `boolean.py`, `schemdraw.logic`, `jinja2` |
| **Plantillas** | `templates/` (`typst/`, `quarto/`, `latex/`) | Diseños base parametrizados para exámenes, guías de estudio, formularios y diapositivas. | `jinja2`, `.typ`, `.qmd`, `.tex` |
| **Exportador** | `src/core/exporter.py` | Invocación de compiladores locales (`typst`, `quarto`, `pdflatex`) y gestión de salida. | `subprocess`, `pypdf`, `reportlab` |
| **Salida (Artefactos)** | `output/` | Destino final de los recursos generados (`.pdf`, `.svg`, `.html`). | *Ignorado en Git* |

---

## 4. Flujo de Secuencia: Generación de un Recurso Didáctico

El siguiente diagrama detalla el flujo secuencial estándar para la creación y compilación de una guía o examen didáctico:

```mermaid
sequenceDiagram
    autonumber
    actor Usuario as Docente / Desarrollador
    participant Modulo as Módulo de Materia (src/Circuitos/ etc.)
    participant Motor as Motores (SymPy / Schemdraw / SciPy)
    participant Plantilla as Renderizador Jinja2
    participant Compilador as Compilador Externo (Typst / Quarto)
    participant Salida as Archivo PDF / HTML (output/)

    Usuario->>Modulo: Solicitar Recurso (tema, parámetros, tipo de documento)
    Modulo->>Motor: Ejecutar cómputo, generar fórmulas LaTeX y diagramas vectoriales
    Motor-->>Modulo: Datos procesados (fórmulas .tex, tablas formateadas, paths de SVGs)
    Modulo->>Plantilla: Inyectar contexto estructurado en plantilla (.typ / .qmd / .tex)
    Plantilla-->>Compilador: Emitir archivo fuente listo para compilar
    Compilador->>Salida: Compilar y generar PDF final en output/
    Salida-->>Usuario: Recurso didáctico listo para distribución pedagógica
```

---

## 5. Invariantes Arquitectónicos y Reglas de Calidad

1. **Pureza Funcional en Cálculos:** Las funciones de cálculo analítico, procesamiento de señales y lógica digital deben ser puras (mismos argumentos retornan el mismo resultado) y no realizar llamadas directas al sistema de archivos.
2. **Tipado Estricto (Python 3.10+ PEP 585 & PEP 604):** Todos los módulos en `src/` deben incluir anotaciones de tipo nativas inline y validar con `mypy --strict`.
3. **Gestión Centralizada de Salidas:** Ningún script debe escribir archivos temporales o finales fuera del directorio `output/` o del directorio `sandbox/`.
4. **Independencia de Compilador:** La lógica de generación de datos y gráficos no depende del compilador final; un mismo conjunto de datos puede exportarse indistintamente a Typst, Quarto o LaTeX.
