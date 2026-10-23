---
id: 24_practica_2
name: practica_2
title: "Práctica 2: Líneas de Transmisión, Ganancia, Atenuación, Ruido, Interferencia y Bandas de Octava"
file_path: src/Electromagnetismo/practica_2.md
version: 1.0.0
category: guides
domain: Electromagnetismo
tags: [electromagnetismo, practica-2, lineas-transmision, ganancia, atenuacion, ruido, interferencia, decibel, octava, bibliografia]
description: "Cuestionario ordenado y verificado de la Práctica 2: definiciones técnicas corregidas, fórmulas en LaTeX, clasificación de líneas de transmisión y bibliografía validada con estado de verificación."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-10-23T11:20:00-06:00
updated_at: 2026-10-23T11:20:00-06:00
dependencies: [00_agents_contract, 12_temario_electromagnetismo, 23_formulario_tema_1]
schema_version: 1.0.0
---

# Práctica 2: Líneas de Transmisión, Ganancia, Atenuación, Ruido, Interferencia y Bandas de Octava

## 1. Convenciones de lectura

- **Convención fasorial:** $e^{+j\omega t}$. Una onda que viaja en $+z$ lleva el factor $e^{-\gamma z}$ con $\gamma=\alpha+j\beta$ (la misma convención del [formulario del Tema 1](./formulario_tema_1.md)).
- **Unidades:** cada ecuación indica entre corchetes la unidad SI del resultado. El radian y el neper son adimensionales, pero se conservan como $\text{rad}$ y $\text{Np}$ para distinguir ángulo de atenuación.
- **Citas:** los números entre corchetes remiten a la bibliografía de la §6; el estado de comprobación de cada fuente está en la §7.
- **Alcance:** el cuestionario corresponde al Tema 2 del [temario](./temario.md) (líneas de transmisión). Los ítems de ganancia de antena, ruido, interferencia y bandas de octava introducen vocabulario de telecomunicaciones que el temario desarrolla en los temas 3 y 4.

## 2. Cuestionario

### 2.1 Línea de transmisión y sus parámetros

**Definición.** El término designa dos objetos distintos que conviene no confundir:

1. **Línea de transmisión en telecomunicaciones (acepción del Tema 2):** estructura guiadora formada por dos o más conductores que conduce energía electromagnética entre un generador y una carga en forma de onda transversal electromagnética (TEM) o cuasi-TEM. Ejemplos: par trenzado, cable coaxial, microcinta. Su tratamiento exige un modelo de parámetros distribuidos [14].
2. **Línea de transmisión en sistemas eléctricos de potencia:** estructura metálica (postes y conductores aéreos, o cables subterráneos) que transporta energía eléctrica a gran distancia entre la central generadora y los centros de carga [5], [17].

El texto original de la práctica describe únicamente la segunda acepción; se conserva aquí porque es la que fundamenta la §3 (clasificación por longitud).

#### 2.1.1 Constantes primarias o parámetros distribuidos

En un elemento diferencial de longitud $\Delta z$ la línea se representa con cuatro parámetros por unidad de longitud [14]:

| Parámetro | Símbolo | Unidad SI | Origen físico |
|---|---|---|---|
| Resistencia serie | $R$ | $\Omega/\text{m}$ | Pérdidas óhmicas en los conductores |
| Inductancia serie | $L$ | $\text{H/m}$ | Campo magnético alrededor de los conductores |
| Conductancia de derivación | $G$ | $\text{S/m}$ | Pérdidas en el dieléctrico del aislamiento |
| Capacitancia de derivación | $C$ | $\text{F/m}$ | Campo eléctrico entre conductores |

Con $Z'=R+j\omega L$ (impedancia serie por unidad de longitud) e $Y'=G+j\omega C$ (admitancia de derivación por unidad de longitud), las ecuaciones del telegrafista son:

$$
\frac{\partial v}{\partial z}=-\left(R\,i+L\frac{\partial i}{\partial t}\right)\quad[\text{V/m}],
\qquad
\frac{\partial i}{\partial z}=-\left(G\,v+C\frac{\partial v}{\partial t}\right)\quad[\text{A/m}]
$$

En régimen senoidal permanente:

$$
\frac{dV}{dz}=-Z'I=-(R+j\omega L)I,
\qquad
\frac{dI}{dz}=-Y'V=-(G+j\omega C)V
$$

Cuya solución general es una onda incidente y una reflejada:

$$
V(z)=V_0^{+}e^{-\gamma z}+V_0^{-}e^{+\gamma z},
\qquad
I(z)=\frac{V_0^{+}}{Z_0}e^{-\gamma z}-\frac{V_0^{-}}{Z_0}e^{+\gamma z}
$$

#### 2.1.2 Impedancia característica

Es la relación $V^{+}/I^{+}$ de la onda incidente; relaciona tensión y corriente en cada punto de una línea infinitamente larga o terminada en su impedancia característica [1], [14]:

