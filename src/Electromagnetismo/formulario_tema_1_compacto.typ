// Formulario Electromagnetismo — Tema 1 (hoja 13.97 x 10.8 cm, 1 cara)
// Orientación horizontal, 4 medios materiales, forma diferencial de Maxwell y relaciones clave.

#set page(
  width: 13.97cm,
  height: 10.8cm,
  margin: (x: 5mm, y: 5mm),
  background: rect(
    width: 100%,
    height: 100%,
    stroke: 0.5pt + black // Cambiado a color negro
  )
)

#set text(font: "Libertinus Serif", size: 5.3pt, fill: rgb("#0f172a"))
#set par(leading: 0.9em, spacing: 0.7em)

// --- Atajos de notación ---
#let vE = $bold(E)$
#let vH = $bold(H)$
#let vD = $bold(D)$
#let vB = $bold(B)$
#let vJ = $bold(J)$
#let vS = $bold(S)$
#let u(x) = text(fill: rgb("#64748b"))[\[#x\]]
#let sec(x) = block(above: 0.7em, below: 0.7em, sticky: true, text(weight: "bold", fill: rgb("#0f2747"), x))
#let ReOp = math.op("Re")

#align(center)[
  #text(size: 7.5pt, weight: "bold", fill: rgb("#0f2747"))[Formulario — Electromagnetismo (Tema 1: Ondas Planas Uniformes)]
]
#v(3pt)

#columns(3, gutter: 2.0mm)[
  #sec[1. Constantes y Relaciones Base]
  $c = 2.997925 times 10^8$ #u[m/s] \
  $ε_0 = 8.854188 times 10^(-12)$ #u[F/m] \
  $μ_0 = 1.256637 times 10^(-6) = 4π times 10^(-7)$ #u[H/m] \
  $η_0 = sqrt(μ_0/ε_0) = 376.7303 approx 120π$ #u[Ω] \
  $vD = ε vE quad vB = μ vH quad vJ = σ vE$ \
  $ε = ε_r ε_0 quad μ = μ_r μ_0 quad n = c/v_p = sqrt(μ_r ε_r)$ \
  $tan θ = σ/(ω ε) = ε''/ε'$ #u[adim.] $quad ε_c = ε(1 - j tan θ)$ \
  $f_c = σ/(2π ε)$ #u[Hz] (Transición $J_c = J_d$) $quad τ_("rel") = ε/σ$ #u[s] \
  $ω = 2π f$ #u[rad/s] $quad α_("dB/m") = 8.686 α_("Np/m")$

  #sec[2. Ecuaciones de Maxwell (Diferencial)]
  _Dominio del Tiempo:_ \
  $nabla dot vD = ρ_v$ #u[C/m³] $quad nabla dot vB = 0$ #u[T] \
  $nabla times vE = - (partial vB)/(partial t)$ #u[V/m²] \
  $nabla times vH = vJ + (partial vD)/(partial t)$ #u[A/m²] \
  _Dominio Fasorial ($e^(j ω t)$):_ \
  $nabla dot vD = ρ_v quad nabla dot vB = 0$ \
  $nabla times vE = -j ω μ vH$ \
  $nabla times vH = (σ + j ω ε) vE = vJ_c + vJ_d$ \
  _Continuidad y Fronteras ($hat(n)$ de 2 a 1):_ \
  $nabla dot vJ = - (partial ρ_v)/(partial t)$ #u[A/m³] \
  $hat(n) times (vE_1 - vE_2) = 0 quad hat(n) dot (vD_1 - vD_2) = ρ_s$ #u[C/m²] \
  $hat(n) times (vH_1 - vH_2) = vJ_s$ #u[A/m] $quad hat(n) dot (vB_1 - vB_2) = 0$

  #sec[3. Onda Plana Uniforme]
  $γ = α + j β = sqrt(j ω μ (σ + j ω ε))$ #u[m⁻¹] \
  $η = sqrt((j ω μ)/(σ + j ω ε)) = abs(η) e^(j θ_η)$ #u[Ω] \
  $vE(z) = hat(x) E_0 e^(-α z) e^(-j β z)$ #u[V/m] \
  $vH(z) = hat(y) (E_0/η) e^(-α z) e^(-j β z)$ #u[A/m] \
  $vH = 1/η hat(a)_k times vE quad vE = -η hat(a)_k times vH$ \
  _Tiempo:_ \
  $vE(z,t) = hat(x) abs(E_0) e^(-α z) cos(ω t - β z + φ)$ \
  $vH(z,t) = hat(y) (abs(E_0)/abs(η)) e^(-α z) cos(ω t - β z + φ - θ_η)$

  #colbreak()

  #sec[4. Propagación en los 4 Medios Materiales]

  *A. Espacio Libre* ($σ = 0, ε = ε_0, μ = μ_0$) \
   _Valores:_ $ε_r = 1, μ_r = 1, σ = 0$ \
   $α = 0, quad β = ω/c = ω sqrt(μ_0 ε_0)$ #u[rad/m] \
   $δ = 1/β = c/ω$ #u[m] \
   $η = η_0 approx 376.73 Ω, quad θ_η = 0$ \
   $v_p = c = 1/sqrt(μ_0 ε_0) approx 2.998 times 10^8$ #u[m/s] \
   $λ = c/f = (2π)/β$ #u[m]

  #v(6pt)
  *B. Dieléctrico Sin Pérdidas* ($σ = 0$) \
   _Valores:_ $σ = 0, ε_r ≥ 1, μ_r ≈ 1$ (ej. Teflón $ε_r = 2.1$) \
   $α = 0, quad β = ω sqrt(μ ε)$ #u[rad/m] \
   $η = sqrt(μ/ε) = η_0 sqrt(μ_r/ε_r)$ #u[Ω], $quad θ_η = 0$ \
   $v_p = 1/sqrt(μ ε) = c/sqrt(μ_r ε_r)$ #u[m/s] \
   $λ = v_p/f = (2π)/β = λ_0/sqrt(μ_r ε_r)$ #u[m]

  #v(6pt)
  *C. Dieléctrico Disipativo / Bajas Pérdidas* \
   _Gral ($σ > 0$):_ $α, β$ según raíz completa ($tan θ = σ/(ω ε)$) \
   _Bajas Pérdidas ($tan θ < 0.01$):_ \
    _Valores:_ $ε_r ≈ 2-80, σ ≈ 10^(-4)-10^(-2)$ S/m, $μ_r ≈ 1$ \
    $α approx (σ/2) sqrt(μ/ε)$ #u[Np/m], $quad β approx ω sqrt(μ ε)$ #u[rad/m] \
    $η approx sqrt(μ/ε)(1 + j (tan θ)/2)$ #u[Ω], $quad θ_η approx θ/2$ \
    $v_p approx 1/sqrt(μ ε)$ #u[m/s], $quad λ approx v_p/f = (2π)/(ω sqrt(μ ε))$ #u[m]

 #v(6pt)
  *D. Buen Conductor* ($σ ≫ ω ε, tan θ > 100$) \
   _Valores:_ $σ ≈ 10^7$ S/m (Cu: $5.8 times 10^7$), $ε_r ≈ 1, μ_r ≈ 1$ \
   $α approx β approx sqrt(π f μ σ) = 1/δ$ #u[m⁻¹] \
   $η approx (1+j) sqrt((ω μ)/(2σ)) = sqrt((ω μ)/σ) e^(j π/4)$ #u[Ω] ($θ_η = 45°$) \
   $δ = 1/sqrt(π f μ σ)$ #u[m], $quad R_s = 1/(σ δ) = sqrt((π f μ)/σ)$ #u[Ω/□] \
   $v_p approx ω δ = sqrt((2 ω)/(μ σ))$ #u[m/s] \
   $λ approx 2π δ = (2π)/α$ #u[m]

