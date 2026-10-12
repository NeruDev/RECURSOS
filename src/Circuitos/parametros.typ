// =============================================================================
// Formulario Didáctico: Parámetros de Cuadripolos (Redes de Dos Puertos)
// Construcción de las matrices Z, Y, H y T (ABCD)
// Fuente primaria: src/Circuitos/parametros.md
// Verificación: Wikipedia "Two-port network"; UNR FCEIA (TCI Cap. 5);
//               UPV/EHU (Electrónica de Dispositivos, Tema 12)
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
// PALETA DE COLORES DIDÁCTICOS POR FAMILIA DE PARÁMETROS
// =============================================================================
#let col-z    = rgb("#0284c7") // Azul — Parámetros Z (impedancia)
#let col-y    = rgb("#059669") // Verde — Parámetros Y (admitancia)
#let col-h    = rgb("#d97706") // Ámbar — Parámetros H (híbridos)
#let col-t    = rgb("#7c3aed") // Violeta — Parámetros T / ABCD (transmisión)
#let col-head = rgb("#0f172a")

// -----------------------------------------------------------------------------
// HELPERS
// -----------------------------------------------------------------------------
// Barra de evaluación con la condición de ensayo al pie:
//   ev($V_1/I_1$, $I_2 = 0$)  ->  (V1/I1) con barra vertical e I2 = 0 al pie
#let ev(expr, cond) = $lr(#expr mid(|_(#cond)))$

// Componente de tarjeta modular (mismo patrón que algebra_boole.typ)
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

// Tabla estilizada unificada
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
    center + horizon
  } else {
    left + horizon
  },
  inset: (x: 5pt, y: 5.5pt),
  ..headers.map(h => text(weight: "bold", size: 9.1pt, fill: rgb("#1e293b"), h)),
  ..rows.pos()
)

// =============================================================================
// ENCABEZADO Y CONVENCIONES DEL CUADRIPOLO
// =============================================================================
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
        #text(size: 19pt, weight: "bold", fill: col-head, [Parámetros de Cuadripolos: Construcción de las Matrices Z, Y, H y T])
        #v(2pt)
        #text(size: 9.8pt, fill: rgb("#64748b"), [Formulario de redes de dos puertos: ensayos de circuito abierto y cortocircuito, coeficientes, unidades y aplicaciones])
      ],
      [
        #box(
          stroke: 1pt + rgb("#e2e8f0"),
          fill: rgb("#f8fafc"),
          radius: 6pt,
          inset: 7pt,
          [
            #text(weight: "bold", size: 8.6pt, fill: rgb("#334155"), [Convenciones del Cuadripolo:])
            #v(3pt)
            #grid(
              columns: (auto, auto, auto),
              gutter: 6pt,
              align: horizon,
              [#box(fill: rgb("#dbeafe").lighten(40%), inset: 3.5pt, radius: 3pt, text(fill: rgb("#1d4ed8"), weight: "bold", size: 8.3pt, [● Puerto 1 (entrada): $V_1, I_1$]))],
              [#box(fill: rgb("#dcfce7").lighten(40%), inset: 3.5pt, radius: 3pt, text(fill: rgb("#15803d"), weight: "bold", size: 8.3pt, [● Puerto 2 (salida): $V_2, I_2$]))],
              [#box(fill: rgb("#fef3c7").lighten(30%), inset: 3.5pt, radius: 3pt, text(fill: rgb("#b45309"), weight: "bold", size: 8.3pt, [● $I_1, I_2$ positivas entrando al cuadripolo]))]
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
          *Regla General de Construcción de la Matriz:* cada familia elige dos variables independientes y dos dependientes entre $V_1, I_1, V_2, I_2$. La matriz se construye *columna a columna*: para la columna 1 se *anula* la variable independiente de la columna 2 y se excita la de la columna 1; cada coeficiente es la razón entre la variable dependiente medida y la excitación aplicada, bajo esa condición (*condición de puerto*: la corriente que entra por un terminal sale por el otro del mismo par).
        ])
      ]
    )
  ]
)

#v(10pt)