$$
Z_0=\sqrt{\frac{Z'}{Y'}}=\sqrt{\frac{R+j\omega L}{G+j\omega C}}\quad[\Omega]
$$

Casos particulares:

$$
\text{sin pérdidas }(R=G=0):\quad Z_0=\sqrt{\frac{L}{C}}\quad[\Omega]\ \text{(real)}
$$

$$
\text{bajas pérdidas }(R\ll\omega L,\ G\ll\omega C):\quad
Z_0\approx\sqrt{\frac{L}{C}}\left[1+j\left(\frac{G}{2\omega C}-\frac{R}{2\omega L}\right)\right]
$$

En un medio homogéneo que soporta TEM, $Z_0$ coincide con la impedancia intrínseca del medio y $LC=\mu\varepsilon$:

$$
Z_0=\sqrt{\frac{\mu}{\varepsilon}}=\eta
\qquad\Longrightarrow\qquad
v_p=\frac{1}{\sqrt{LC}}=\frac{1}{\sqrt{\mu\varepsilon}}
$$

Para un cable coaxial con dieléctrico no magnético, la forma cerrada habitual es $Z_0=\dfrac{60}{\sqrt{\varepsilon_r}}\ln\dfrac{b}{a}$, con $b$ radio de la malla externa y $a$ radio del conductor interno.

#### 2.1.3 Constante de propagación

Describe simultáneamente la atenuación y el desfase por unidad de longitud [14]:

$$
\gamma=\alpha+j\beta=\sqrt{Z'Y'}=\sqrt{(R+j\omega L)(G+j\omega C)}\quad[\text{m}^{-1}]
$$

- $\alpha$: constante de atenuación [$\text{Np/m}$].
- $\beta$: constante de fase [$\text{rad/m}$].

$$
\text{bajas pérdidas}:\qquad
\alpha\approx\frac{R}{2Z_0}+\frac{GZ_0}{2}\quad[\text{Np/m}],
\qquad
\beta\approx\omega\sqrt{LC}\quad[\text{rad/m}]
$$

$$
\text{sin pérdidas}:\qquad
\alpha=0,
\qquad
\beta=\omega\sqrt{LC},
\qquad
v_p=\frac{\omega}{\beta}=\frac{1}{\sqrt{LC}}\quad[\text{m/s}],
\qquad
\lambda=\frac{2\pi}{\beta}\quad[\text{m}]
$$

Conversión de atenuación entre unidades:

$$
\alpha\ [\text{dB/m}]=20\log_{10}(e)\,\alpha\ [\text{Np/m}]=8.686\,\alpha\ [\text{Np/m}]
$$

#### 2.1.4 Parámetros secundarios de consulta rápida

Con $\ell$ la longitud física de la línea, $Z_L$ la impedancia de carga y $\Gamma$ el coeficiente de reflexión:

$$
\Gamma=\frac{Z_L-Z_0}{Z_L+Z_0},
\qquad
\text{ROE}=\frac{1+|\Gamma|}{1-|\Gamma|},
\qquad
Z_{in}=Z_0\,\frac{Z_L+Z_0\tanh\gamma\ell}{Z_0+Z_L\tanh\gamma\ell}
$$

En una línea sin pérdidas, $\tanh\gamma\ell$ se sustituye por $j\tan\beta\ell$ y $\text{ROE}=1$ cuando $Z_L=Z_0$ (línea adaptada).

### 2.2 Ganancia

La ganancia expresa una relación adimensional entre una magnitud de salida y una de entrada, o entre una magnitud y su referencia. En esta práctica aparecen dos definiciones que el texto original mezclaba y que deben separarse.

#### 2.2.1 Ganancia de una red de dos puertos

Relación entre la potencia entregada a la carga y la potencia de entrada [14]:

$$
G=\frac{P_{out}}{P_{in}},
\qquad
G_{dB}=10\log_{10}\frac{P_{out}}{P_{in}}
$$

Si la impedancia de entrada y de salida son iguales, también se calcula con amplitudes:

$$
G_{dB}=20\log_{10}\frac{V_{out}}{V_{in}}=20\log_{10}\frac{I_{out}}{I_{in}}
$$

#### 2.2.2 Ganancia de antena

Es la magnitud empleada en el cuestionario. Se define como $4\pi$ veces la intensidad de radiación en una dirección dada, dividida entre la potencia **entregada a la antena**, comparada con la de una antena isotrópica alimentada con la misma potencia [14]:

$$
G(\theta,\phi)=\frac{4\pi\,U(\theta,\phi)}{P_{in}}\quad[\text{adimensional}]
$$

$$
D(\theta,\phi)=\frac{4\pi\,U(\theta,\phi)}{P_{rad}}\quad[\text{adimensional}]
$$

$$
G=e_{cd}\,D,
\qquad
e_{cd}=\frac{P_{rad}}{P_{in}},
\qquad
G=\frac{4\pi A_{eff}}{\lambda^{2}}
$$