#colbreak()

  #sec[5. Potencia, Poynting y Energía]
  $vS(t) = vE(t) times vH(t)$ #u[W/m²] \
  $quad vS_c = 1/2 vE times vH^*$ #u[VA/m²] \
  \
  $lr(chevron.l vS chevron.r) = ReOp(vS_c) = (abs(E_0)^2 / (2 abs(η))) cos(θ_η) e^(-2 α z) hat(z)$ #u[W/m²] \
  \
  Sin pérdidas: $lr(chevron.l vS chevron.r) = (abs(E_0)^2 / (2 η)) hat(z) = 1/2 η abs(H_0)^2 hat(z)$ \
  \
  Potencia: $P = ∬ lr(chevron.l vS chevron.r) dot dif bold(s)$ #u[W] $quad P(z) = P_0 e^(-2 α z)$ \
  Pérdidas en conductor: $P_L = 1/2 R_s abs(H_t)^2$ #u[W/m²] \
  Energía: $w_e = 1/2 ε E^2, quad w_m = 1/2 μ H^2$ #u[J/m³]

  #v(6pt)
  #sec[6. Polarización ($vE = (hat(x) E_x + hat(y) E_y e^(j Δ φ)) e^(-γ z)$)]
  Lineal: $Δ φ = 0, π$ \
  Circular: $E_x = E_y, quad Δ φ = -π/2$ (der) / $+π/2$ (izq) \
  Elíptica: $E_x ≠ E_y$ y/o $Δ φ ≠ 0, π, plus.minus π/2$
]