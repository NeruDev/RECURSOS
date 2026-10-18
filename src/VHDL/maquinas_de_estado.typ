// =============================================================================
// Lámina Didáctica: Máquinas de Estados Finitos (FSM) y sus Componentes
// Materia: Diseño Digital y VHDL · Formato: Carta (US Letter) para impresión
// Estilos y paleta: estilos_typst.md (raíz del repositorio)
// Diagramas vectoriales nativos (curve / polygon), sin dependencias externas.
// =============================================================================

#set page(
  paper: "us-letter",
  margin: (x: 12mm, top: 10mm, bottom: 12mm),
  fill: rgb("#f8fafc"),
  footer: context align(center, text(
    size: 7.2pt,
    fill: rgb("#94a3b8"),
    [Máquinas de Estados Finitos · Diseño Digital y VHDL · pág. #counter(page).display() de #counter(page).final().first()],
  )),
)

#set text(
  font: ("Segoe UI", "Calibri", "DejaVu Sans", "Arial"),
  size: 9pt,
  fill: rgb("#0f172a"),
  lang: "es",
)

// =============================================================================
// PALETA DE COLORES DIDÁCTICOS DE ALTA LEGIBILIDAD (estilos_typst.md §2)
// =============================================================================
#let col-var = rgb("#1d4ed8") // 🔵 Azul Real   -> Estados y variables de estado
#let col-num = rgb("#dc2626") // 🔴 Rojo Carmesí -> Números, constantes y salidas
#let col-neg = rgb("#7c3aed") // 🟣 Púrpura      -> Registro de estado y negación
#let col-op = rgb("#059669")  // 🟢 Verde        -> Operadores y lógica combinacional
#let col-head = rgb("#0f172a") // 🔵 Marino oscuro -> Títulos principales
#let col-sky = rgb("#0284c7") // 🩵 Cielo        -> Entradas del autómata
#let col-amber = rgb("#d97706") // 🟠 Ámbar      -> Lógica de salida
#let col-slate = rgb("#475569") // ⚫ Pizarra     -> Reloj, reset y anotaciones

// Reglas show para colorear automáticamente las expresiones matemáticas
#show math.overline: set text(fill: col-neg)
#show math.equation: it => {
  show regex("[01]"): m => text(fill: col-num, weight: "bold", m.text)
  show regex("[+⊕⊙\u{22c5}\u{00b7}]"): m => text(fill: col-op, weight: "bold", m.text)
  it
}

// =============================================================================
// RESALTADO DE SINTAXIS DIDÁCTICO (estilos_typst.md §7.2)
// Palabras clave, variables, números y comentarios con la paleta del repo.
// Sin verde oscuro ni café: comentarios en pizarra y literales en ámbar.
// =============================================================================
#let code-font = ("Cascadia Mono", "Consolas", "Courier New", "DejaVu Sans Mono")

#let code-theme = (
  comment: rgb("#64748b"), // Pizarra -> comentarios (-- ...)
  keyword: rgb("#7c3aed"), // Púrpura -> palabras clave del lenguaje
  storage: rgb("#0284c7"), // Cielo   -> tipos y bibliotecas
  ident: rgb("#1d4ed8"),   // Azul    -> señales, puertos y variables
  number: rgb("#dc2626"),  // Rojo    -> literales numéricos y de bit
  string: rgb("#d97706"),  // Ámbar   -> cadenas de texto
  op: rgb("#475569"),      // Pizarra -> operadores y puntuación
)

#let code-rules = (
  ("comment", regex("--[^\n]*")),
  ("string", regex("\"(\\.|[^\"\\\\])*\"")),
  ("number", regex("'[^']'|[0-9]+")),
  ("keyword", regex("\\b(library|use|all|entity|is|port|in|out|inout|buffer|architecture|of|begin|end|signal|constant|variable|type|subtype|array|record|range|downto|to|process|if|then|elsif|else|case|when|others|loop|for|while|wait|until|rising_edge|falling_edge|generic|map|package|body|function|procedure|return|and|or|not|nand|nor|xor|xnor|mod|rem)\\b")),
  ("storage", regex("\\b(ieee|std_logic_1164|std_logic_vector|std_logic|unsigned|signed|integer|natural|positive|boolean|bit|estado_t)\\b")),
  ("ident", regex("[A-Za-z_][A-Za-z0-9_]*")),
  ("op", regex("[^A-Za-z0-9_ ]+")),
)

