// =============================================================================
// Formulario Didáctico: Álgebra de Boole (Leyes, Teoremas e Identidades)
// Referencia Formal para Diseño Digital y Modelado VHDL
// Ordenado de Izquierda a Derecha con Notación Matemática Didáctica
// =============================================================================

#set page(
  width: 350mm,
  height: auto,
  margin: (x: 14mm, top: 12mm, bottom: 12mm),
  fill: rgb("#f8fafc")
)

#set text(
  font: ("Segoe UI", "Calibri", "DejaVu Sans", "Arial"),
  size: 9.4pt,
  fill: rgb("#0f172a")
)

// =============================================================================
// PALETA DE COLORES DIDÁCTICOS DE ALTA LEGIBILIDAD
// =============================================================================
#let col-var   = rgb("#1d4ed8") // 🔵 Azul Real para Variables y Funciones (A, B, C, n, f)
#let col-num   = rgb("#dc2626") // 🔴 Rojo Carmesí para Números y Constantes (0, 1)
#let col-neg   = rgb("#7c3aed") // 🟣 Púrpura / Violeta para Líneas de Negación (Overline)
#let col-op    = rgb("#059669") // 🟢 Verde Esmeralda para Símbolos de Operación (+, ·, ⊕, ⊙)
#let col-head  = rgb("#0f172a") // Azul Marino Oscuro para Títulos Principales

// Reglas show para colorear automáticamente símbolos matemáticos
#show math.overline: set text(fill: col-neg)

#show math.equation: it => {
  // Números y Constantes en Rojo
  show regex("[01]"): match => text(fill: col-num, weight: "bold", match.text)
  // Variables y funciones lógicas en Azul
  show regex("[A-C]"): match => text(fill: col-var, weight: "bold", style: "italic", match.text)
  show regex("\bn\b"): match => text(fill: col-var, weight: "bold", style: "italic", match.text)
  // Símbolos de Operación en Verde Esmeralda (+, ·, ⊕, ⊙)
  show regex("[+⊕⊙\u{22c5}\u{00b7}]"): match => text(fill: col-op, weight: "bold", match.text)
  it
}

// Componente para tarjetas modulares
#let card(title, badge-text, brand-color, body) = block(
  width: 100%,
  stroke: 1pt + brand-color.lighten(60%),
  radius: 7pt,
  fill: rgb("#ffffff"),
  inset: 0pt,
  clip: true,
  [
    #block(
      width: 100%,
      fill: brand-color.lighten(92%),
      inset: (x: 12pt, y: 7pt),
      stroke: (bottom: 1pt + brand-color.lighten(60%)),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [#text(fill: brand-color.darken(25%), weight: "bold", size: 10.8pt, title)],
          [
            #box(
              fill: brand-color.lighten(75%),
              radius: 4pt,
              inset: (x: 6pt, y: 2.5pt),
              [#text(fill: brand-color.darken(35%), size: 8pt, weight: "bold", badge-text)]
            )
          ]
        )
      ]
    )
    #block(
      width: 100%,
      inset: (x: 8pt, y: 8pt),
      body
    )
  ]
)

// Estilo unificado de tabla
#let styled-table(col-widths, headers, ..rows) = table(
  columns: col-widths,
  stroke: (x, y) => if y == 0 {
    (bottom: 1.5pt + rgb("#94a3b8"))
  } else {
    (bottom: 0.5pt + rgb("#e2e8f0"))
  },
  fill: (col, row) => if row == 0 {
    rgb("#f1f5f9")
  } else if calc.even(row) {
    rgb("#f8fafc")
  } else {
    rgb("#ffffff")
  },
  align: (col, row) => if row == 0 {
    center + horizon
  } else if col == 0 {
    left + horizon
  } else {
    center + horizon
  },
  inset: (x: 5pt, y: 5.5pt),
  ..headers.map(h => text(weight: "bold", size: 9.1pt, fill: rgb("#1e293b"), h)),
  ..rows.pos()
)

