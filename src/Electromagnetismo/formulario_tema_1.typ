// Formulario didáctico de Electromagnetismo — Tema 1
// Fuente: src/Electromagnetismo/formulario_tema_1.md

#set page(
  width: 10.8cm,
  height: 13.97cm,
  margin: (x: 8mm, y: 8mm),
  fill: rgb("#f8fafc")
)
#set text(font: "Libertinus Serif", size: 8.5pt, fill: rgb("#0f172a"))
#set par(leading: 0.65em)
#set heading(numbering: none)

#let navy = rgb("#0f2747")
#let blue = rgb("#0369a1")
#let teal = rgb("#0f766e")
#let slate = rgb("#475569")
#let pale-blue = rgb("#e0f2fe")
#let pale-teal = rgb("#ccfbf1")

#let unit(value) = text(size: 7.7pt, fill: slate)[[#value]]
#let note(body) = block(
  fill: pale-blue,
  stroke: 0.5pt + rgb("#7dd3fc"),
  radius: 4pt,
  inset: 7pt,
  body,
)
#let formula(body, result) = align(center)[
  #body #h(5pt) #unit(result)
]
#let section-title(title, color: blue) = block(
  fill: color.lighten(87%),
  stroke: (left: 2pt + color),
  inset: (x: 7pt, y: 4pt),
  [#text(weight: "bold", fill: color, size: 12pt, title)]
)
#let compact-table(columns, ..cells) = table(
  columns: columns,
  stroke: (x, y) => if y == 0 { 0.8pt + rgb("#94a3b8") } else { 0.35pt + rgb("#cbd5e1") },
  fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else if calc.even(y) { rgb("#f8fafc") } else { white },
  inset: 4.5pt,
  align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
  ..cells,
)

#align(center)[
  #text(size: 20pt, weight: "bold", fill: navy)[Formulario — Tema 1]
  #v(2pt)
  #text(size: 13pt, weight: "bold", fill: blue)[Ecuaciones de Maxwell y propagación de ondas electromagnéticas]
  #v(4pt)
  #text(size: 8.5pt, fill: slate)[Compendio ordenado de ecuaciones, magnitudes físicas y parámetros de propagación]
]

#v(8pt)
#note[
  *Convención fasorial:* se utiliza $e^(j ω t)$. Una onda que se propaga en $+z$ lleva el factor $e^(-γ z)$, donde $γ = α + j β$.

  *Lectura de unidades:* cada resultado se acompaña de su magnitud física entre corchetes. El radian y el neper son adimensionales, pero se conservan para identificar fase y atenuación.
]

#v(8pt)
#section-title([1. Constantes y relaciones constitutivas])

#v(5pt)
#compact-table(
  (1.5fr, 0.65fr, 1.55fr, 0.75fr),
  [*Magnitud*], [*Símbolo*], [*Valor o relación*], [*Unidad SI*],
  [Velocidad de la luz], [$c$], [$299 792 458$], [m/s],
  [Permitividad del vacío], [$ε_0$], [$8.854 187 8128 times 10^(-12)$], [F/m],
  [Permeabilidad del vacío], [$μ_0$], [$1.256 637 062 times 10^(-6)$], [H/m],
  [Impedancia del vacío], [$η_0$], [$sqrt(μ_0 / ε_0) approx 376.730$], [Ω],
  [Frecuencia angular], [$ω$], [$2 π f$], [rad/s],
  [Longitud de onda], [$λ$], [$v_p / f = 2 π / β$], [m],
)

#v(6pt)
#formula([$D = ε E quad B = μ H quad J = σ E$], [D: C/m²; B: T; J: A/m²])
#formula([$ε = ε_r ε_0 quad μ = μ_r μ_0$], [ε: F/m; μ: H/m])

== Tangente de pérdidas

#formula([$tan δ = J_c / J_d = σ / (ω ε)$], [adimensional])

#compact-table(
  (1fr, 2.3fr, 0.9fr),
  [*Símbolo*], [*Significado*], [*Unidad SI*],
  [$tan δ$], [Tangente de pérdidas del medio], [adimensional],
  [$J_c = σ E$], [Densidad de corriente de conducción], [A/m²],
  [$J_d = ω ε E$], [Densidad de corriente de desplazamiento], [A/m²],
  [$σ$], [Conductividad eléctrica], [S/m],
  [$ω$], [Frecuencia angular], [rad/s],
  [$ε$], [Permitividad absoluta], [F/m],
)

Un dieléctrico de bajas pérdidas cumple $tan δ ≪ 1$; un buen conductor cumple $tan δ ≫ 1$.

== Símbolos de uso recurrente