// Los espacios se emiten como U+00A0 para conservar la indentación exacta
#let code-nbsp(s) = s.replace(" ", "\u{00A0}")

#let code-line(line) = {
  let out = ()
  let pos = 0
  while pos < line.len() {
    let rest = line.slice(pos)
    let best = none
    for (kind, pat) in code-rules {
      let m = rest.match(pat)
      if m != none and (best == none or m.start < best.start) {
        best = (start: m.start, text: m.text, kind: kind)
      }
    }
    if best == none {
      out.push(text(code-nbsp(rest)))
      pos = line.len()
    } else {
      if best.start > 0 {
        out.push(text(code-nbsp(rest.slice(0, best.start))))
      }
      out.push(text(
        fill: code-theme.at(best.kind),
        weight: if best.kind in ("keyword", "storage", "number") { "bold" } else { "regular" },
        style: if best.kind == "comment" { "italic" } else { "normal" },
        code-nbsp(best.text),
      ))
      pos += best.start + best.text.len()
    }
  }
  out.join()
}

#let code-highlight(code, size: 7.1pt) = {
  let lines = code.trim().split("\n").map(line => code-line(line))
  text(font: code-font, size: size, lines.join(linebreak()))
}

// Todo `raw` (en línea o en bloque) se resalta con la misma paleta didáctica
#show raw: it => if it.block {
  par(leading: 0.62em, spacing: 0.62em, code-highlight(it.text))
} else {
  code-highlight(it.text, size: 0.95em)
}

// =============================================================================
// COMPONENTES REUTILIZABLES (idénticos en estructura a algebra_boole.typ)
// =============================================================================
#let card(title, badge-text, brand-color, body) = block(
  width: 100%,
  stroke: 1pt + brand-color.lighten(60%),
  radius: 7pt,
  fill: rgb("#ffffff"),
  inset: 0pt,
  clip: true,
  breakable: false,
  [
    #block(
      width: 100%,
      fill: brand-color.lighten(92%),
      inset: (x: 12pt, y: 6.5pt),
      stroke: (bottom: 1pt + brand-color.lighten(60%)),
      [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [#text(fill: brand-color.darken(25%), weight: "bold", size: 10.4pt, title)],
          [
            #box(
              fill: brand-color.lighten(75%),
              radius: 4pt,
              inset: (x: 6pt, y: 2.5pt),
              [#text(fill: brand-color.darken(35%), size: 7.8pt, weight: "bold", badge-text)]
            )
          ]
        )
      ]
    )
    #block(width: 100%, inset: (x: 8pt, y: 7pt), body)
  ]
)

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
  inset: (x: 5pt, y: 4.2pt),
  ..headers.map(h => text(weight: "bold", size: 8.4pt, fill: rgb("#1e293b"), h)),
  ..rows.pos().map(c => if type(c) == content { c } else { text(size: 8.3pt, c) }),
)

// Lienzo de diagrama con coordenadas absolutas
#let canvas(w, h, body) = align(center, block(width: w, height: h, inset: 0pt, body))

// Cabeza de flecha: punta en (x, y) orientada según el ángulo (0° = derecha)
#let arrowhead(x, y, ang, color, size: 4.6pt, half: 2.4pt) = {
  let a = ang.rad()
  let cc = calc.cos(a)
  let ss = calc.sin(a)
  let ux = cc * size
  let uy = ss * size
  let px = -ss * half
  let py = cc * half
  place(
    dx: x,
    dy: y,
    polygon(fill: color, (0pt, 0pt), (-ux + px, -uy + py), (-ux - px, -uy - py)),
  )
}

// Flecha poligonal ortogonal: recibe la lista de puntos y el ángulo de llegada
#let arrow(pts, color, ang: 0deg, dashed: false, thick: 1pt) = {
  let p0 = pts.at(0)
  let segs = pts.slice(1).map(p => curve.line((p.at(0) - p0.at(0), p.at(1) - p0.at(1))))
  place(
    dx: p0.at(0),
    dy: p0.at(1),
    curve(
      stroke: if dashed {
        (paint: color, thickness: thick, dash: "dashed")
      } else {
        (paint: color, thickness: thick)
      },
      ..segs,
    ),
  )
  arrowhead(pts.at(-1).at(0), pts.at(-1).at(1), ang, color)
}

