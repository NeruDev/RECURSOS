---
id: 15_algebra_boole
name: algebra_boole
title: "Álgebra de Boole: Leyes, Teoremas e Identidades"
file_path: src/VHDL/algebra_boole.md
version: 1.1.0
category: guides
domain: VHDL
tags: [algebra-boole, logica-digital, vhdl, leyes-booleanas, teoremas, identidades]
description: "Compendio riguroso de leyes, teoremas e identidades del álgebra de Boole expresados en LaTeX para diseño digital, síntesis RTL y modelado en VHDL."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T23:45:00Z
updated_at: 2026-09-02T00:08:00Z
dependencies: [00_agents_contract, 14_temario_vhdl]
schema_version: 1.0.0
---

# Álgebra de Boole: Leyes, Teoremas e Identidades

> **Notación utilizada:**
> - Suma lógica (OR): $+$
> - Producto lógico (AND): $\cdot$ (o yuxtaposición $AB$)
> - Negación / Complemento (NOT): $\overline{A}$ o $A'$
> - Disyunción exclusiva (XOR): $\oplus$
> - Equivalencia lógica (XNOR): $\odot$

> **Principio de Dualidad:**
> Cualquier identidad algebraica booleana sigue siendo válida si los operadores suma ($+$) y producto ($\cdot$), así como los elementos neutros ($0$ y $1$), se intercambian mutuamente de forma simultánea.

---

## 1. Leyes Fundamentales y Elementos Notables

| Ley / Propiedad | Expresión OR | Expresión AND (Dual) |
| :--- | :--- | :--- |
| **Identidad / Elemento Neutro** | $A + 0 = A$ | $A \cdot 1 = A$ |
| **Dominación / Elemento Nulo** | $A + 1 = 1$ | $A \cdot 0 = 0$ |
| **Idempotencia** | $A + A = A$ | $A \cdot A = A$ |
| **Inverso / Complemento** | $A + \overline{A} = 1$ | $A \cdot \overline{A} = 0$ |
| **Doble Negación (Involución)** | $\overline{\overline{A}} = A$ | — |
| **Complemento de Constantes** | $\overline{0} = 1$ | $\overline{1} = 0$ |

---

## 2. Propiedades Algebraicas Fundamentales

| Ley / Propiedad | Expresión OR | Expresión AND (Dual) |
| :--- | :--- | :--- |
| **Conmutatividad** | $A + B = B + A$ | $A \cdot B = B \cdot A$ |
| **Asociatividad** | $A + (B + C) = (A + B) + C$ | $A \cdot (B \cdot C) = (A \cdot B) \cdot C$ |
| **Distributividad** | $A + (B \cdot C) = (A + B) \cdot (A + C)$ | $A \cdot (B + C) = (A \cdot B) + (A \cdot C)$ |

---

## 3. Leyes de De Morgan

| Descripción | Expresión |
| :--- | :--- |
| **De Morgan para Conjunción (NAND)** | $\overline{A \cdot B} = \overline{A} + \overline{B}$ |
| **De Morgan para Disyunción (NOR)** | $\overline{A + B} = \overline{A} \cdot \overline{B}$ |
| **Forma Generalizada ($n$ variables)** | $\overline{A_1 \cdot A_2 \cdot \dots \cdot A_n} = \overline{A_1} + \overline{A_2} + \dots + \overline{A_n}$<br>$\overline{A_1 + A_2 + \dots + A_n} = \overline{A_1} \cdot \overline{A_2} \cdot \dots \cdot \overline{A_n}$ |

---

## 4. Leyes de Absorción y Reducción

| Variación | Expresión OR | Expresión AND (Dual) |
| :--- | :--- | :--- |
| **Absorción Estándar** | $A + (A \cdot B) = A$ | $A \cdot (A + B) = A$ |
| **Absorción con Complemento (Eliminación)** | $A + (\overline{A} \cdot B) = A + B$ | $A \cdot (\overline{A} + B) = A \cdot B$ |
| **Variante Inversa del Complemento** | $\overline{A} + (A \cdot B) = \overline{A} + B$ | $\overline{A} \cdot (A + B) = \overline{A} \cdot B$ |

---

## 5. Teoremas Avanzados de Simplificación

### Teorema del Consenso
Permite eliminar términos redundantes que dependen de una variable y su complemento:

- **Forma Suma de Productos (SOP):**
  $$A \cdot B + \overline{A} \cdot C + B \cdot C = A \cdot B + \overline{A} \cdot C$$
- **Forma Producto de Sumas (POS / Dual):**
  $$(A + B) \cdot (\overline{A} + C) \cdot (B + C) = (A + B) \cdot (\overline{A} + C)$$

### Teorema de Transposición
- $A \cdot B + \overline{A} \cdot C = (A + C) \cdot (\overline{A} + B)$

### Teorema de Expansión de Shannon
Constituye el fundamento matemático para la síntesis de multiplexores (MUX 2:1) y la descomposición funcional en tablas de búsqueda (*Look-Up Tables*, LUTs) de FPGAs:

- **Forma Suma de Productos (SOP / Expansión canónica):**
  $$f(A, B, C, \dots) = A \cdot f(1, B, C, \dots) + \overline{A} \cdot f(0, B, C, \dots)$$
- **Forma Producto de Sumas (POS / Dual de Shannon):**
  $$f(A, B, C, \dots) = (A + f(0, B, C, \dots)) \cdot (\overline{A} + f(1, B, C, \dots))$$

---

## 6. Operadores Derivados (XOR y XNOR)

### Definiciones
- **XOR (OR Exclusivo):** $A \oplus B = A \cdot \overline{B} + \overline{A} \cdot B = (A + B) \cdot (\overline{A} + \overline{B})$
- **XNOR (Equivalencia):** $A \odot B = \overline{A \oplus B} = A \cdot B + \overline{A} \cdot \overline{B} = (A + \overline{B}) \cdot (\overline{A} + B)$

### Propiedades Notables de XOR
- $A \oplus 0 = A$
- $A \oplus 1 = \overline{A}$
- $A \oplus A = 0$
- $A \oplus \overline{A} = 1$
- $A \oplus B = B \oplus A$ (Conmutativa)
- $(A \oplus B) \oplus C = A \oplus (B \oplus C)$ (Asociativa)

### Propiedades Notables de XNOR (Duales de XOR)
- $A \odot 1 = A$
- $A \odot 0 = \overline{A}$
- $A \odot A = 1$
- $A \odot \overline{A} = 0$
- $A \odot B = B \odot A$ (Conmutativa)
- $(A \odot B) \odot C = A \odot (B \odot C)$ (Asociativa)

### Identidades de Alto Impacto en VHDL (Síntesis RTL)
Utilizadas frecuentemente en sumadores, árboles de paridad, generadores CRC y registros de desplazamiento con retroalimentación lineal (LFSR):

- **Intercambio de Negación en XOR / XNOR:**
  $$\overline{A \oplus B} = A \odot B = \overline{A} \oplus B = A \oplus \overline{B}$$
- **Distributividad del AND sobre XOR:**
  $$A \cdot (B \oplus C) = (A \cdot B) \oplus (A \cdot C)$$