// -----------------------------------------------------------------------------
// GRID PRINCIPAL: LAS 4 FAMILIAS (Z, Y) arriba y (H, T) abajo
// -----------------------------------------------------------------------------
#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,

  // ========================== FILA 1 (Z -> Y) ==========================
  // [1] PARÁMETROS Z (Impedancia de Circuito Abierto)
  card(
    [1. Parámetros $Z$ — Impedancia de Circuito Abierto],
    [Unidad: $Omega$ · Ensayo: $I = 0$],
    col-z,
    [
      #align(center)[
        #box(
          fill: col-z.lighten(94%),
          stroke: 0.8pt + col-z.lighten(55%),
          radius: 6pt,
          inset: 9pt,
          [
            #text(size: 11.5pt, fill: col-z.darken(18%),
              $vec(delim: "[", V_1, V_2) = mat(delim: "[", z_11, z_12; z_21, z_22) vec(delim: "[", I_1, I_2)$)
            #h(14pt)
            #text(size: 8.6pt, fill: rgb("#475569"), [Las *tensiones* $V_1, V_2$ en función de las *corrientes* $I_1, I_2$])
          ]
        )
      ]
      #v(5pt)
      #styled-table(
        (auto, 1.3fr, 1.45fr, 0.9fr),
        ([Coef.], [Definición medida], [Condición de ensayo], [Unidad]),
        [$z_11$], [#ev($V_1/I_1$, $I_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Impedancia de entrada]], [Puerto 2 en circuito abierto; excitar $I_1$], [$Omega$],
        [$z_12$], [#ev($V_1/I_2$, $I_1 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Impedancia de transferencia inversa]], [Puerto 1 en circuito abierto; excitar $I_2$], [$Omega$],
        [$z_21$], [#ev($V_2/I_1$, $I_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Impedancia de transferencia directa]], [Puerto 2 en circuito abierto; excitar $I_1$], [$Omega$],
        [$z_22$], [#ev($V_2/I_2$, $I_1 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Impedancia de salida]], [Puerto 1 en circuito abierto; excitar $I_2$], [$Omega$]
      )
      #v(5pt)
      #box(
        width: 100%,
        fill: col-z.lighten(95%),
        stroke: 0.5pt + col-z.lighten(65%),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: col-z.darken(20%), [
            *Aplicación principal:* análisis de cuadripolos conectados en *serie*, donde $[Z] = [Z]_1 + [Z]_2$. Relación dual con la familia $Y$: $[Y] = [Z]^(-1)$.
          ])
        ]
      )
    ]
  ),

  // [2] PARÁMETROS Y (Admitancia de Cortocircuito)
  card(
    [2. Parámetros $Y$ — Admitancia de Cortocircuito],
    [Unidad: $S$ · Ensayo: $V = 0$],
    col-y,
    [
      #align(center)[
        #box(
          fill: col-y.lighten(94%),
          stroke: 0.8pt + col-y.lighten(55%),
          radius: 6pt,
          inset: 9pt,
          [
            #text(size: 11.5pt, fill: col-y.darken(18%),
              $vec(delim: "[", I_1, I_2) = mat(delim: "[", y_11, y_12; y_21, y_22) vec(delim: "[", V_1, V_2)$)
            #h(14pt)
            #text(size: 8.6pt, fill: rgb("#475569"), [Las *corrientes* $I_1, I_2$ en función de las *tensiones* $V_1, V_2$ (dual de $Z$)])
          ]
        )
      ]
      #v(5pt)
      #styled-table(
        (auto, 1.3fr, 1.45fr, 0.9fr),
        ([Coef.], [Definición medida], [Condición de ensayo], [Unidad]),
        [$y_11$], [#ev($I_1/V_1$, $V_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Admitancia de entrada]], [Puerto 2 en cortocircuito; excitar $V_1$], [$S$],
        [$y_12$], [#ev($I_1/V_2$, $V_1 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Admitancia de transferencia inversa]], [Puerto 1 en cortocircuito; excitar $V_2$], [$S$],
        [$y_21$], [#ev($I_2/V_1$, $V_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Admitancia de transferencia directa]], [Puerto 2 en cortocircuito; excitar $V_1$], [$S$],
        [$y_22$], [#ev($I_2/V_2$, $V_1 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Admitancia de salida]], [Puerto 1 en cortocircuito; excitar $V_2$], [$S$]
      )
      #v(5pt)
      #box(
        width: 100%,
        fill: col-y.lighten(95%),
        stroke: 0.5pt + col-y.lighten(65%),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: col-y.darken(20%), [
            *Aplicación principal:* análisis de redes conectadas en *paralelo*, donde $[Y] = [Y]_1 + [Y]_2$. Todos los coeficientes son admitancias ($S = Omega^(-1)$) y $[Y] = [Z]^(-1)$.
          ])
        ]
      )
    ]
  ),

  // ========================== FILA 2 (H -> T) ==========================
  // [3] PARÁMETROS H (Híbridos)
  card(
    [3. Parámetros $H$ — Híbridos (Mixtos)],
    [Unidades mixtas · Ensayo mixto],
    col-h,
    [
      #align(center)[
        #box(
          fill: col-h.lighten(94%),
          stroke: 0.8pt + col-h.lighten(55%),
          radius: 6pt,
          inset: 9pt,
          [
            #text(size: 11.5pt, fill: col-h.darken(18%),
              $vec(delim: "[", V_1, I_2) = mat(delim: "[", h_11, h_12; h_21, h_22) vec(delim: "[", I_1, V_2)$)
            #h(14pt)
            #text(size: 8.6pt, fill: rgb("#475569"), [$V_1$ e $I_2$ en función de $I_1$ y $V_2$: mezclan tensión y corriente])
          ]
        )
      ]
      #v(5pt)
      #styled-table(
        (auto, 1.3fr, 1.45fr, 0.9fr),
        ([Coef.], [Definición medida], [Condición de ensayo], [Unidad]),
        [$h_11$], [#ev($V_1/I_1$, $V_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Impedancia de entrada]], [Salida ($V_2$) en cortocircuito; excitar $I_1$], [$Omega$],
        [$h_12$], [#ev($V_1/V_2$, $I_1 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Ganancia de tensión inversa]], [Entrada ($I_1$) en circuito abierto; excitar $V_2$], [adim.],
        [$h_21$], [#ev($I_2/I_1$, $V_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Ganancia de corriente directa]], [Salida ($V_2$) en cortocircuito; excitar $I_1$], [adim.],
        [$h_22$], [#ev($I_2/V_2$, $I_1 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Admitancia de salida]], [Entrada ($I_1$) en circuito abierto; excitar $V_2$], [$S$]
      )
      #v(5pt)
      #box(
        width: 100%,
        fill: col-h.lighten(95%),
        stroke: 0.5pt + col-h.lighten(65%),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: col-h.darken(20%), [
            *Aplicación principal:* modelado de *transistores BJT* y semiconductores en pequeña señal. Alias clásicos en hojas de datos: $h_11 = h_i$, $h_12 = h_r$, $h_21 = h_f$, $h_22 = h_o$. También apto para conexión *serie-paralelo* ($[H] = [H]_1 + [H]_2$).
          ])
        ]
      )
    ]
  ),

  // [4] PARÁMETROS T / ABCD (Transmisión)
  card(
    [4. Parámetros $T$ ($A B C D$) — Transmisión],
    [Unidades mixtas · Ensayos en la salida],
    col-t,
    [
      #align(center)[
        #box(
          fill: col-t.lighten(94%),
          stroke: 0.8pt + col-t.lighten(55%),
          radius: 6pt,
          inset: 9pt,
          [
            #text(size: 11.5pt, fill: col-t.darken(18%),
              $vec(delim: "[", V_1, I_1) = mat(delim: "[", A, B; C, D) vec(delim: "[", V_2, -I_2)$)
            #h(14pt)
            #text(size: 8.6pt, fill: rgb("#475569"), [Variables de *entrada* $(V_1, I_1)$ en función de las de *salida* $(V_2, -I_2)$])
          ]
        )
      ]
      #v(5pt)
      #styled-table(
        (auto, 1.3fr, 1.45fr, 0.9fr),
        ([Coef.], [Definición medida], [Condición de ensayo], [Unidad]),
        [$A$], [#ev($V_1/V_2$, $I_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Atenuación / ganancia inversa de tensión]], [Salida en circuito abierto ($I_2 = 0$)], [adim.],
        [$B$], [#ev($-V_1/I_2$, $V_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Impedancia de transferencia en cortocircuito]], [Salida en cortocircuito ($V_2 = 0$)], [$Omega$],
        [$C$], [#ev($I_1/V_2$, $I_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Admitancia de transferencia a circuito abierto]], [Salida en circuito abierto ($I_2 = 0$)], [$S$],
        [$D$], [#ev($-I_1/I_2$, $V_2 = 0$) #linebreak() #text(size: 7.5pt, fill: rgb("#475569"), style: "italic")[Ganancia inversa de corriente]], [Salida en cortocircuito ($V_2 = 0$)], [adim.]
      )
      #v(5pt)
      #box(
        width: 100%,
        fill: col-t.lighten(95%),
        stroke: 0.5pt + col-t.lighten(65%),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: col-t.darken(20%), [
            *Aplicación principal:* análisis de redes en *cascada* mediante multiplicación matricial: $[T]_"total" = [T]_1 dot [T]_2$. El signo $-I_2$ hace que la corriente de salida de una etapa coincida con la de entrada de la siguiente. Equivalencias del enunciado: $B = V_1/(-I_2)$ y $D = I_1/(-I_2)$.
          ])
        ]
      )
    ]
  )
)