// Caja de proceso / bloque funcional
#let node(x, y, w, h, fill, border, title, sub) = place(
  dx: x,
  dy: y,
  block(
    width: w,
    height: h,
    fill: fill,
    stroke: 1.4pt + border,
    radius: 4.5pt,
    inset: 3pt,
    align(center + horizon, {
      text(size: 8.1pt, weight: "bold", fill: border.darken(30%), title)
      linebreak()
      text(size: 6.9pt, fill: rgb("#475569"), sub)
    }),
  ),
)

// Estado del autómata (círculo con nombre y salida de Moore)
#let state-at(cx, cy, name, out, color) = place(
  dx: cx - 9mm,
  dy: cy - 9mm,
  block(
    width: 18mm,
    height: 18mm,
    radius: 50%,
    fill: rgb("#ffffff"),
    stroke: 2pt + color,
    align(center + horizon, {
      text(size: 9pt, weight: "bold", fill: color, name)
      linebreak()
      text(size: 6.8pt, fill: rgb("#64748b"), out)
    }),
  ),
)

// Auto-transición: parábola simétrica respecto a la vertical del centro del
// estado; nace a la derecha y reingresa a la izquierda con la punta hacia abajo.
#let self-loop(cx, cy, color, w: 5.2mm, dIn: 8.4mm, rise: 7mm) = {
  let y0 = cy - dIn
  place(
    dx: cx - w,
    dy: y0,
    curve(
      stroke: 1pt + color,
      curve.move((2 * w, 0pt)),
      curve.cubic((2 * w, -rise), (0pt, -rise), (0pt, 0pt)),
    ),
  )
  arrowhead(cx - w, y0, 90deg, color)
}

// Etiqueta de transición / anotación de diagrama
#let lbl(x, y, body, size: 7.2pt, fill: rgb("#334155"), bg: none) = place(
  dx: x,
  dy: y,
  if bg == none {
    text(size: size, fill: fill, body)
  } else {
    box(fill: bg, inset: (x: 2pt, y: 0.6pt), radius: 2.5pt, text(size: size, fill: fill, body))
  },
)