// -----------------------------------------------------------------------------
// ENCABEZADO Y LEYENDA DIDÁCTICA
// -----------------------------------------------------------------------------
#block(
  width: 100%,
  stroke: 1pt + rgb("#e2e8f0"),
  fill: rgb("#ffffff"),
  radius: 8pt,
  inset: 12pt,
  [
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [
        #text(size: 19pt, weight: "bold", fill: col-head, [Álgebra de Boole: Leyes, Teoremas e Identidades])
        #v(2pt)
        #text(size: 9.8pt, fill: rgb("#64748b"), [Compendio gráfico formal y referencial para diseño digital, síntesis lógica RTL y modelado en VHDL])
      ],
      [
        #box(
          stroke: 1pt + rgb("#e2e8f0"),
          fill: rgb("#f8fafc"),
          radius: 6pt,
          inset: 7pt,
          [
            #text(weight: "bold", size: 8.6pt, fill: rgb("#334155"), [Leyenda de Notación y Colores Didácticos:])
            #v(3pt)
            #grid(
              columns: (auto, auto, auto, auto),
              gutter: 6pt,
              align: horizon,
              [#box(fill: col-var.lighten(85%), inset: 3.5pt, radius: 3pt, text(fill: col-var, weight: "bold", size: 8.3pt, [● Variables: $A, B, C, n, f$]))],
              [#box(fill: col-num.lighten(88%), inset: 3.5pt, radius: 3pt, text(fill: col-num, weight: "bold", size: 8.3pt, [● Números: $0, 1$]))],
              [#box(fill: col-neg.lighten(88%), inset: 3.5pt, radius: 3pt, text(fill: col-neg, weight: "bold", size: 8.3pt, [● Negación: $overline(A)$]))],
              [#box(fill: col-op.lighten(88%), inset: 3.5pt, radius: 3pt, text(fill: col-op, weight: "bold", size: 8.3pt, [● Operadores: $+$, $dot$, $xor$, $⊙$]))]
            )
          ]
        )
      ]
    )
    #v(6pt)
    #box(
      width: 100%,
      fill: rgb("#f0fdf4"),
      stroke: 0.5pt + rgb("#86efac"),
      radius: 5pt,
      inset: (x: 10pt, y: 5pt),
      [
        #text(size: 8.5pt, fill: rgb("#166534"), [
          *Principio de Dualidad (Axioma Estructural):* Cualquier identidad algebraica booleana válida sigue siendo verdadera si los operadores ($+$ $arrow.l.r$ $dot$) y los elementos neutros/constantes ($0$ $arrow.l.r$ $1$) se intercambian mutuamente de manera simultánea en toda la expresión.
        ])
      ]
    )
  ]
)

#v(10pt)