#compact-table(
  (0.95fr, 2.2fr, 1fr),
  [*Símbolo*], [*Nombre*], [*Unidad SI*],
  [$E, E_0$], [Campo eléctrico y amplitud fasorial], [V/m],
  [$H, H_0$], [Campo magnético y amplitud fasorial], [A/m],
  [$D, B$], [Densidades de flujo eléctrico y magnético], [C/m²; T],
  [$γ, α, β$], [Constante de propagación, atenuación y fase], [m⁻¹; Np/m; rad/m],
  [$η$], [Impedancia intrínseca], [Ω],
  [$v_p, λ, z$], [Velocidad de fase, longitud de onda y posición], [m/s; m; m],
  [$δ, R_s$], [Profundidad de piel y resistencia superficial], [m; Ω/□],
)

#v(8pt)
#section-title([2. Ecuaciones de Maxwell])

#v(5pt)
*Contexto histórico.* Coulomb y Gauss fundamentaron la electrostática; Ørsted y Ampère relacionaron corriente y magnetismo; Faraday estableció la inducción; Maxwell añadió la corriente de desplazamiento y predijo las ondas electromagnéticas.

#v(4pt)
#compact-table(
  (1fr, 2.65fr, 0.75fr),
  [*Ley*], [*Forma integral*], [*Resultado*],
  [Gauss eléctrica], [$∯_S D dot d S = Q_("enc") = ∭_V ρ_v d V$], [C],
  [Gauss magnética], [$∯_S B dot d S = 0$], [Wb],
  [Faraday], [$∮_C E dot d l = - (d/d t) ∯_S B dot d S$], [V],
  [Ampère–Maxwell], [$∮_C H dot d l = ∯_S J dot d S + (d/d t) ∯_S D dot d S$], [A],
)

#v(5pt)
#formula([$∇ dot D = ρ_v quad ∇ dot B = 0$], [C/m³; T/m])
#formula([$∇ times E = - partial B / partial t quad ∇ times H = J + partial D / partial t$], [V/m²; A/m²])
#formula([$∇ dot J = - partial ρ_v / partial t$], [A/m³])
#formula([$∇ times E = -j ω μ H quad ∇ times H = (σ + j ω ε) E$], [V/m²; A/m²])

#note[
  *Aplicaciones:* Gauss eléctrica resuelve campos en geometrías simétricas; Faraday describe inducción y transformadores; Ampère–Maxwell explica la corriente de desplazamiento y la propagación de ondas.
]

#v(8pt)
#section-title([3. Ecuación de onda y onda plana uniforme])

#v(5pt)
#formula([$∇^2 E - μ σ partial E / partial t - μ ε partial^2 E / partial t^2 = 0$], [V/m³])
#formula([$∇^2 H - μ σ partial H / partial t - μ ε partial^2 H / partial t^2 = 0$], [A/m³])
#formula([$∇^2 E - γ^2 E = 0 quad ∇^2 H - γ^2 H = 0$], [V/m³; A/m³])

Para una onda plana uniforme que viaja en $+z$:

#formula([$E(z) = hat(x) E_0 e^(-γ z) quad H(z) = hat(y) (E_0 / η) e^(-γ z)$], [V/m; A/m])
#formula([$γ = α + j β = sqrt(j ω μ (σ + j ω ε))$], [m⁻¹])
#formula([$η = sqrt((j ω μ) / (σ + j ω ε))$], [Ω])
#formula([$v_p = ω / β quad λ = 2 π / β$], [m/s; m])
#formula([$α_("dB/m") = 8.686 α_("Np/m")$], [dB/m])

Los campos $E$, $H$ y la dirección de propagación son mutuamente perpendiculares. La amplitud de campo decae como $e^(-α z)$ y la potencia promedio como $e^(-2 α z)$.

#v(8pt)
#section-title([4. Propagación en medios materiales], color: teal)

#v(5pt)
#compact-table(
  (1.25fr, 1.35fr, 1.85fr, 1.55fr),
  [*Caso*], [*Condición*], [*γ*], [*η*],
  [Dieléctrico disipativo], [$σ > 0$], [$sqrt(j ω μ (σ + j ω ε))$], [$sqrt((j ω μ) / (σ + j ω ε))$],
  [Dieléctrico sin pérdidas], [$σ = 0$], [$j ω sqrt(μ ε)$], [$sqrt(μ / ε)$],
  [Espacio libre], [$σ = 0, ε = ε_0, μ = μ_0$], [$j ω / c$], [$η_0$],
  [Buen conductor], [$σ ≫ ω ε$], [$(1 + j) sqrt(ω μ σ / 2)$], [$(1 + j) sqrt(ω μ / (2 σ))$],
)

== 4.1 Dieléctrico disipativo

#formula([$α = ω sqrt((μ ε) / 2) sqrt(sqrt(1 + (σ / (ω ε))^2) - 1)$], [Np/m])
#formula([$β = ω sqrt((μ ε) / 2) sqrt(sqrt(1 + (σ / (ω ε))^2) + 1)$], [rad/m])