// =============================================================================
// ENCABEZADO Y LEYENDA DIDÁCTICA
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
        #text(size: 18.5pt, weight: "bold", fill: col-head, [Máquinas de Estados Finitos])
        #v(1.5pt)
        #text(size: 9.6pt, fill: rgb("#64748b"), [Componentes, modelos de Moore y Mealy, síntesis en VHDL y flujo de diseño])
      ],
      [
        #box(
          stroke: 1pt + rgb("#e2e8f0"),
          fill: rgb("#f8fafc"),
          radius: 6pt,
          inset: 7pt,
          [
            #text(weight: "bold", size: 8.4pt, fill: rgb("#334155"), [Leyenda de colores didácticos:])
            #v(3pt)
            #grid(
              columns: (auto, auto, auto, auto),
              gutter: 6pt,
              align: horizon,
              [#box(fill: col-var.lighten(85%), inset: 3.5pt, radius: 3pt, text(fill: col-var, weight: "bold", size: 8pt, [● Estados]))],
              [#box(fill: col-neg.lighten(88%), inset: 3.5pt, radius: 3pt, text(fill: col-neg, weight: "bold", size: 8pt, [● Registro]))],
              [#box(fill: col-op.lighten(88%), inset: 3.5pt, radius: 3pt, text(fill: col-op, weight: "bold", size: 8pt, [● Lógica δ]))],
              [#box(fill: col-amber.lighten(88%), inset: 3.5pt, radius: 3pt, text(fill: col-amber, weight: "bold", size: 8pt, [● Lógica λ]))]
            )
          ]
        )
      ]
    )
    #v(5pt)
    #box(
      width: 100%,
      fill: rgb("#f0fdf4"),
      stroke: 0.5pt + rgb("#86efac"),
      radius: 5pt,
      inset: (x: 10pt, y: 5pt),
      [
        #text(size: 8.4pt, fill: rgb("#166534"), [
          *Idea estructural:* toda máquina de estados síncrona es la unión de un *registro de estado* (memoria) y dos redes combinacionales: la función de transición $delta$ (próximo estado) y la función de salida $lambda$.
        ])
      ]
    )
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 1: ARQUITECTURA Y COMPONENTES
// =============================================================================
#card(
  [1. Arquitectura y Componentes de una FSM],
  [Modelo de Mealy generalizado],
  col-sky,
  [
    #canvas(182mm, 59mm, [
      // Entradas
      #node(0mm, 6mm, 22mm, 13mm, rgb("#e0f2fe"), col-sky, [Entradas], [X(t)])
      // Lógica de próximo estado
      #node(36mm, 1mm, 42mm, 23mm, rgb("#ecfdf5"), col-op, [Lógica de Próximo Estado], [δ : Q × X → Q])
      // Registro de estado
      #node(92mm, 1mm, 42mm, 23mm, rgb("#f5f3ff"), col-neg, [Registro de Estado], [n biestables D · Q(t)])
      // Reloj y reset
      #node(148mm, 1mm, 30mm, 9.5mm, rgb("#f1f5f9"), col-slate, [clk], [reloj])
      #node(148mm, 12.5mm, 30mm, 9.5mm, rgb("#f1f5f9"), col-slate, [rst], [reset])
      // Lógica de salida (bajo el registro: recibe Q y, en Mealy, también X)
      #node(92mm, 39mm, 46mm, 18mm, rgb("#fff7ed"), col-amber, [Lógica de Salida], [λ : Q × X → Y])
      // Salidas
      #node(148mm, 42.5mm, 30mm, 11mm, rgb("#fef2f2"), col-num, [Salidas], [Y(t)])

      // Entradas -> δ
      #arrow(((22mm, 12.5mm), (36mm, 12.5mm)), col-sky)
      // δ -> Registro
      #arrow(((78mm, 12.5mm), (92mm, 12.5mm)), col-op)
      // clk / rst -> Registro
      #arrow(((148mm, 5.75mm), (134mm, 5.75mm)), col-slate, ang: 180deg)
      #arrow(((148mm, 17.25mm), (134mm, 17.25mm)), col-slate, ang: 180deg)
      // Retroalimentación de estado
      #arrow(((111mm, 24mm), (111mm, 31mm), (57mm, 31mm), (57mm, 24mm)), col-neg, ang: -90deg)
      #lbl(70mm, 26.6mm, [estado actual $Q(t)$], bg: rgb("#ffffff"))
      // Estado -> Lógica de salida
      #arrow(((125mm, 24mm), (125mm, 39mm)), col-neg, ang: 90deg)
      #lbl(126.3mm, 29.5mm, [$Q$], size: 7pt, fill: col-neg)
      // Lógica de salida -> Salidas
      #arrow(((138mm, 48mm), (148mm, 48mm)), col-amber)
      // Entradas -> Lógica de salida (solo Mealy)
      #arrow(((11mm, 19mm), (11mm, 48mm), (92mm, 48mm)), col-sky, dashed: true)
      #lbl(12.6mm, 37mm, [X(t) si es Mealy], size: 6.7pt, fill: col-sky, bg: rgb("#ffffff"))
      // Nota de modelo
      #place(
        dx: 150mm,
        dy: 25mm,
        block(
          width: 30mm,
          inset: 4pt,
          stroke: 0.5pt + rgb("#cbd5e1"),
          radius: 3pt,
          fill: rgb("#ffffff"),
          text(size: 6.7pt, fill: rgb("#475569"), [Moore: se suprime la línea punteada y $lambda$ solo lee $Q$.])
        ),
      )
    ])
    #v(2pt)
    #styled-table(
      (1.15fr, 2.9fr, 2.1fr),
      ([Componente], [Función dentro del autómata], [Realización típica]),
      [#text(fill: col-neg, weight: "bold", size: 8.3pt, [Registro de estado])],
      [Memoriza $Q(t)$; cambia solo en el flanco de reloj.],
      [`signal estado : estado_t;`],
      [#text(fill: col-op, weight: "bold", size: 8.3pt, [Transición $delta$])],
      [Calcula $Q(t+1)$ a partir de $Q(t)$ y $X(t)$.],
      [`case estado is ... end case`],
      [#text(fill: col-amber, weight: "bold", size: 8.3pt, [Salida $lambda$])],
      [Traduce estado (y entrada) en la salida $Y(t)$ del sistema.],
      [`y <= f(estado, x);`],
      [#text(fill: col-slate, weight: "bold", size: 8.3pt, [Reloj y reset])],
      [Sincronizan la evolución y fijan el estado inicial seguro.],
      [`rising_edge(clk)` / `rst`]
    )
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 2: MOORE VS MEALY
// =============================================================================
#card(
  [2. Modelo de Moore frente a Modelo de Mealy],
  [Comparativa funcional],
  col-neg,
  [
    #styled-table(
      (1.5fr, 2.3fr, 2.3fr),
      ([Criterio], [Máquina de Moore], [Máquina de Mealy]),
      [*Dependencia de la salida*], [Solo del estado: $Y = lambda(Q)$], [Estado y entrada: $Y = lambda(Q, X)$],
      [*Ecuación de salida*], [$Y(t) = lambda(Q(t))$], [$Y(t) = lambda(Q(t), X(t))$],
      [*Ubicación en el diagrama*], [Dentro del círculo del estado], [Sobre la flecha de transición],
      [*Respuesta temporal*], [Cambia después del flanco de reloj], [Puede cambiar antes del flanco],
      [*Riesgo de glitches*], [Bajo: salida asociada a un registro], [Mayor: salida puramente combinacional],
      [*Número de estados*], [Suele requerir más estados], [Suele requerir menos estados],
      [*Uso recomendado*], [Salidas de control estables], [Reacción inmediata a la entrada]
    )
    #v(7pt)
    #box(
      width: 100%,
      fill: rgb("#faf5ff"),
      stroke: 0.5pt + rgb("#d8b4fe"),
      radius: 5pt,
      inset: (x: 10pt, y: 5.5pt),
      [
        #text(size: 8.3pt, fill: rgb("#5b21b6"), [
          *Regla mnemotécnica:* en *Moore* la salida «vive» en el estado y permanece estable todo el ciclo; en *Mealy* la salida «viaja» por la transición y depende de la entrada del instante.
        ])
      ]
    )
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 3: DIAGRAMA DE ESTADOS (MOORE)
// =============================================================================
#card(
  [3. Diagrama de Estados: Detector de la Secuencia «10»],
  [Moore · 3 estados · entrada x],
  col-var,
  [
    #canvas(182mm, 58mm, [
      #state-at(30mm, 28mm, [S0], [y = 0], col-var)
      #state-at(91mm, 28mm, [S1], [y = 0], col-var)
      #state-at(152mm, 28mm, [S2], [y = 1], col-var)

      // Flecha de estado inicial
      #arrow(((4mm, 28mm), (21mm, 28mm)), col-slate)
      #lbl(3mm, 20.5mm, [reset], size: 6.9pt, fill: col-slate)

      // S0 -> S1
      #arrow(((39mm, 28mm), (82mm, 28mm)), col-var)
      #lbl(53mm, 21.5mm, [$x = 1$], bg: rgb("#ffffff"))

      // S1 -> S2 (por encima) y S2 -> S1 (por debajo)
      #arrow(((99.5mm, 31mm), (143.5mm, 31mm)), col-var)
      #lbl(118mm, 33.2mm, [$x = 0$], bg: rgb("#ffffff"))
      #arrow(((143.5mm, 25mm), (99.5mm, 25mm)), col-var, ang: 180deg)
      #lbl(118mm, 20mm, [$x = 1$], bg: rgb("#ffffff"))

      // Auto-transiciones: parábola simétrica al centro de cada estado
      #self-loop(30mm, 28mm, col-var)
      #lbl(26.6mm, 10.4mm, [$x = 0$], fill: col-var)
      #self-loop(91mm, 28mm, col-var)
      #lbl(87.6mm, 10.4mm, [$x = 1$], fill: col-var)

      // S2 -> S0 (retorno inferior)
      #arrow(((152mm, 37mm), (152mm, 44mm), (30mm, 44mm), (30mm, 37mm)), col-var, ang: -90deg)
      #lbl(85.6mm, 40.4mm, [$x = 0$], bg: rgb("#ffffff"))

      // Leyenda del diagrama
      #place(
        dx: 0mm,
        dy: 51mm,
        block(
          width: 182mm,
          stroke: (top: 0.5pt + rgb("#e2e8f0")),
          inset: (top: 4pt),
          text(size: 7pt, fill: rgb("#64748b"), [
            *Lectura:* cada círculo es un estado estable; la etiqueta $x$ de cada flecha es la condición de entrada que habilita la transición; el valor $y$ bajo el nombre es la salida de Moore, válida durante todo el estado.
          ])
        ),
      )
    ])
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 4: TABLA DE TRANSICIÓN Y ECUACIONES
// =============================================================================
#card(
  [4. Tabla de Transición, Codificación y Ecuaciones],
  [Del diagrama a la lógica],
  col-op,
  [
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 10pt,
      [
        #text(size: 8.6pt, weight: "bold", fill: rgb("#065f46"), [Tabla de transición de estados])
        #v(3pt)
        #styled-table(
          (0.9fr, 0.8fr, 1fr, 1fr, 1fr),
          ([Estado], [$q_1 q_0$], [$x = 0$], [$x = 1$], [Salida $y$]),
          [S0], [00], [S0], [S1], [0],
          [S1], [01], [S2], [S1], [0],
          [S2], [10], [S0], [S1], [1]
        )
        #v(5pt)
        #text(size: 7.6pt, fill: rgb("#475569"), [
          Codificación binaria de estados: $S_0 = 00$, $S_1 = 01$, $S_2 = 10$. Las filas de la tabla y las flechas del diagrama son la misma información en dos formatos.
        ])
      ],
      [
        #text(size: 8.6pt, weight: "bold", fill: rgb("#065f46"), [Ecuaciones de estado y salida])
        #v(3pt)
        #block(
          width: 100%,
          fill: rgb("#f0fdf4"),
          stroke: 0.5pt + rgb("#86efac"),
          radius: 5pt,
          inset: (x: 8pt, y: 6pt),
          [
            $Q(t+1) = delta(Q(t), X(t))$
            #v(4pt)
            $q_1^+ = overline(q_1) dot q_0 dot overline(x)$
            #v(3pt)
            $q_0^+ = x$
            #v(3pt)
            $y = q_1 dot overline(q_0)$
          ]
        )
        #v(5pt)
        #text(size: 7.6pt, fill: rgb("#475569"), [
          La ecuación de $lambda$ es combinacional pura: no contiene al reloj ni realimentación, por lo que se implementa con una asignación concurrente.
        ])
      ]
    )
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 5: FLUJO DE DISEÑO
// =============================================================================
#card(
  [5. Flujo de Diseño de una FSM hasta la FPGA],
  [Metodología en 6 pasos],
  col-amber,
  [
    #canvas(182mm, 27mm, [
      #let bw = 26mm
      #let gap = 5.2mm
      #let step(x, n, t, s, c) = {
        node(x, 0mm, bw, 24mm, c.lighten(94%), c, text(size: 8pt, weight: "bold", fill: c.darken(30%), t), s)
        place(dx: x + 2mm, dy: -0.6mm, box(fill: c, radius: 50%, inset: 2.6pt, text(size: 6.6pt, weight: "bold", fill: rgb("#ffffff"), n)))
      }
      #step(0mm, [1], [Especificación], [Entradas, salidas y secuencia], col-sky)
      #step(bw + gap, [2], [Diagrama de estados], [Moore o Mealy], col-var)
      #step(2 * (bw + gap), [3], [Tabla de transición], [Estado actual → siguiente], col-op)
      #step(3 * (bw + gap), [4], [Ecuaciones], [Minimizar δ y λ], col-neg)
      #step(4 * (bw + gap), [5], [Descripción VHDL], [Entidad y arquitectura], col-amber)
      #step(5 * (bw + gap), [6], [Simulación y síntesis], [Testbench y FPGA], col-num)

      #for i in range(5) {
        arrow(((i * (bw + gap) + bw + 0.8mm, 12mm), ((i + 1) * (bw + gap) - 0.8mm, 12mm)), rgb("#94a3b8"))
      }
    ])
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 6: PLANTILLA VHDL
// =============================================================================
#card(
  [6. Plantilla VHDL de Referencia (Estilo de Dos Procesos)],
  [Síntesis RTL · IEEE 1164],
  rgb("#4f46e5"),
  [
    #block(
      width: 100%,
      fill: rgb("#f8fafc"),
      stroke: 0.5pt + rgb("#cbd5e1"),
      radius: 5pt,
      inset: (x: 9pt, y: 7pt),
      ```vhdl
library ieee;
use ieee.std_logic_1164.all;

entity detector_10 is
  port (
    clk : in  std_logic;
    rst : in  std_logic;
    x   : in  std_logic;
    y   : out std_logic
  );
end entity detector_10;

architecture rtl of detector_10 is
  type estado_t is (S0, S1, S2);
  signal estado, prox_estado : estado_t;
begin
  -- Proceso 1: registro de estado (secuencial)
  registro : process (clk, rst) begin
    if rst = '1' then
      estado <= S0;
    elsif rising_edge(clk) then
      estado <= prox_estado;
    end if;
  end process registro;

  -- Proceso 2: proximo estado (combinacional)
  transicion : process (estado, x) begin
    prox_estado <= estado;          -- valor por defecto
    case estado is
      when S0 => if x = '1' then prox_estado <= S1; end if;
      when S1 => if x = '0' then prox_estado <= S2; end if;
      when S2 => if x = '0' then prox_estado <= S0;
                  else prox_estado <= S1; end if;
    end case;
  end process transicion;

  -- Salida tipo Moore (concurrente, fuera del proceso)
  y <= '1' when estado = S2 else '0';
end architecture rtl;
```
    )
    #v(7pt)
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 8pt,
      [
        #box(width: 100%, fill: rgb("#eef2ff"), stroke: 0.5pt + rgb("#c7d2fe"), radius: 4pt, inset: 6pt, [
          #text(size: 7.8pt, weight: "bold", fill: rgb("#3730a3"), [Dos procesos])
          #v(1.5pt)
          #text(size: 7.4pt, fill: rgb("#4338ca"), [Uno secuencial para el registro y uno combinacional para $delta$: evita latches y facilita la simulación.])
        ])
      ],
      [
        #box(width: 100%, fill: rgb("#ecfdf5"), stroke: 0.5pt + rgb("#86efac"), radius: 4pt, inset: 6pt, [
          #text(size: 7.8pt, weight: "bold", fill: rgb("#065f46"), [Tipo enumerado])
          #v(1.5pt)
          #text(size: 7.4pt, fill: rgb("#047857"), [El tipo `estado_t` nombra los estados; la síntesis asigna la codificación sin escribirla a mano.])
        ])
      ],
      [
        #box(width: 100%, fill: rgb("#fff7ed"), stroke: 0.5pt + rgb("#fed7aa"), radius: 4pt, inset: 6pt, [
          #text(size: 7.8pt, weight: "bold", fill: rgb("#9a3412"), [Valor por defecto])
          #v(1.5pt)
          #text(size: 7.4pt, fill: rgb("#c2410c"), [Asignar `prox_estado <= estado` antes del `case` garantiza cobertura total y evita latches inferidos.])
        ])
      ]
    )
  ]
)

