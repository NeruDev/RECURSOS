---
id: 03_glossary
name: glossary
title: "Glosario Ontológico y Lenguaje Ubicuo del Sistema Didáctico"
file_path: GLOSSARY.md
version: 1.0.0
category: standards
tags: [glossary, domain, ubiquitous-language, ontology, semantic-anchoring, circuitos, electromagnetismo, telecomunicaciones, vhdl]
description: "Diccionario ontológico y anclaje semántico de términos de dominio, entidades de recursos didácticos e invariantes pedagógicos del sistema."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-08-29T21:00:00Z
updated_at: 2026-09-01T22:18:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture]
schema_version: 1.0.0
---

# Glosario Ontológico y Lenguaje Ubicuo (GLOSSARY.md)

Este documento constituye el **anclaje semántico y diccionario de lenguaje ubicuo** del sistema de generación de recursos didácticos. Su objetivo es prevenir la deriva conceptual y desambiguar términos técnicos entre desarrolladores humanos y agentes de IA.

---

## 1. Entidades Propias del Dominio

| Entidad / Concepto | Definición Canónica en este Repositorio | Atributos Clave / Invariantes |
|:---|:---|:---|
| **`RecursoDidactico`** | Unidad pedagógica final (guía de estudio, examen, formulario, presentación) generada a partir de cómputo y plantillas. | Posee metadatos estructurados, materia asociada y compilación a PDF/HTML. |
| **`Materia`** | Módulo de dominio especializado (`Circuitos`, `Electromagnetismo`, `Telecomunicaciones`, `VHDL`) con lógica de cómputo propia. | Cada materia reside en `src/<Materia>/` y no depende de otras materias. |
| **`EsquemaVectorial`** | Diagrama técnico de circuito, compuerta digital o línea de campo generado programáticamente en formato vectorial. | Exportado exclusivamente en `.svg` o `.pdf` hacia `output/<materia>/`. |
| **`PlantillaDidactica`** | Archivo base estructurado (`.typ`, `.qmd`, `.tex`) con marcadores para inyección de datos y fórmulas LaTeX vía Jinja2. | Debe ser independiente de la plataforma y reutilizable por temas. |
| **`TablaVerdad`** | Matriz evaluada de lógica booleana con combinaciones de entrada y salidas simplificadas. | Formateada con `tabulate` para su incrustación en Markdown/Typst/LaTeX. |

---

## 2. Términos Polisémicos y Desambiguación

| Término | Significado General en la Industria | **Significado Estricto en este Repositorio** |
|:---|:---|:---|
| **`Circuito`** | Cualquier red eléctrica, electrónica o lógica | Circuito analógico/eléctrico (CD/CA, RLC, Kirchhoff) modelado en `src/Circuitos/` con `schemdraw`. |
| **`Lógica Digital`** | Álgebra abstracta o condicionales de software | Lógica booleana, compuertas y síntesis de hardware descritas en `src/VHDL/`. |
| **`Simbolismo`** | Metáfora o representación abstracta | Cálculo analítico exacto con `sympy` (derivación, integración, Laplace, Maxwell) produciendo código LaTeX nativo. |
| **`FSM`** | Máquina de estados en software/juegos | *Finite State Machine* para circuitos secuenciales digitales modelada con tablas de estado y código VHDL sintetizable. |
| **`Pipeline`** | Tubería CI/CD o procesamiento de datos | Flujo determinista: `Cómputo en src/ -> Esquema Vectorial -> Renderizado Jinja2 -> Compilador Typst/Quarto -> PDF`. |
| **`Sandbox`** | Entorno virtual o contenedor | Directorio aislado (`sandbox/`) con *Blast Radius Controlado* para prototipar scripts `proto_<materia>_*.py`. |

---

## 3. Invariantes del Negocio (Guardrails de Dominio)

Reglas inmutables del dominio que todo desarrollador y agente de IA `MUST` respetar:

1. **Invariante de Calidad Vectorial:** Todo diagrama esquemático, gráfico de respuesta o mapa de campos debe generarse en formato vectorial (`.svg`, `.pdf`) para garantizar nitidez tipográfica en impresión.
2. **Invariante de Desacoplamiento de Cómputo:** Los módulos de cálculo en `src/<Materia>/` no deben contener código acoplado a la sintaxis de un compilador específico; emiten datos estructurados, fórmulas LaTeX y rutas de assets.
3. **Invariante de Pureza Funcional:** Las funciones matemáticas, simplificaciones booleanas y análisis espectrales deben ser puras (mismos argumentos generan idéntico resultado).
4. **Invariante de Identidad Canónica:** Todos los archivos de documentación y estado deben identificarse mediante el estándar **Slug Secuencial Numérico (`XX_snake_case`)**.