// -----------------------------------------------------------------------------
// GRID PRINCIPAL ORDENADO DE IZQUIERDA A DERECHA (FILA POR FILA)
// Fila 1: 1 (Leyes Fundamentales) -> 2 (Propiedades Algebraicas)
// Fila 2: 3 (Leyes de De Morgan)    -> 4 (Leyes de Absorción)
// Fila 3: 5 (Teoremas Avanzados)    -> 6 (Operadores Derivados & RTL)
// -----------------------------------------------------------------------------
#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,
  
  // ========================== FILA 1 (1 -> 2) ==========================
  // [1] LEYES FUNDAMENTALES Y ELEMENTOS NOTABLES (Izquierda)
  card(
    [1. Leyes Fundamentales y Elementos Notables],
    [Axiomas & Variable Única],
    rgb("#0284c7"),
    styled-table(
      (1.1fr, 1.45fr, 1.45fr),
      ([Ley / Propiedad], [Expresión OR ($+$)], [Expresión AND (Dual $dot$)]),
      [#strong[Identidad / Neutro]], [$A + 0 = A$], [$A dot 1 = A$],
      [#strong[Dominación / Nulo]], [$A + 1 = 1$], [$A dot 0 = 0$],
      [#strong[Idempotencia]], [$A + A = A$], [$A dot A = A$],
      [#strong[Inverso / Complemento]], [$A + overline(A) = 1$], [$A dot overline(A) = 0$],
      [#strong[Doble Negación (Involución)]], [$overline(overline(A)) = A$], [—],
      [#strong[Complemento de Constantes]], [$overline(0) = 1$], [$overline(1) = 0$]
    )
  ),

  // [2] PROPIEDADES ALGEBRAICAS (Derecha)
  card(
    [2. Propiedades Algebraicas Fundamentales],
    [Estructura de Retículo],
    rgb("#059669"),
    [
      #styled-table(
        (1.05fr, 1.48fr, 1.47fr),
        ([Ley / Propiedad], [Expresión OR ($+$)], [Expresión AND (Dual $dot$)]),
        [#strong[Conmutatividad]],
        [$A + B = B + A$],
        [$A dot B = B dot A$],

        [#strong[Asociatividad]],
        [$A + (B + C) = (A + B) + C$],
        [$A dot (B dot C) = (A dot B) dot C$],

        [#strong[Distributividad]],
        [$A + (B dot C) = (A + B) dot (A + C)$],
        [$A dot (B + C) = (A dot B) + (A dot C)$]
      )
      #v(6pt)
      #box(
        width: 100%,
        fill: rgb("#f8fafc"),
        stroke: 0.5pt + rgb("#cbd5e1"),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: rgb("#475569"), [
            *Nota de Síntesis:* La segunda forma distributiva ($A + B dot C = (A + B) dot (A + C)$) es exclusiva del álgebra de Boole y no existe en el álgebra ordinaria; es clave para factorizar compuertas OR multinivel.
          ])
        ]
      )
    ]
  ),

  // ========================== FILA 2 (3 -> 4) ==========================
  // [3] LEYES DE DE MORGAN (Izquierda)
  card(
    [3. Leyes de De Morgan],
    [Dualidad & Inversión],
    rgb("#7c3aed"),
    styled-table(
      (1fr, 3fr),
      ([Descripción de la Ley], [Expresión Matemática Equivalente]),
      [#strong[De Morgan Conjunción (NAND)]],
      [$overline(A dot B) = overline(A) + overline(B)$],

      [#strong[De Morgan Disyunción (NOR)]],
      [$overline(A + B) = overline(A) dot overline(B)$],

      [#strong[Forma Generalizada\ ($n$ variables)]],
      [
        $overline(A_1 dot A_2 dot ... dot A_n) = overline(A)_1 + overline(A)_2 + ... + overline(A)_n$
        #v(4pt)
        $overline(A_1 + A_2 + ... + A_n) = overline(A)_1 dot overline(A)_2 dot ... dot overline(A)_n$
      ]
    )
  ),

  // [4] LEYES DE ABSORCIÓN Y REDUCCIÓN (Derecha)
  card(
    [4. Leyes de Absorción y Reducción],
    [Simplificación de Términos],
    rgb("#d97706"),
    styled-table(
      (1.05fr, 1.48fr, 1.47fr),
      ([Variación / Caso], [Expresión OR ($+$)], [Expresión AND (Dual $dot$)]),
      [#strong[Absorción Estándar]],
      [$A + (A dot B) = A$],
      [$A dot (A + B) = A$],

      [#strong[Con Complemento\ (Eliminación)]],
      [$A + (overline(A) dot B) = A + B$],
      [$A dot (overline(A) + B) = A dot B$],

      [#strong[Variante Inversa del Complemento]],
      [$overline(A) + (A dot B) = overline(A) + B$],
      [$overline(A) dot (A + B) = overline(A) dot B$]
    )
  ),

  // ========================== FILA 3 (5 -> 6) ==========================
  // [5] TEOREMAS AVANZADOS DE SIMPLIFICACIÓN (Izquierda)
  card(
    [5. Teoremas Avanzados de Simplificación],
    [Minimización Digital & RTL],
    rgb("#ea580c"),
    [
      #text(size: 9.2pt, weight: "bold", fill: rgb("#9a3412"), [Teorema del Consenso])
      #text(size: 8.1pt, fill: rgb("#64748b"), [ (Elimina términos redundantes y evita riesgos lógicos / hazards)])
      #v(2.5pt)
      #table(
        columns: (1fr, 3fr),
        stroke: 0.5pt + rgb("#e2e8f0"),
        fill: (col, row) => if calc.even(row) { rgb("#fff7ed") } else { rgb("#ffffff") },
        align: (left + horizon, center + horizon),
        inset: (x: 5pt, y: 4.5pt),
        [#strong[Forma SOP:]], [$A dot B + overline(A) dot C + B dot C = A dot B + overline(A) dot C$],
        [#strong[Forma POS (Dual):]], [$(A + B) dot (overline(A) + C) dot (B + C) = (A + B) dot (overline(A) + C)$]
      )
      #v(4.5pt)
      #text(size: 9.2pt, weight: "bold", fill: rgb("#9a3412"), [Teorema de Transposición])
      #v(2.5pt)
      #table(
        columns: (1fr),
        stroke: 0.5pt + rgb("#fed7aa"),
        fill: rgb("#fffaf5"),
        align: center + horizon,
        inset: 4.5pt,
        [$A dot B + overline(A) dot C = (A + C) dot (overline(A) + B)$]
      )
      #v(4.5pt)
      #text(size: 9.2pt, weight: "bold", fill: rgb("#9a3412"), [Teorema de Expansión de Shannon])
      #text(size: 8.1pt, fill: rgb("#64748b"), [ (Base de MUX 2:1 y Look-Up Tables en FPGAs)])
      #v(2.5pt)
      #table(
        columns: (1fr, 3fr),
        stroke: 0.5pt + rgb("#fed7aa"),
        fill: (col, row) => if calc.even(row) { rgb("#fff7ed") } else { rgb("#ffffff") },
        align: (left + horizon, center + horizon),
        inset: (x: 5pt, y: 4.5pt),
        [#strong[Forma SOP (Canónica):]], [$f(A, B, C, ...) = A dot f(1, B, C, ...) + overline(A) dot f(0, B, C, ...)$],
        [#strong[Forma POS (Dual):]], [$f(A, B, C, ...) = (A + f(0, B, C, ...)) dot (overline(A) + f(1, B, C, ...))$]
      )
    ]
  ),

  // [6] OPERADORES DERIVADOS (XOR Y XNOR) (Derecha)
  card(
    [6. Operadores Derivados (XOR y XNOR)],
    [Compuertas Aritméticas & VHDL],
    rgb("#4f46e5"),
    [
      #text(size: 9.2pt, weight: "bold", fill: rgb("#3730a3"), [Definiciones Canónicas])
      #v(2.5pt)
      #table(
        columns: (1.1fr, 2.9fr),
        stroke: 0.5pt + rgb("#e2e8f0"),
        fill: (col, row) => if calc.even(row) { rgb("#eef2ff") } else { rgb("#ffffff") },
        align: (left + horizon, center + horizon),
        inset: (x: 5pt, y: 4.5pt),
        [#strong[XOR (OR Exclusivo):]], [$A ⊕ B = A dot overline(B) + overline(A) dot B = (A + B) dot (overline(A) + overline(B))$],
        [#strong[XNOR (Equivalencia):]], [$A ⊙ B = overline(A ⊕ B) = A dot B + overline(A) dot overline(B) = (A + overline(B)) dot (overline(A) + B)$]
      )
      #v(4.5pt)
      #text(size: 9.2pt, weight: "bold", fill: rgb("#3730a3"), [Propiedades Notables y Dualidades (XOR vs XNOR)])
      #v(2.5pt)
      #table(
        columns: (1fr, 1fr),
        stroke: 0.5pt + rgb("#e2e8f0"),
        fill: (col, row) => if row == 0 { rgb("#e0e7ff") } else if calc.even(row) { rgb("#f8fafc") } else { rgb("#ffffff") },
        align: (center + horizon, center + horizon),
        inset: (x: 5pt, y: 3.8pt),
        [#strong[Propiedades XOR ($xor$)]], [#strong[Propiedades XNOR Duales ($⊙$)]],
        [$A ⊕ 0 = A$], [$A ⊙ 1 = A$],
        [$A ⊕ 1 = overline(A)$], [$A ⊙ 0 = overline(A)$],
        [$A ⊕ A = 0$], [$A ⊙ A = 1$],
        [$A ⊕ overline(A) = 1$], [$A ⊙ overline(A) = 0$],
        [$A ⊕ B = B ⊕ A$ #text(size: 7.2pt, fill: rgb("#64748b"), [(Conmutativa)])], [$A ⊙ B = B ⊙ A$ #text(size: 7.2pt, fill: rgb("#64748b"), [(Conmutativa)])],
        [$(A ⊕ B) ⊕ C = A ⊕ (B ⊕ C)$], [$(A ⊙ B) ⊙ C = A ⊙ (B ⊙ C)$]
      )
      #v(4.5pt)
      #text(size: 9.2pt, weight: "bold", fill: rgb("#3730a3"), [Identidades de Alto Impacto en VHDL (Síntesis RTL)])
      #v(2.5pt)
      #table(
        columns: (1.2fr, 2.8fr),
        stroke: 0.5pt + rgb("#c7d2fe"),
        fill: rgb("#f5f7ff"),
        align: (left + horizon, center + horizon),
        inset: (x: 5pt, y: 4.5pt),
        [#strong[Negación en XOR/XNOR:]], [$overline(A ⊕ B) = A ⊙ B = overline(A) ⊕ B = A ⊕ overline(B)$],
        [#strong[Distributividad AND/XOR:]], [$A dot (B ⊕ C) = (A dot B) ⊕ (A dot C)$]
      )
    ]
  )
)

#v(10pt)

// -----------------------------------------------------------------------------
// PIE DE PÁGINA INSTITUCIONAL
// -----------------------------------------------------------------------------
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(3pt)
#grid(
  columns: (1fr, 1fr),
  align: (left, right),
  [
    #text(size: 8pt, fill: rgb("#94a3b8"), [Fuente: `src/VHDL/algebra_boole.md` | Repositorio de Recursos Didácticos Multidisciplinares])
  ],
  [
    #text(size: 8pt, fill: rgb("#94a3b8"), [Compilado con Typst v0.15.1 | Formato Vectorial SVG Autónomo (Git LFS)])
  ]
)