#v(9pt)

// =============================================================================
// TARJETA 7: VERIFICACIÓN Y ERRORES FRECUENTES
// =============================================================================
#card(
  [7. Verificación y Errores Frecuentes en el Diseño de FSM],
  [Lista de comprobación],
  col-slate,
  [
    #styled-table(
      (1.6fr, 2.35fr, 2.35fr),
      ([Síntoma observado], [Causa típica], [Corrección didáctica]),
      [La salida nunca cambia], [Falta el flanco de reloj o el reset está activo], [Revisar `rising_edge(clk)` y el nivel de `rst`],
      [Se infiere un latch], [Rama del `case` sin asignación por defecto], [Asignar `prox_estado <= estado` antes del `case`],
      [La FSM se bloquea], [Transición sin condición de salida completa], [Cubrir todas las combinaciones de entrada],
      [Salida con glitches], [Salida Mealy combinacional expuesta al puerto], [Registrar la salida o migrar a Moore],
      [Estados inalcanzables en síntesis], [Codificación manual o estados sin uso], [Usar `type estado_t is (...)` y `when others`],
      [Simulación y síntesis difieren], [Lógica no sintetizable (`after`, retardos)], [Restringir el RTL a lógica sintetizable]
    )
  ]
)

#v(9pt)

// -----------------------------------------------------------------------------
// PIE DE PÁGINA INSTITUCIONAL
// -----------------------------------------------------------------------------
#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
#v(3pt)
#grid(
  columns: (1fr, 1fr),
  align: (left, right),
  [
    #text(size: 7.6pt, fill: rgb("#94a3b8"), [Fuente: `src/VHDL/temario.md` §2 · Repositorio de Recursos Didácticos Multidisciplinares])
  ],
  [
    #text(size: 7.6pt, fill: rgb("#94a3b8"), [Typst v0.15.1 · Hoja carta (US Letter) · Estilos: `estilos_typst.md`])
  ]
)