$$
G_{dBi}=10\log_{10}G,
\qquad
G_{dBd}=G_{dBi}-2.15
$$

$$
\text{PIRE}=P_t\,G_t\quad[\text{W}]
$$

El dipolo de media onda tiene $D=1.64$, es decir $2.15\ \text{dBi}$, y una antena isotrópica ideal tiene $G=1$ ($0\ \text{dBi}$).

> **Precisión sobre el texto original:** la frase «relación entre la potencia que entra en una antena y la potencia que sale de esta» define la **eficiencia de radiación** $e_{cd}=P_{rad}/P_{in}$, no la ganancia. La fuente [18] repite esa formulación imprecisa; la definición correcta es la de las ecuaciones anteriores.

### 2.3 Atenuación

Pérdida de potencia de una señal al propagarse por un medio, una guía o un componente, evaluada como función de la distancia y de la frecuencia. Se expresa en decibeles y, cuando se normaliza por longitud, en $\text{dB/m}$ o $\text{dB/km}$ [15]:

$$
A_{dB}=10\log_{10}\frac{P_{in}}{P_{out}}\ \ge 0,
\qquad
\alpha_{dB}=\frac{A_{dB}}{\ell}\quad[\text{dB/m}]
$$

La atenuación de una línea con constante $\alpha$ produce decaimiento exponencial de tensión y de potencia:

$$
V(z)=V(0)\,e^{-\alpha z},
\qquad
P(z)=P(0)\,e^{-2\alpha z}
$$

En el espacio libre, la pérdida de trayectoria asociada a la ley de Friis es [14]:

$$
L_{FS}=20\log_{10}\frac{4\pi d}{\lambda}
=32.44+20\log_{10}f_{MHz}+20\log_{10}d_{km}\quad[\text{dB}]
$$

En fibra óptica se usa la ley de Beer-Lambert con coeficiente en $\text{dB/km}$, y el presupuesto de enlace se cierra con ganancias y pérdidas:

$$
P(L)=P(0)\,10^{-\alpha_{dB}L/10},
\qquad
P_r=P_t+G_t+G_r-L_{total}\quad[\text{dB}]
$$

> **Precisión sobre el texto original:** el párrafo original era una enumeración de aplicaciones (ultrasonido, microondas, enlaces ópticos) sin definición ni unidades. Se conserva el contexto de aplicaciones y se añade la definición formal, la distinción entre $\text{Np/m}$ y $\text{dB/m}$, y el vínculo con el presupuesto de enlace.

### 2.4 Ruido

Perturbación eléctrica **aleatoria e inevitable**, de origen interno o externo, que se suma a la señal y limita la detección. A diferencia de la interferencia, no tiene forma de onda determinista ni fase o frecuencia fijas: se describe estadísticamente (densidad espectral de potencia, valor eficaz, distribución de amplitud) [11], [13].

| Criterio | Ruido | Interferencia |
|---|---|---|
| Origen | Interno del dispositivo o del medio (térmico, granalla, centelleo) o externo natural (cósmico, atmosférico) | Externo: otros transmisores, equipos eléctricos, radiación no intencional |
| Naturaleza | Aleatoria, continua o impulsiva no periódica | Determinista, periódica o modulada |
| Reducción | Se minimiza (enfriamiento, diseño de bajo ruido), no se elimina | Puede eliminarse o atenuarse (filtrado, apantallamiento, coordinación de frecuencias) |

Ruido térmico (Johnson-Nyquist) en una resistencia $R$ a temperatura $T$, sobre un ancho de banda $B$ [9]:

$$
P_n=kTB\quad[\text{W}],
\qquad
N_0=kT\quad[\text{W/Hz}],
\qquad
v_n=\sqrt{4kTRB}\quad[\text{V}]
$$

con $k=1.380\,649\times10^{-23}\ \text{J/K}$. A $T_0=290\ \text{K}$ resulta $N_0=4.00\times10^{-21}\ \text{W/Hz}\approx-174\ \text{dBm/Hz}$.

Ruido de granalla (*shot noise*), asociado al carácter discreto de la corriente [11]:

$$
i_n=\sqrt{2qIB}\quad[\text{A}],
\qquad
q=1.602\,176\,634\times10^{-19}\ \text{C}
$$

Relación señal a ruido, factor de ruido y temperatura equivalente:

$$
\mathrm{SNR}=\frac{P_s}{P_n},
\qquad
\mathrm{SNR}_{dB}=10\log_{10}\frac{P_s}{P_n}
$$

$$
F=\frac{S_i/N_i}{S_o/N_o}=1+\frac{T_e}{T_0},
\qquad
T_e=T_0\,(F-1),
\qquad
F_{dB}=10\log_{10}F
$$

En cascada de etapas (Friis), el factor de ruido total está dominado por la primera etapa:

$$
F_{\mathrm{cas}}=F_1+\frac{F_2-1}{G_1}+\frac{F_3-1}{G_1G_2}+\cdots
$$

$$
T_{sys}=T_a+T_r,
\qquad
N=k\,(T_a+T_r)\,B
$$

