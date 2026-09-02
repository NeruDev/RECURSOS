---
id: 08_scratchpad
name: scratchpad
title: "Memoria de Trabajo, Hipótesis y Plan de Ejecución Didáctico"
file_path: state/SCRATCHPAD.md
version: 1.0.0
category: memory
tags: [scratchpad, plan, working-memory, hipotesis, circuitos, electromagnetismo, telecomunicaciones, vhdl]
description: "Memoria de trabajo temporal del agente para la formulación de hipótesis técnicas, diseño de esquemas y borradores de planificación previos a la mutación de código."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T22:00:00Z
updated_at: 2026-09-01T22:45:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture, 03_glossary, 04_buenas_practicas]
schema_version: 1.0.0
---

# Memoria de Trabajo y Borrador de Ejecución (state/SCRATCHPAD.md)

Este documento constituye la **memoria de trabajo temporal (*Working Memory*)** del agente. Funciona como un espacio de borrador estructurado para formular hipótesis, descomponer problemas pedagógicos y evaluar alternativas antes de escribir código permanente.

---

## 1. Ciclo de Razonamiento y Mutación

```mermaid
flowchart TD
    Task["Tarea de Generación o Refactor"] --> Hypo["1. Formular Hipótesis en state/SCRATCHPAD.md"]
    Hypo --> Sandbox["2. Prototipar en sandbox/"]
    Sandbox --> Eval{"¿Cálculo y gráfico correctos?"}
    Eval -->|"❌ No"| Adjust["Ajustar parámetros / fórmulas"]
    Adjust --> Sandbox
    Eval -->|"✅ Sí"| Commit["3. Trasladar a src/<Materia>/ y compilar PDF"]
    Commit --> Done["4. Limpiar Scratchpad / Registrar en PROGRESS.md"]
```

---

## 2. Sesión Activa / Tarea en Curso

- **Objetivo Actual:** `[Definir objetivo de la sesión o recurso a construir]`
- **Materia Involucrada:** `Circuitos` | `Electromagnetismo` | `Telecomunicaciones` | `VHDL`
- **Ficheros Afectados:** `src/<Materia>/`, `templates/`, `tests/`

---

## 3. Hipótesis Técnicas y Decisiones de Modelado

### Hipótesis A:
- **Enfoque:** `[Descripción del modelado matemático o circuito]`
- **Validación con Sandbox:** `sandbox/proto_<materia>.py`
- **Resultado Esperado:** `[Fórmulas analíticas LaTeX, gráfico SVG o PDF generado]`

---

## 4. Checklist de Validación Rápida (DoD)

- [ ] Código numérico y simbólico probado en `.venv`
- [ ] Esquema vectorial exportado a SVG/PDF sin pérdidas
- [ ] Plantilla Typst/Quarto compilada sin advertencias
- [ ] Tipos estáticos verificados con `mypy --strict`
- [ ] Actualización de estado en `PROGRESS.md`
