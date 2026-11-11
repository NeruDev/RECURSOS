// Formulario Electromagnetismo — Tema 2 (hoja 13.97 x 10.8 cm, 1 cara)
// Líneas de transmisión: parámetros distribuidos, diseño geométrico por tipo de
// cable, reflexión/ROE, impedancia de entrada, decibelios y atenuación en coaxil.
// ω en rad/s y f en Hz.

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

#set text(font: "Libertinus Serif", size: 6.2pt, fill: rgb("#0f172a"))
#set par(leading: 0.96em, spacing: 0.66em)

// --- Atajos de notación ---
#let u(x) = box(text(fill: rgb("#64748b"))[\[#x\]])
#let sec(x) = block(above: 0.6em, below: 0.4em, sticky: true, text(weight: "bold", fill: rgb("#0f2747"), x))
#let ReOp = math.op("Re")
#let ImOp = math.op("Im")
#let exacta = box(text(size: 5.4pt, style: "italic", fill: rgb("#0f766e"))[exacta])
#let aprox = box(text(size: 5.4pt, style: "italic", fill: rgb("#b45309"))[aprox.])
#let nota(x) = text(size: 5.5pt, fill: rgb("#475569"), x)

#align(center)[
  #text(size: 8pt, weight: "bold", fill: rgb("#0f2747"))[Formulario — Electromagnetismo (Tema 2: Líneas de Transmisión)]
]
#v(4pt)