El ruido fija el límite de la capacidad del canal (Shannon-Hartley):

$$
C=B\log_2(1+\mathrm{SNR})\quad[\text{bit/s}]
$$

El ruido radioeléctrico externo (atmosférico, cósmico, industrial) se cuantifica con la recomendación UIT-R P.372 [8].

### 2.5 Interferencia

Energía electromagnética **de origen ajeno al sistema** que ocupa el mismo canal o una banda adyacente y degrada la recepción, la demodulación o el procesamiento de la señal útil [3], [13]. El texto original describía correctamente sus dos causas más frecuentes (transmisores y equipos eléctricos); se formaliza la clasificación:

| Tipo | Descripción |
|---|---|
| Co-canal | Otro emisor en la misma frecuencia; se evalúa con la relación $C/I$ |
| De canal adyacente | Emisiones fuera de banda o mala selectividad del receptor |
| Intermodulación | Productos de mezcla entre portadoras en etapas no lineales |
| EMI conducida | Perturbación que llega por cables de alimentación o de señal |
| EMI radiada | Perturbación que llega por el campo electromagnético |

Métricas de calidad del enlace con interferencia [13]:

$$
\mathrm{SINR}=\frac{P_s}{\sum_k P_{I,k}+N},
\qquad
\mathrm{SINR}_{dB}=10\log_{10}\frac{P_s}{\sum_k P_{I,k}+N}
$$

$$
\left(\frac{C}{I}\right)_{min}\ \text{(relación de protección)},
\qquad
P_{I,r}=P_{I,t}+G_t(\theta_t)+G_r(\theta_r)-L\quad[\text{dB}]
$$

La última ecuación permite calcular, con la ley de Friis, la potencia interferente que llega al receptor y compararla con el umbral de protección del servicio.

### 2.6 Octava

Intervalo de frecuencia en el que la frecuencia superior duplica a la inferior; es la base de las bandas normalizadas empleadas para medir ruido y niveles de presión sonora [7], [12], [16]:

$$
f_u=2f_l,
\qquad
f_c=\sqrt{f_l\,f_u}=\sqrt{2}\,f_l=\frac{f_u}{\sqrt{2}}
$$

$$
\Delta f=f_u-f_l=f_l=\frac{f_c}{\sqrt{2}}\approx0.707\,f_c
$$

Número de octavas y de cents entre dos frecuencias:

$$
n=\log_2\frac{f_2}{f_1}=\frac{\log_{10}(f_2/f_1)}{\log_{10}2},
\qquad
N_{cents}=1200\log_2\frac{f_2}{f_1}
$$

Las frecuencias centrales preferidas de la serie de octava están normalizadas por ISO 266 como $f_{c,n}=1000\cdot10^{n/10}\ \text{Hz}$ [7]; los valores nominales de uso corriente son 63, 125, 250, 500, 1000, 2000, 4000 y 8000 Hz, cuyos valores exactos son:

| $f_c$ nominal (Hz) | 63 | 125 | 250 | 500 | 1000 | 2000 | 4000 | 8000 |
|---|---|---|---|---|---|---|---|---|
| $f_c$ exacta (Hz) | 63.10 | 125.89 | 251.19 | 501.19 | 1000.00 | 1995.26 | 3981.07 | 7943.28 |

> **Precisión sobre el texto original:** el texto llamaba «frecuencias medias» a esos valores. Son **frecuencias centrales nominales** de banda; los extremos de la banda se obtienen con $f_l=f_c/\sqrt{2}$ y $f_u=\sqrt{2}f_c$.

Ensayos de tercio de octava ($N=3$), habituales en acústica: $f_u=2^{1/3}f_l\approx1.2599f_l$.

### 2.7 Media octava (½ octava)

Banda fraccionaria con $N=2$: la frecuencia superior excede a la inferior en un factor $\sqrt{2}$, equivalente a 600 cents, es decir 6 semitonos temperados [7], [10]:

$$
f_u=\sqrt{2}\,f_l\approx1.414\,214\,f_l,
\qquad
f_c=2^{1/4}f_l\approx1.189\,207\,f_l
$$

$$
\frac{\Delta f}{f_l}=\sqrt{2}-1\approx0.414\,214\ (41.42\ \%),
\qquad
\frac{\Delta f}{f_c}=2^{1/4}-2^{-1/4}\approx0.348\,308\ (34.83\ \%)
$$

**Ejemplo verificado.** Para $f_l=440\ \text{Hz}$: $f_u=440\sqrt{2}=622.25\ \text{Hz}$ (nota Re♯5/Mi♭5) y $f_c=2^{1/4}\cdot440=523.25\ \text{Hz}$.