#v(10pt)

// -----------------------------------------------------------------------------
// RESUMEN COMPARATIVO (tabla ancho completo)
// -----------------------------------------------------------------------------
#card(
  [5. Resumen Comparativo de las Cuatro Familias],
  [Visión sinóptica],
  rgb("#0f766e"),
  [
    #styled-table(
      (0.85fr, 1.15fr, 1.15fr, 1.3fr, 1.25fr, 1.3fr),
      ([Familia], [Variable(s) dependiente(s)], [Variable(s) independiente(s)], [Condición de medición], [Dimensión dominante], [Aplicación principal]),
      [#strong[$Z$]], [$V_1, V_2$], [$I_1, I_2$], [Circuito abierto ($I = 0$)], [Impedancia ($Omega$)], [Conexión en *serie*],
      [#strong[$Y$]], [$I_1, I_2$], [$V_1, V_2$], [Cortocircuito ($V = 0$)], [Admitancia ($S$)], [Conexión en *paralelo*],
      [#strong[$H$]], [$V_1, I_2$], [$I_1, V_2$], [Mixta ($V_2 = 0$, $I_1 = 0$)], [Híbrida ($Omega$, $S$, adim.)], [Transistores *BJT* (pequeña señal)],
      [#strong[$T$ ($A B C D$)]], [$V_1, I_1$], [$V_2, -I_2$], [Transmisión entrada $arrow.r$ salida], [Híbrida ($Omega$, $S$, adim.)], [Redes en *cascada*]
    )
  ]
)

#v(10pt)

// -----------------------------------------------------------------------------
// FILA FINAL: VERIFICACIÓN (reciprocidad/simetría) y VARIANTES SECUNDARIAS
// -----------------------------------------------------------------------------
#grid(
  columns: (1fr, 1fr),
  column-gutter: 12pt,
  row-gutter: 12pt,

  // [6] CONDICIONES DE VERIFICACIÓN
  card(
    [6. Verificación: Reciprocidad y Simetría],
    [Chequeo de resultados],
    rgb("#be185d"),
    [
      #styled-table(
        (1fr, 1.8fr, 1.8fr),
        ([Familia], [Red recíproca], [Red simétrica]),
        [$Z$], [$z_12 = z_21$], [$z_11 = z_22$],
        [$Y$], [$y_12 = y_21$], [$y_11 = y_22$],
        [$H$], [$h_12 = -h_21$], [$h_11 h_22 - h_12 h_21 = 1$],
        [$T$ ($A B C D$)], [$A D - B C = 1$], [$A = D$]
      )
      #v(5pt)
      #box(
        width: 100%,
        fill: rgb("#fdf2f8"),
        stroke: 0.5pt + rgb("#f9a8d4"),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: rgb("#9d174d"), [
            *Red recíproca:* red pasiva lineal (solo $R$, $L$, $C$): la respuesta a una excitación es idéntica intercambiando los puntos de excitación y medida. *Red simétrica:* su impedancia de entrada es igual a la de salida ($z_11 = z_22$). En redes sin pérdidas y recíprocas, los coeficientes de $Z$ e $Y$ son puramente imaginarios y $A, D$ son reales con $B, C$ imaginarios.
          ])
        ]
      )
    ]
  ),

  // [7] VARIANTES SECUNDARIAS
  card(
    [7. Variantes Secundarias (Uso Específico)],
    [$G$ e $T'$ inversos],
    rgb("#475569"),
    [
      #text(size: 9.2pt, weight: "bold", fill: rgb("#334155"), [Parámetros $G$ — Híbridos inversos])
      #text(size: 8.1pt, fill: rgb("#64748b"), [ (interconexión *paralelo-serie* y amplificación de tensión)])
      #v(2.5pt)
      #table(
        columns: (1fr,),
        stroke: 0.5pt + rgb("#e2e8f0"),
        fill: rgb("#f8fafc"),
        align: center + horizon,
        inset: 4.5pt,
        [$vec(delim: "[", I_1, V_2) = mat(delim: "[", g_11, g_12; g_21, g_22) vec(delim: "[", V_1, I_2)$]
      )
      #v(6pt)
      #text(size: 9.2pt, weight: "bold", fill: rgb("#334155"), [Parámetros $T'$ — Transmisión inversa])
      #text(size: 8.1pt, fill: rgb("#64748b"), [ (cascada en orden inverso: $[T'] = [T']_2 dot [T']_1$)])
      #v(2.5pt)
      #table(
        columns: (1fr,),
        stroke: 0.5pt + rgb("#e2e8f0"),
        fill: rgb("#f8fafc"),
        align: center + horizon,
        inset: 4.5pt,
        [$vec(delim: "[", V_2, -I_2) = mat(delim: "[", A', B'; C', D') vec(delim: "[", V_1, I_1)$]
      )
      #v(5pt)
      #box(
        width: 100%,
        fill: rgb("#f1f5f9"),
        stroke: 0.5pt + rgb("#cbd5e1"),
        radius: 4pt,
        inset: (x: 8pt, y: 5.5pt),
        [
          #text(size: 8pt, fill: rgb("#475569"), [
            *Relaciones de inversión:* $[Y] = [Z]^(-1)$, $[G] = [H]^(-1)$ y $[T'] = [T]^(-1)$. Los parámetros $G$ son los *híbridos inversos* y $T'$ los de *transmisión inversa*; ambas familias son de uso específico (aparecen como dualidad de $H$ y $T$ respectivamente).
          ])
        ]
      )
    ]
  )
)

#v(8pt)

// -----------------------------------------------------------------------------
// PIE: FUENTES VERIFICADAS
// -----------------------------------------------------------------------------
#box(
  width: 100%,
  fill: rgb("#ffffff"),
  stroke: 0.5pt + rgb("#e2e8f0"),
  radius: 5pt,
  inset: (x: 10pt, y: 5pt),
  [
    #text(size: 7.6pt, fill: rgb("#64748b"), [
      *Fuentes verificadas (2026-10-11):* Wikipedia, «Two-port network» (definiciones $z$, $y$, $h$, $g$, $A B C D$ y condiciones de reciprocidad/simetría) · UNR FCEIA, «Teoría de Circuitos I, Cap. 5 — Cuadripolos» (ecuaciones híbridas y dimensiones) · UPV/EHU, «Electrónica de Dispositivos, Tema 12» (parámetros $h$ del BJT: $h_i$, $h_r$, $h_f$, $h_o$). Fuente primaria del repositorio: `src/Circuitos/parametros.md`.
    ])
  ]
)