Para bajas pérdidas, $σ ≪ ω ε$ y $tan δ ≪ 1$:

#formula([$α approx (σ / 2) sqrt(μ / ε) quad β approx ω sqrt(μ ε) quad η approx sqrt(μ / ε) (1 + j tan δ / 2)$], [Np/m; rad/m; Ω])

== 4.2 Dieléctrico sin pérdidas

#formula([$σ = 0 quad α = 0 quad β = ω sqrt(μ ε)$], [S/m; Np/m; rad/m])
#formula([$η = sqrt(μ / ε) quad v_p = 1 / sqrt(μ ε) quad λ = 2 π / (ω sqrt(μ ε))$], [Ω; m/s; m])
#formula([$v_p approx c / sqrt(ε_r) quad η approx η_0 / sqrt(ε_r)$], [m/s; Ω])

== 4.3 Espacio libre

#formula([$α = 0 quad β = ω sqrt(μ_0 ε_0) = ω / c = 2 π / λ$], [Np/m; rad/m])
#formula([$v_p = c quad η_0 = sqrt(μ_0 / ε_0) approx 376.730 Ω quad λ = c / f$], [m/s; Ω; m])

== 4.4 Buenos conductores

#formula([$α approx β approx sqrt((ω μ σ) / 2) = sqrt(π f μ σ)$], [m⁻¹])
#formula([$γ approx (1 + j) sqrt((ω μ σ) / 2) quad η approx (1 + j) sqrt((ω μ) / (2 σ))$], [m⁻¹; Ω])
#formula([$δ = 1 / α = sqrt(2 / (ω μ σ)) = 1 / sqrt(π f μ σ)$], [m])
#formula([$R_s approx sqrt((ω μ) / (2 σ)) = 1 / (σ δ)$], [Ω/□])

#v(7pt)
#section-title([5. Valores típicos de los cuatro medios])

#v(5pt)
#compact-table(
  (1.55fr, 1.45fr, 1.2fr, 1.1fr),
  [*Caso y ejemplo*], [*$ε$*], [*$μ$*], [*$σ$*],
  [Dieléctrico disipativo: agua dulce a RF], [$ε_r approx 80$, $ε approx 7.08 times 10^(-10)$ F/m], [$μ_r approx 1$, $μ approx μ_0$], [$10^(-2)$ S/m],
  [Dieléctrico sin pérdidas: PTFE idealizado], [$ε_r approx 2.1$, $ε approx 1.86 times 10^(-11)$ F/m], [$μ_r approx 1$, $μ approx μ_0$], [$0$ S/m ideal],
  [Espacio libre], [$ε_0 = 8.854 times 10^(-12)$ F/m], [$μ_0 = 1.2566 times 10^(-6)$ H/m], [$0$ S/m],
  [Buen conductor: cobre recocido], [$ε approx ε_0$], [$μ_r approx 1$, $μ approx μ_0$], [$5.8 times 10^7$ S/m],
)

#v(7pt)
#section-title([6. Polarización, potencia y vector de Poynting])

#v(5pt)
#formula([$E(z) = (hat(x) E_(0x) + hat(y) E_(0y) e^(j δ)) e^(-γ z)$], [V/m])

#compact-table(
  (1fr, 2.8fr),
  [*Polarización*], [*Condición*],
  [Lineal], [$δ = 0$ o $π$, o una componente es nula],
  [Circular], [$abs(E_(0x)) = abs(E_(0y))$ y $δ = plus.minus π / 2$],
  [Elíptica], [Amplitudes distintas y/o desfase distinto de $0$, $π$ y $plus.minus π / 2$],
)

#formula([$S(t) = E(t) times H(t)$], [W/m²])
#formula([$S_c = 1/2 E times H^* quad angle S angle = Re(S_c)$], [VA/m²; W/m²])
#formula([$angle S angle = abs(E_0)^2 / (2 η) = η abs(H_0)^2 / 2$], [W/m²])
#formula([$angle S(z) angle = hat(z) abs(E_0)^2 / 2 Re(1 / η) e^(-2 α z)$], [W/m²])
#formula([$P = integral.double_S angle S angle dot dif S$], [W])

#v(8pt)
#section-title([7. Relaciones de consulta rápida], color: navy)

#v(5pt)
#formula([$γ = sqrt(j ω μ (σ + j ω ε)) quad η = sqrt((j ω μ) / (σ + j ω ε))$], [m⁻¹; Ω])
#formula([$E = η H times hat(k) quad H = (1 / η) hat(k) times E$], [V/m; A/m])
#formula([$λ = v_p / f = 2 π / β quad v_p = ω / β quad δ = 1 / α$], [m; m/s; m])

#v(8pt)
#align(center)[#text(size: 8pt, fill: slate)[Los valores de materiales son referencias didácticas; para diseño se deben usar datos a la frecuencia, temperatura y composición reales.]]