> **Corrección de un error del texto original:** la versión previa afirmaba que «media octava es la mitad de la distancia entre 440 Hz y 880 Hz, que es 660 Hz» y que 660 Hz es Mi, 7 semitonos por encima de La. Ese valor es el **punto medio aritmético** $(440+880)/2=660\ \text{Hz}$, que corresponde a Mi5 ($659.26\ \text{Hz}$) y a una quinta justa de relación $3{:}2$; **no** es una media octava. La interpretación proviene de la fuente musical [10], donde la octava se divide en tramos «melódicos» de 7 y 5 semitonos; en acústica, telecomunicaciones y normalización, la media octava es la banda de relación $\sqrt{2}$ y 6 semitonos (600 cents).

### 2.8 Decibel

Unidad logarítmica adimensional que expresa la relación entre dos potencias, o entre dos amplitudes de la misma naturaleza y con igual impedancia [2], [6]:

$$
L_{dB}=10\log_{10}\frac{P_1}{P_2}=20\log_{10}\frac{A_1}{A_2}
$$

Referencias de uso frecuente:

| Unidad | Referencia | Uso |
|---|---|---|
| $\text{dBm}$ | $1\ \text{mW}$ | Potencia en radiofrecuencia y fibra |
| $\text{dBW}$ | $1\ \text{W}$ | Potencia de transmisores |
| $\text{dB}\mu\text{V}$ | $1\ \mu\text{V}$ | Nivel de tensión en receptores |
| $\text{dBi}$ | Antena isotrópica | Ganancia de antena |
| $\text{dBd}$ | Dipolo de media onda | Ganancia de antena ($0\ \text{dBd}=2.15\ \text{dBi}$) |
| $\text{dB SPL}$ | $p_0=20\ \mu\text{Pa}$ | Nivel de presión sonora |
| $\text{dB(A)}$ | Curva de ponderación A | Nivel sonoro corregido por audición |

$$
L_{dBm}=10\log_{10}\frac{P}{1\ \text{mW}},
\qquad
L_{dBW}=10\log_{10}\frac{P}{1\ \text{W}}
$$

$$
L_p=20\log_{10}\frac{p}{p_0}\quad[\text{dB SPL}],
\qquad
L_I=10\log_{10}\frac{I}{I_0}\quad[\text{dB}],
\qquad
I_0=10^{-12}\ \text{W/m}^2
$$

Suma de niveles expresados en decibeles (las potencias se suman, los decibeles no):

$$
L_{tot}=10\log_{10}\sum_i 10^{L_i/10}
$$

Equivalencias de interpretación:

| Variación | Potencia | Tensión o presión | Sonoridad percibida |
|---|---|---|---|
| $3.01\ \text{dB}$ | $\times 2$ | $\times 1.41$ | Apenas perceptible |
| $10\ \text{dB}$ | $\times 10$ | $\times 3.16$ | Aproximadamente $\times 2$ |
| $20\ \text{dB}$ | $\times 100$ | $\times 10$ | Aproximadamente $\times 4$ |

> **Precisión sobre el texto original:** «cada aumento de 10 dB representa un sonido 10 veces más intenso» es correcto para la **potencia o intensidad acústica**, no para la **sonoridad subjetiva** (que se duplica aproximadamente cada 10 dB) ni para la **presión sonora** (para la que se requieren 20 dB para multiplicar por 10). La fuente [6] no pudo validarse (§7), por lo que la definición se respalda en [2].

## 3. Investigación: tipos de líneas de transmisión en función de su longitud

La clasificación por longitud (corta, media y larga) pertenece al análisis de **líneas de energía eléctrica** y se apoya en la magnitud de la capacitancia de derivación [5], [17]. Los umbrales son convencionales y varían según la referencia normativa; los de la tabla corresponden a [17].

| Clase | Longitud | Tensión de operación | Modelo de análisis | Elementos considerados |
|---|---|---|---|---|
| Corta | menos de $50\ \text{km}$ | menos de $20\ \text{kV}$ | Parámetros concentrados, sin derivación | $R$ y $L$ (o $Z=R+jX$) |
| Media | $50$ a $150\ \text{km}$ | más de $20\ \text{kV}$ | Capacitancia concentrada (T o π nominal) | $R$, $L$ y $C$ localizada |
| Larga | más de $150\ \text{km}$ | más de $100\ \text{kV}$ | Parámetros distribuidos, solución rigurosa | $R$, $L$, $G$ y $C$ uniformes |

### 3.1 Línea de transmisión corta

Se desprecia el efecto capacitivo por la baja longitud y la baja tensión de operación; el circuito equivalente es una impedancia serie total:

$$
V_s=V_r+I_r\,Z,
\qquad
I_s=I_r,
\qquad
Z=(R+jX)\,\ell\quad[\Omega]
$$

La regulación de tensión se evalúa como $|V_s|-|V_r|$ referida a $|V_r|$.

### 3.2 Línea de transmisión media

La corriente de carga es significativa y la capacitancia se incluye como elemento de derivación. Para el cálculo se concentra la capacitancia total de la línea en puntos discretos, lo que da tres configuraciones:

| Configuración | Distribución de $C$ | Efecto sobre $V_s$ |
|---|---|---|
| T nominal (condensador medio) | $Z/2$ a cada lado y $Y$ en el centro | Sobrecompensa: $V_s$ algo menor |
| Condensador final | $Y$ concentrada en el extremo receptor | Caso particular de análisis aproximado |
| π nominal | $Y/2$ en cada extremo y $Z$ en serie | Subcompensa: $V_s$ algo mayor |

Con $Z=(R+j\omega L)\ell$ e $Y=(G+j\omega C)\ell$ totales, los parámetros de transmisión $ABCD$ de ambos modelos son:

$$
\text{T nominal:}\quad
A=D=1+\frac{ZY}{2},
\qquad
B=Z\left(1+\frac{ZY}{4}\right),
\qquad
C=Y
$$

$$
\text{π nominal:}\quad
A=D=1+\frac{ZY}{2},
\qquad
B=Z,
\qquad
C=Y\left(1+\frac{ZY}{4}\right)
$$

### 3.3 Línea de transmisión larga

Las constantes deben distribuirse uniformemente y la solución rigurosa emplea funciones hiperbólicas:

$$
V_s=V_r\cosh\gamma\ell+I_r\,Z_0\sinh\gamma\ell,
\qquad
I_s=I_r\cosh\gamma\ell+\frac{V_r}{Z_0}\sinh\gamma\ell
$$

$$
A=D=\cosh\gamma\ell,
\qquad
B=Z_0\sinh\gamma\ell,
\qquad
C=\frac{\sinh\gamma\ell}{Z_0}
$$

El modelo π exacto (equivalente distribuido del π nominal) corrige los valores nominales con el factor $\dfrac{\sinh\gamma\ell}{\gamma\ell}$:

$$
Z_{\pi}=Z_0\sinh\gamma\ell,
\qquad
\frac{Y_{\pi}}{2}=\frac{\tanh(\gamma\ell/2)}{Z_0}
$$

### 3.4 Criterio complementario: longitud eléctrica en radiofrecuencia

En el Tema 2 del temario, una línea de telecomunicaciones no se clasifica por kilómetros sino por **longitud eléctrica** $\theta=\beta\ell=2\pi\ell/\lambda$:

| Condición | Régimen | Consecuencia práctica |
|---|---|---|
| $\ell\le\lambda/10$ | Eléctricamente corta | Aproximación cuasi-estática válida; la línea se trata como nodo |
| $\ell\approx\lambda/4$ | Cuarto de onda | Transformación de impedancia (inversión); $Z_{in}=Z_0^{2}/Z_L$ sin pérdidas |
| $\ell\ge\lambda$ | Línea larga | Modelo distribuido obligatorio; efectos de retardo y onda estacionaria |

## 4. Correcciones y precisiones aplicadas al texto original

| # | Ítem | Contenido del texto original | Corrección aplicada | Justificación |
|---|---|---|---|---|
| 1 | 2.1 | Solo definía la línea como soporte metálico de conductores de energía | Se añade la acepción de telecomunicaciones (onda TEM guiada) y se conserva la de potencia | El Tema 2 del temario trata líneas de radiofrecuencia; ambas acepciones son válidas pero no equivalentes |
| 2 | 2.1.1 | «Constante de línea» sin fórmula ni símbolos | Se definen $R$, $L$, $G$, $C$ por unidad de longitud y las ecuaciones del telegrafista | Faltaban las fórmulas y las unidades |
| 3 | 2.1.2 | Encabezado sin ecuación | Se añade $Z_0=\sqrt{Z'/Y'}$, los casos sin pérdidas y de bajas pérdidas y la relación con $\eta$ | Faltaba la fórmula central del tema |
| 4 | 2.1.3 | Encabezado sin ecuación | Se añade $\gamma=\sqrt{Z'Y'}$, $\alpha$, $\beta$, $v_p$, $\lambda$ y la conversión $\text{Np/m}$ a $\text{dB/m}$ | Faltaba la fórmula y la equivalencia de unidades |
| 5 | 2.2 | «Relación entre la potencia que entra en una antena y la potencia que sale» | Se separa la ganancia de la red de dos puertos y la ganancia de antena $G=4\pi U/P_{in}=e_{cd}D$ | La relación $P_{out}/P_{in}$ de una antena es su eficiencia de radiación, no su ganancia |
| 6 | 2.3 | Enumeración de aplicaciones sin definición | Se añade definición, $A_{dB}$, $\alpha_{dB}$, decaimiento exponencial, $L_{FS}$ y presupuesto de enlace | El ítem pedía el concepto y sus unidades |
| 7 | 2.4 | «Cualquier energía no deseada dentro de la banda de paso» | Se redefine como perturbación aleatoria interna o externa y se distingue de la interferencia | La definición original describía interferencia, no ruido |
| 8 | 2.5 | Redacción coloquial («interrumpen las imágenes de su televisor») | Se formaliza la definición, se clasifican los tipos y se añaden $SINR$ y $C/I$ | Se conserva el sentido y se añade rigor y métricas |
| 9 | 2.6 | «Frecuencias medias comunes» | Se nombran frecuencias centrales nominales, se añaden $f_u$, $f_c$, $\Delta f$, $n$ y los valores exactos ISO 266 | Faltaban las fórmulas y la distinción entre valor nominal y exacto |
| 10 | 2.7 | «Media octava… es 660 Hz… 7 semitonos por encima de La» | Se corrige a $\sqrt{2}$ (622.25 Hz, 6 semitonos) y se explica el origen del valor 660 Hz | El punto medio aritmético es una quinta justa ($3{:}2$), no una media octava |
| 11 | 2.8 | Equivalencia 10 dB con «10 veces más intenso» sin distinguir magnitudes | Se distinguen potencia, amplitud y sonoridad percibida; se añaden referencias y suma de niveles | La afirmación solo es válida para intensidad o potencia |
| 12 | Bibliografía | Entradas sin autor real, títulos genéricos y URL con redirección | Se corrigen autoría y títulos, se actualizan URL y se añaden las fuentes faltantes | Varias entradas no permitían localizar el documento citado |