#columns(3, gutter: 2mm)[
  #sec[1. Constantes y Relaciones Base]
  $c = 2.997925 times 10^8$ #u[m/s] \
  $ε_0 = 8.854188 times 10^(-12)$ #u[F/m] \
  $μ_0 = 1.256637 times 10^(-6) = 4π times 10^(-7)$ #u[H/m] \
  $ε = ε_r ε_0 quad μ = μ_r μ_0 quad n = c/v_p = sqrt(μ_r ε_r)$ \
  $ω = 2π f$ #u[rad/s] $quad f = ω/(2π)$ #u[Hz] \
  $j = sqrt(-1)$ #u[adim.] $quad ε_r = ε/ε_0$ #u[adim.] \
  $1 "Np" approx 8.686 "dB"$ #u[dB/Np] \
  $α_("dB/m") = 8.686 α_("Np/m")$ \
  #nota[Distribuidos: $R$ #u[Ω/m] · $L$ #u[H/m]] \
  #nota[$G$ #u[S/m] · $C$ #u[F/m] · $ℓ$: longitud #u[m]]

  #sec[2. Parámetros Primarios]
  #nota[Línea con pérdidas: $R ≠ 0$ y $G ≠ 0$] \
  $Z_0 = sqrt((R + j ω L)/(G + j ω C))$ #u[Ω] #exacta \
  $γ = sqrt((R + j ω L)(G + j ω C))$ #u[m⁻¹] #exacta \
  $γ = α + j β$ #u[m⁻¹] \
  $α = ReOp(γ)$ #u[Np/m] $quad β = ImOp(γ)$ #u[rad/m]

  #sec[3. Línea sin Pérdidas]
  #nota[$R = 0$ y $G = 0$] \
  $Z_0 = sqrt(L/C)$ #u[Ω] #exacta \
  $β = ω sqrt(L C) = (ω L)/Z_0$ #u[rad/m] #exacta \
  $v_p = ω/β = 1/sqrt(L C)$ #u[m/s] #exacta \
  $λ = (2π)/β = v_p/f$ #u[m] #exacta \
  $T = ℓ/v_p$ #u[s] #exacta \
  #nota[$T$: retardo de extremo a extremo]

  #colbreak()

  #sec[4. Diseño Geométrico]
  #nota[Empíricas del fabricante · $ε_r$ del aislante · cocientes en la misma unidad (m, mm, in)] \

  *Cable bifilar* \
  $Z_0 = 276/sqrt(ε_r) log_10(D/a)$ #u[Ω] #aprox \
  #nota[$D$: separación entre centros · $a$: radio] \

  *Cable coaxial* \
  $Z_0 = 138/sqrt(ε_r) log_10(b/a)$ #u[Ω] #aprox \
  #nota[$b$: radio interior del externo · $a$: radio del interno] \

  *Microcinta* \
  $Z_0 = 87/sqrt(ε_r + 1.41) ln((5.98 h)/(0.8 w + t))$ #u[Ω] #aprox \
  #nota[$h$: dieléctrico · $w$: ancho de pista · $t$: calibre]

  #sec[5. Reflexión y ROE]
  $Γ = V_r/V_i$ #u[adim.] #exacta \
  $Γ_L = (Z_L - Z_0)/(Z_L + Z_0)$ #u[adim.] #exacta \
  $"SWR" = V_("max")/V_("min")$ #u[adim.] #exacta \
  $"SWR" = (1 + abs(Γ_L))/(1 - abs(Γ_L))$ #u[adim.] #exacta \
  #nota[$V_r$: reflejado · $V_i$: incidente · $abs(Γ_L)$ entre 0 y 1]

  #sec[6. Impedancia de Entrada]
  $Z_("in") = Z_0 (Z_L + Z_0 tanh(γ ℓ))/(Z_0 + Z_L tanh(γ ℓ))$ #u[Ω] #exacta \
  #nota[Línea con pérdidas · $ℓ$: longitud del tramo] \

  $Z_("in,cc") = Z_0 tanh(γ ℓ)$ #u[Ω] #exacta \
  #nota[Cortocircuito: $Z_L = 0$] \

  *Transformador de λ/4 (sin pérdidas)* \
  $Z_("in") = Z_0^2/Z_L$ #u[Ω] #exacta \
  $abs(V_S) = V_L (Z_0/Z_L)$ #u[V] #exacta \
  #nota[$V_L$: voltaje en el receptor · $V_S$: voltaje en el emisor]

  #colbreak()

  #sec[7. Decibelios y Niveles Absolutos]
  $A_P = 10 log_10 (P_("out")/P_("in"))$ #u[dB] #exacta \
  $A_V = 20 log_10 (V_("out")/V_("in"))$ #u[dB] #exacta \
  $"SNR"_("dB") = 10 log_10 (P_s/P_n)$ #u[dB] #exacta \
  #nota[$P_s$: potencia de señal · $P_n$: potencia de ruido] \
  $P_("dBm") = 10 log_10 (P/(1 "mW"))$ #u[dBm] #exacta \
  $P_("dBW") = 10 log_10 (P/(1 "W"))$ #u[dBW] #exacta \
  $V_("dBmV") = 20 log_10 (V/(1 "mV"))$ #u[dBmV] #exacta \
  $P_("dBW") = P_("dBm") - 30$ #u[dBW] #exacta \
  #nota[Regla 3/10 (potencia): $times 2 approx "+3 dB"$ · $div 2 approx "-3 dB"$ · $times 10 = "+10 dB"$] \
  #nota[En la carga: 50 Ω $P_("dBm") approx V_("dBmV") - 47$ · 75 Ω $P_("dBm") approx V_("dBmV") - 48.75$ #aprox]

  #sec[8. Cables Coaxiales y Atenuación]
  *50 Ω* — RF y datos: máximo manejo de potencia y mínimas pérdidas \
  #nota[LMR-400, RG-58, RG-213, RG-8] \
  *75 Ω* — TV/CATV, video y antenas: mínima pérdida de inserción en banda ancha \
  #nota[RG-6, RG-59, RG-11] \
  $A = α ℓ$ #u[dB] #exacta \
  #nota[$α$: atenuación específica en dB/m o dB/100 m] \
  $ℓ_("max") = "Margen"/α$ #u[m] #exacta \
  #nota[$"Margen" = P_("TX") - S_("RX") - "pérdidas"$] \
  $α_2 approx α_1 sqrt(f_2/f_1)$ #u[dB/m] #aprox \
  #nota[Ajuste: $α(f) = k_1 sqrt(f) + k_2 f$] \
  #nota[$k_1$: pérdidas resistivas · $k_2$: pérdidas del dieléctrico]]