## 5. Símbolos empleados

| Símbolo | Significado | Unidad SI |
|---|---|---|
| $R$, $L$, $G$, $C$ | Constantes primarias por unidad de longitud | $\Omega/\text{m}$, $\text{H/m}$, $\text{S/m}$, $\text{F/m}$ |
| $Z'$, $Y'$ | Impedancia serie y admitancia de derivación por unidad de longitud | $\Omega/\text{m}$, $\text{S/m}$ |
| $Z_0$, $\gamma$, $\alpha$, $\beta$ | Impedancia característica y constante de propagación | $\Omega$, $\text{m}^{-1}$, $\text{Np/m}$, $\text{rad/m}$ |
| $v_p$, $\lambda$, $\theta$ | Velocidad de fase, longitud de onda y longitud eléctrica | $\text{m/s}$, $\text{m}$, $\text{rad}$ |
| $\Gamma$, ROE | Coeficiente de reflexión y relación de onda estacionaria | adimensional |
| $U$, $D$, $G$, $e_{cd}$, $A_{eff}$ | Intensidad de radiación, directividad, ganancia, eficiencia y área efectiva | $\text{W/sr}$, adimensional, adimensional, adimensional, $\text{m}^2$ |
| $k$, $q$, $T$, $B$ | Constante de Boltzmann, carga del electrón, temperatura y ancho de banda | $\text{J/K}$, $\text{C}$, $\text{K}$, $\text{Hz}$ |
| $F$, $T_e$, $SNR$, $SINR$ | Factor de ruido, temperatura equivalente y relaciones de potencia | adimensional, $\text{K}$, $\text{dB}$ |
| $f_l$, $f_u$, $f_c$ | Frecuencia inferior, superior y central de banda | $\text{Hz}$ |

## 6. Bibliografía

Orden alfabético por autor o, en su defecto, por título (APA 7). Las entradas marcadas con «†» son fuentes nuevas incorporadas en esta revisión.

1. † Characteristic impedance. (2026, 23 de octubre). En *Wikipedia*. https://en.wikipedia.org/wiki/Characteristic_impedance
2. † Decibelio. (2026, 23 de octubre). En *Wikipedia*. https://es.wikipedia.org/wiki/Decibelio
3. † Electromagnetic interference. (2026, 23 de octubre). En *Wikipedia*. https://en.wikipedia.org/wiki/Electromagnetic_interference
4. Federal Communications Commission. (s.f.). *Interferencia de señales de radio, TV y telefónicas* [Guía del consumidor]. https://www.fcc.gov/consumers/guides/interferencia-de-senales-de-radio-tv-y-telefonicas
5. Ferrovial. (2024, 10 de septiembre). *Línea de transmisión: qué es, características y tipos*. https://www.ferrovial.com/es/stem/linea-de-transmision/
6. Healthy Hearing. (2024, 6 de noviembre). *What is a decibel?* https://www.healthyhearing.com/report/52514-What-is-a-decibel
7. † International Organization for Standardization. (1997). *ISO 266:1997. Acoustics — Preferred frequencies*. ISO. https://www.iso.org/standard/1350.html
8. † International Telecommunication Union. (2026). *Recommendation ITU-R P.372-18: Radio noise*. UIT. https://www.itu.int/rec/R-REC-P.372/en
9. † Johnson–Nyquist noise. (2026, 23 de octubre). En *Wikipedia*. https://en.wikipedia.org/wiki/Johnson%E2%80%93Nyquist_noise
10. Kowarski, E. (2023, 26 de febrero). *Half an octave* [Entrada de blog]. Music Theory De-mystified. https://musictheoryde-mystified.com/tag/frequency-ratio-of-half-an-octave/
11. Lozano, F. G. (s.f.). *Ruidos en los sistemas de comunicaciones* [Apuntes de la cátedra Sistemas de Comunicaciones II]. Instituto Luis Manuel Robles. https://colegiorobles.edu.ar/site/f/a6de2eda5c79fbc7aac8565e827e8ba0.pdf
12. † Octave band. (2026, 23 de octubre). En *Wikipedia*. https://en.wikipedia.org/wiki/Octave_band
13. Pollán Santamaría, T. (s.f.). *El ruido en los sistemas digitales* (Tema T3) [Apuntes de Tecnología Electrónica]. Universidad de Zaragoza. https://diec.unizar.es/~tpollan/libro/Apuntes/digT3.pdf
14. † Pozar, D. M. (2012). *Microwave engineering* (4th ed.). Wiley. ISBN 978-0-470-63155-3. https://www.wiley.com/en-us/Microwave+Engineering%2C+4th+Edition-p-9780470631553
15. Rosencrance, L. (2025, 8 de julio). *What is attenuation?* TechTarget. https://www.techtarget.com/it-infrastructure/definition/What-is-attenuation
16. ScienceDirect. (s.f.). *Octave band*. https://www.sciencedirect.com/topics/engineering/octave-band
17. T&D Electric. (2022, 19 de diciembre). *3 tipos de líneas de transmisión en función de su longitud*. https://tydelectric.com/tipos-lineas-transmision-segun-longitud/
18. Telecomunicaciones TICS. (s.f.). *3.3. Ganancia y polarización*. https://telecomunicaciones2.webnode.mx/unidad-3/a3-3-ganancia-y-polarizacion-/

## 7. Verificación de las fuentes

Comprobación realizada el 23 de octubre de 2026 mediante solicitud HTTP con agente de usuario de navegador, seguimiento de redirecciones y lectura del contenido cuando fue posible.

| # | Recurso | Comprobación | Estado |
|---|---|---|---|
| 1 | Characteristic impedance | HTTP 200 | Verificada |
| 2 | Decibelio | HTTP 200 | Verificada |
| 3 | Electromagnetic interference | HTTP 200 | Verificada |
| 4 | FCC, interferencia (es) | HTTP 403 en todo el dominio, incluida la portada | No verificable: bloqueo automatizado del sitio; cita conservada con reserva |
| 5 | Ferrovial | HTTP 200 | Verificada |
| 6 | Healthy Hearing | DNS resuelve ($198.101.128.6$); puerto 443 sin respuesta | No verificable: servidor inaccesible desde el entorno; sustituida como respaldo por [2] |
| 7 | ISO 266:1997 | Título de página confirmado: «ISO 266:1997 - Acoustics — Preferred frequencies» (403 si se omite la cabecera de idioma) | Verificada |
| 8 | UIT-R P.372 | HTTP 200; versión vigente P.372-18 (09/2026) | Verificada |
| 9 | Johnson–Nyquist noise | HTTP 200 | Verificada |
| 10 | Kowarski, *Half an octave* | HTTP 200; contenido leído: define la media octava como punto medio aritmético (660 Hz) | Verificada, con salvedad conceptual (§2.7) |
| 11 | Lozano, *Ruidos en los sistemas de comunicaciones* | HTTP 200; PDF de 6 páginas; autoría y título confirmados en la portada | Verificada; se corrigió la entrada, antes atribuida a «Colegio Robles» sin autor ni título |
| 12 | Octave band | HTTP 200 | Verificada |
| 13 | Pollán, *El ruido en los sistemas digitales* | HTTP 200; PDF de 9 páginas; autoría y título T3 confirmados | Verificada; se corrigió el título, antes citado como «Apuntes de transmisión digital» |
| 14 | Pozar, *Microwave engineering*, 4.ª ed. | HTTP 200 en la ficha del editor; ISBN de la URL coincide con 978-0-470-63155-3 | Verificada |
| 15 | Rosencrance, *What is attenuation?* | HTTP 200 tras redirección a `/it-infrastructure/definition/What-is-attenuation` | Verificada; URL actualizada a la canónica |
| 16 | ScienceDirect, *Octave band* | HTTP 403 por protección anti-bot | No verificable automáticamente; tema de dominio público, respaldado por [7] y [12] |
| 17 | T&D Electric | HTTP 200; contenido de las tres clases leído y contrastado con la §3 | Verificada |
| 18 | Telecomunicaciones TICS | HTTP 200; contenido leído | Verificada, pero su definición de ganancia es imprecisa y se corrigió en §2.2 |

**Resumen:** 10 fuentes originales conservadas (4, 5, 6, 10, 11, 13, 15, 16, 17, 18), de las cuales 6 se verificaron con contenido, 2 solo por disponibilidad del dominio (4, 16) y 1 resultó inaccesible (6). Se corrigieron 4 entradas (11, 13, 15, 18) y se añadieron 8 fuentes (1, 2, 3, 7, 8, 9, 12, 14) para cubrir impedancia característica, decibel, interferencia electromagnética, bandas normalizadas, ruido radioeléctrico, ruido térmico y líneas de transmisión.
