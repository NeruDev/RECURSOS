---
id: 18_practica_1_cuestionario
name: practica_1_cuestionario
title: "Práctica 1 Cuestionario: Banco Teórico-Práctico de Ondas Electromagnéticas"
file_path: src/Electromagnetismo/PRACTICA_1_CUESTIONARIO.md
version: 1.0.0
category: guides
domain: Electromagnetismo
tags: [electromagnetismo, cuestionario, banco-preguntas, maxwell, propagacion, radiacion, friis, fresnel, antenas, uhf, ask]
description: "Banco exhaustivo de preguntas y respuestas analíticas sobre teoría electromagnética, propagación en la atmósfera, parámetros de radiación y firmware para la Práctica 1."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-03T22:00:00Z
updated_at: 2026-09-03T22:00:00Z
dependencies: [00_agents_contract, 12_temario_electromagnetismo, 17_practica_1_resumen]
schema_version: 1.0.0
---
# INGENIERÍA ELECTRÓNICA — TEORÍA ELECTROMAGNÉTICA

## PRÁCTICA 1: PROPAGACIÓN DE ONDAS ELECTROMAGNÉTICAS EN LA ATMÓSFERA

### CUESTIONARIO Y BANCO INTEGRAL DE PREGUNTAS TEÓRICO-PRÁCTICAS

---

## Presentación y Contexto

El presente documento constituye el **banco integral y especializado de evaluación teórica, conceptual y analítica** correspondiente a la **Práctica 1: Propagación de Ondas Electromagnéticas en la Atmósfera**.

Integra las preguntas de preparación del laboratorio junto con un compendio exhaustivo de preguntas teóricas avanzadas derivadas del programa curricular de la materia ([`temario.md`](file:///G:/REPOSITORIOS%20GITHUB/RECURSOS/src/Electromagnetismo/temario.md)), cubriendo desde las Ecuaciones de Maxwell, radiación de dipolos y monopolos, condiciones de frontera, impedancias y coeficientes de reflexión, hasta modelos de propagación atmosférica (Friis, Zonas de Fresnel, modelo de dos rayos), ruido térmico de Johnson-Nyquist y modulación digital en banda ISM.

Todos los valores numéricos, constantes universales y ecuaciones analíticas se expresan con su **resolución matemática exacta y más de 12 cifras significativas**.

---

## Bloque 1: Fundamentos de Teoría Electromagnética y Ecuaciones de Maxwell

### Pregunta 1.1

**¿Qué ecuación de Maxwell predice la existencia de ondas electromagnéticas al demostrar que un campo eléctrico variable genera un campo magnético?**

* **Respuesta:**
  La **Ley de Ampère-Maxwell**, expresada en su forma diferencial en el dominio temporal como:

  $$
  \nabla \times \vec{H} = \vec{J} + \frac{\partial \vec{D}}{\partial t} = \vec{J} + \varepsilon \frac{\partial \vec{E}}{\partial t}

  $$

  James Clerk Maxwell descubrió que la Ley de Ampère clásica para campos estacionarios ($\nabla \times \vec{H} = \vec{J}$) violaba el principio de conservación de la carga al aplicar la divergencia ($\nabla \cdot (\nabla \times \vec{H}) \equiv 0$, mientras que $\nabla \cdot \vec{J} = -\frac{\partial \rho_v}{\partial t} \ne 0$).
  Para restablecer la continuidad, introdujo el término de la **densidad de corriente de desplazamiento**:
  $$
  \vec{J}_d = \frac{\partial \vec{D}}{\partial t} = \varepsilon \frac{\partial \vec{E}}{\partial t}

  $$

  Este término establece que un campo eléctrico variable en el tiempo engendra un campo magnético rotacional, incluso en el vacío más absoluto donde no existen cargas libres ($\vec{J} = 0$). Al combinarse con la Ley de Faraday ($\nabla \times \vec{E} = -\frac{\partial \vec{B}}{\partial t}$), ambos campos se retroalimentan y se propagan de forma auto-sostenida a través del espacio en forma de onda electromagnética.

---

### Pregunta 1.2

**¿Cuál es la relación de fase y orientación espacial entre el campo eléctrico y el campo magnético en una onda radiada en campo lejano?**

* **Respuesta:**
  En el campo lejano de una fuente de radiación en un medio dieléctrico homogéneo e isótropo no dispersivo (como el aire o vacío), la onda se comporta localmente como una **onda plana transversal electromagnética (TEM)**:
  1. **Ortogonalidad espacial:** El vector de campo eléctrico $\vec{E}$ y el vector de campo magnético $\vec{H}$ son mutuamente perpendiculares entre sí en todo instante y punto del espacio ($\vec{E} \cdot \vec{H} = 0$, es decir, $\vec{E} \perp \vec{H}$).
  2. **Dirección de propagación:** Ambos vectores se encuentran en un plano transversal ortogonal a la dirección de propagación descrita por el vector de onda unitario $\hat{a}_k$, de modo que el producto vectorial define la dirección del flujo de energía:
     $$
     \vec{E} \times \vec{H} \parallel \hat{a}_k

     $$
  3. **Fase temporal:** En medios sin pérdidas ($\sigma = 0$), las componentes espaciales de $\vec{E}$ y $\vec{H}$ se encuentran **estrictamente en fase temporal**; es decir, alcanzan sus valores máximos, mínimos y cruces por cero en los mismos instantes temporales.

---

### Pregunta 1.3

**¿Cuál es el valor teórico exacto de la impedancia intrínseca del medio en el vacío/aire y qué significado físico posee?**

* **Respuesta:**
  La **impedancia intrínseca** ($\eta_0$) representa la razón dimensional entre la intensidad de campo eléctrico y la intensidad de campo magnético de una onda electromagnética TEM:

  $$
  \eta_0 = \frac{|\vec{E}|}{|\vec{H}|} = \sqrt{\frac{\mu_0}{\varepsilon_0}} = \mu_0 c

  $$

  Evaluando con las constantes fundamentales del Sistema Internacional de Unidades (SI):

  * Velocidad de la luz exacta: $c = 299\,792\,458.000000000000\text{ m/s}$
  * Permeabilidad magnética exacta: $\mu_0 = 4\pi \times 10^{-7}\text{ H/m} \approx 1.256637061435917295\times 10^{-6}\text{ H/m}$
  * Permitividad eléctrica exacta: $\varepsilon_0 = \frac{1}{\mu_0 c^2} \approx 8.854187817620389851\times 10^{-12}\text{ F/m}$

  Sustituyendo rigurosamente se obtiene:

  $$
  \eta_0 = (4\pi \times 10^{-7}\text{ H/m}) \times (299\,792\,458\text{ m/s}) = \mathbf{376.730313461770655\,\Omega}

  $$

  *(En la bibliografía clásica suele emplearse la aproximación histórica $120\pi\,\Omega \approx 376.991118430775189\,\Omega$, existiendo una discrepancia de aproximadamente $0.2608\,\Omega$ atribuible al valor exacto asignado a $c$ en la 17ª Conferencia General de Pesas y Medidas).*

  **Significado físico:** Representa la oposición intrínseca que ofrece la estructura del espacio libre a la penetración y establecimiento de líneas de flujo eléctrico y magnético por unidad de área. Determina que por cada $1\text{ V/m}$ de campo eléctrico oscilante en el aire, existe una componente magnética transversal asociada de:

  $$
  |\vec{H}| = \frac{1\text{ V/m}}{376.730313461771\,\Omega} \approx 2.654418731518\times 10^{-3}\text{ A/m} = 2.6544\text{ mA/m}

  $$

---

### Pregunta 1.4

**Si una onda electromagnética de radiofrecuencia a 433.92 MHz se propaga en el aire, ¿cuáles son sus valores exactos de longitud de onda, frecuencia angular, periodo y constante de fase?**

* **Respuesta:**
  A partir de la frecuencia nominal del oscilador SAW ($f = 433\,920\,000.000000000000\text{ Hz}$):

  1. **Longitud de onda ($\lambda = c/f$):**

     * Con la velocidad de la luz fundamental del SI ($c = 299\,792\,458\text{ m/s}$):
       $$
       \lambda = \frac{299\,792\,458\text{ m/s}}{433\,920\,000\text{ Hz}} = \mathbf{0.690893385877581121\text{ m}} = \mathbf{69.0893385877581121\text{ cm}}

       $$
     * Con la aproximación didáctica elemental ($c = 3.000000000000 \times 10^8\text{ m/s}$):
       $$
       \lambda_{\text{aprox}} = \frac{300\,000\,000\text{ m/s}}{433\,920\,000\text{ Hz}} \approx \mathbf{0.691371681415929204\text{ m}} = \mathbf{69.1371681415929204\text{ cm}}

       $$
  2. **Frecuencia angular ($\omega = 2\pi f$):**

     $$
     \omega = 2\pi \times (4.339200000000 \times 10^8\text{ Hz}) = \mathbf{2\,726\,399\,768.491366164067\text{ rad/s}}

     $$
  3. **Periodo temporal ($T = 1/f$):**

     $$
     T = \frac{1}{433\,920\,000\text{ Hz}} = \mathbf{2.304572271386430678\times 10^{-9}\text{ s}} = \mathbf{2.304572271386\text{ ns}}

     $$
  4. **Constante de fase o número de onda angular ($\beta = k = \frac{\omega}{c} = \frac{2\pi}{\lambda}$):**

     $$
     \beta = \frac{2\pi \times 433\,920\,000}{299\,792\,458} = \mathbf{9.094290719252737719\text{ rad/m}}

     $$

---

### Pregunta 1.5

**¿Por qué la atenuación de Friis en el espacio libre aumenta con la frecuencia si la velocidad de la luz en el medio permanece constante?**

* **Respuesta:**
  La aparente paradoja de que la pérdida de trayectoria en el espacio libre (*Free Space Path Loss*, FSPL) aumente proporcionalmente a $f^2$ reside en la definición de la **apertura o área efectiva de captación ($A_e$)** de una antena isotrópica receptora.
  La densidad de flujo de potencia incidente a una distancia $d$ desde una antena transmisora isotrópica es puramente geométrica y totalmente independiente de la frecuencia:

  $$
  S = \frac{P_t}{4\pi d^2} \quad \left[\frac{\text{W}}{\text{m}^2}\right]

  $$

  Sin embargo, la potencia que el receptor es capaz de extraer del frente de onda depende de su área efectiva de apertura:
  $$
  P_r = S \cdot A_e

  $$

  Para una antena isotrópica ideal de ganancia unitaria ($G = 1$), la teoría electromagnética de radiación establece que el área efectiva es proporcional al cuadrado de la longitud de onda:
  $$
  A_e = \frac{\lambda^2}{4\pi} = \frac{c^2}{4\pi f^2}

  $$

  A la frecuencia de $433.92\text{ MHz}$, la apertura efectiva isotrópica exacta es:
  $$
  A_e = \frac{(0.690893385877581\text{ m})^2}{4\pi} = \mathbf{0.037985006594024446\text{ m}^2} = \mathbf{379.85006594024446\text{ cm}^2}

  $$

  A medida que la frecuencia $f$ se incrementa, la longitud de onda $\lambda$ se acorta, reduciendo drásticamente la "red geométrica virtual" con la que la antena extrae energía de los fotones incidentes, originando el término cuadrático de pérdida en la fórmula de Friis:
  $$
  P_r = P_t \cdot \left(\frac{\lambda}{4\pi d}\right)^2 = P_t \cdot \left(\frac{c}{4\pi f d}\right)^2

  $$

---

### Pregunta 1.6 (Nueva - Teórica Avanzada)

**¿Cuáles son las formas diferenciales e integrales de las cuatro Ecuaciones de Maxwell y qué condiciones de frontera imponen en la superficie de un conductor perfecto?**

* **Respuesta:**
  La tabla fundamental de las Ecuaciones de Maxwell en un medio material continuo y lineal es:


  | Ley Física                 | Forma Diferencial (Local)                                               | Forma Integral (Global)                                                                                                 |
  | :---------------------------- | :------------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------ |
  | **Ley de Gauss Eléctrica** | $\nabla \cdot \vec{D} = \rho_v$                                         | $\oint_S \vec{D} \cdot d\vec{S} = Q_{enc}$                                                                              |
  | **Ley de Gauss Magnética** | $\nabla \cdot \vec{B} = 0$                                              | $\oint_S \vec{B} \cdot d\vec{S} = 0$                                                                                    |
  | **Ley de Faraday**          | $\nabla \times \vec{E} = -\frac{\partial \vec{B}}{\partial t}$          | $\oint_C \vec{E} \cdot d\vec{\ell} = -\frac{d}{dt}\iint_S \vec{B} \cdot d\vec{S}$                                       |
  | **Ley de Ampère-Maxwell**  | $\nabla \times \vec{H} = \vec{J} + \frac{\partial \vec{D}}{\partial t}$ | $\oint_C \vec{H} \cdot d\vec{\ell} = \iint_S \left(\vec{J} + \frac{\partial \vec{D}}{\partial t}\right) \cdot d\vec{S}$ |

  **Condiciones de Frontera en la interfaz con un Conductor Eléctrico Perfecto (PEC):**
  Al interior de un conductor eléctrico perfecto ($\sigma \to \infty$), las cargas se reordenan instantáneamente para cancelar cualquier campo electrodinámico interior ($\vec{E}_{int} = 0$, $\vec{H}_{int} = 0$). En la superficie limítrofe entre el aire y el metal:


  1. **Componente tangencial del campo eléctrico:** Debe ser nula en la superficie:
     $$
     \hat{n} \times \vec{E} = 0 \implies E_t = 0

     $$

     *(El campo eléctrico neto exterior debe ser rigurosamente perpendicular a la superficie metálica).*
  2. **Componente normal de la inducción eléctrica:** Es sostenida por la densidad superficial de carga libre $\rho_s$:
     $$
     \hat{n} \cdot \vec{D} = \rho_s \implies D_n = \varepsilon_0 E_n = \rho_s

     $$
  3. **Componente tangencial del campo magnético:** Es sostenida por una corriente superficial real $\vec{J}_s$:
     $$
     \hat{n} \times \vec{H} = \vec{J}_s \implies H_t = |\vec{J}_s|

     $$
  4. **Componente normal del campo magnético:** Debe anularse en la frontera:
     $$
     \hat{n} \cdot \vec{B} = 0 \implies B_n = 0

     $$

  *Estas condiciones gobiernan la reflexión de ondas en el plano de tierra del microcontrolador y la formación de corrientes en las antenas de RF.*

---

### Pregunta 1.7 (Nueva - Teórica Avanzada)

**¿Cómo se deduce la Ecuación Fasorial de Helmholtz a partir de las ecuaciones de Maxwell y qué papel juega la tangente de pérdidas ($\tan \delta$) en la propagación?**

* **Respuesta:**
  1. **Deducción de Helmholtz:**
     Asumiendo una variación temporal armónica pura del tipo $e^{j\omega t}$, las derivadas temporales se sustituyen por el operador algebraico $\frac{\partial}{\partial t} \to j\omega$. Las leyes de Faraday y Ampère toman forma fasorial:

     $$
     \nabla \times \vec{E}_s = -j\omega\mu \vec{H}_s

     $$

     $$
     \nabla \times \vec{H}_s = (\sigma + j\omega\varepsilon)\vec{E}_s

     $$

     Aplicando la identidad vectorial del rotacional del rotacional:

     $$
     \nabla \times (\nabla \times \vec{E}_s) = \nabla(\nabla \cdot \vec{E}_s) - \nabla^2 \vec{E}_s

     $$

     En una región sin cargas volumétricas libres ($\nabla \cdot \vec{E}_s = 0$):

     $$
     -\nabla^2 \vec{E}_s = \nabla \times (-j\omega\mu \vec{H}_s) = -j\omega\mu(\sigma + j\omega\varepsilon)\vec{E}_s

     $$

     Reorganizando:

     $$
     \nabla^2 \vec{E}_s - \gamma^2 \vec{E}_s = 0

     $$

     donde $\gamma = \alpha + j\beta$ es la **constante de propagación compleja**:

     $$
     \gamma = \sqrt{j\omega\mu(\sigma + j\omega\varepsilon)} = j\omega\sqrt{\mu\varepsilon}\sqrt{1 - j\frac{\sigma}{\omega\varepsilon}}

     $$

     * En el aire o vacío ($\sigma = 0$), el factor de atenuación es nulo ($\alpha = 0$) y la constante de fase es $\beta = \omega\sqrt{\mu_0\varepsilon_0} = \omega/c = k$. La expresión se simplifica a la ecuación homogénea de Helmholtz:
       $$
       \nabla^2 \vec{E}_s + k^2 \vec{E}_s = 0

       $$
  2. **Tangente de Pérdidas ($\tan \delta$):**
     Representa la relación entre la corriente de conducción real disipativa (Ley de Ohm) y la corriente de desplazamiento reactiva en el medio dieléctrico:

     $$
     \tan \delta = \frac{|\vec{J}_c|}{|\vec{J}_d|} = \frac{\sigma |\vec{E}|}{\omega \varepsilon |\vec{E}|} = \frac{\sigma}{\omega \varepsilon}

     $$

     * **Buen dieléctrico / Aislante:** $\tan \delta \ll 1$ ($\sigma \ll \omega\varepsilon$).
     * **Buen conductor:** $\tan \delta \gg 1$ ($\sigma \gg \omega\varepsilon$).
       Para el aire seco en el laboratorio a $433.92\text{ MHz}$ ($\sigma \approx 10^{-14}\text{ S/m}$, $\varepsilon \approx \varepsilon_0$):

     $$
     \tan \delta = \frac{10^{-14}}{(2.7264\times 10^9) \times (8.8542\times 10^{-12})} \approx 4.14\times 10^{-13} \ll 1

     $$

     Esto confirma teóricamente que el aire atmosférico en interiores actúa como un dieléctrico prácticamente perfecto sin absorción de conductividad.

---

### Pregunta 1.8 (Nueva - Teórica Avanzada)

**¿Qué distingue formalmente al Vector de Poynting instantáneo del Vector de Poynting complejo fasorial y qué representa la parte imaginaria de este último?**

* **Respuesta:**
  1. **Vector de Poynting Instantáneo:**
     $$
     \vec{S}(t) = \vec{E}(t) \times \vec{H}(t) \quad \left[\frac{\text{W}}{\text{m}^2}\right]

     $$

     Representa la densidad de flujo de energía electromagnética instantánea que atraviesa una superficie unitaria orientada perpendicularmente al frente de onda en un segundo determinado.
  2. **Vector de Poynting Complejo Fasorial:**
     En el dominio de la frecuencia con fasores espaciales $\vec{E}_s$ y $\vec{H}_s$:
     $$
     \vec{S}_c = \frac{1}{2} (\vec{E}_s \times \vec{H}_s^*) \quad \left[\frac{\text{VA}}{\text{m}^2}\right]

     $$

     donde $\vec{H}_s^*$ es el conjugado complejo del fasor de campo magnético.
  3. **Interpretación de sus partes componentes:**
     $$
     \vec{S}_c = \vec{S}_{real} + j\vec{S}_{imag} = \frac{1}{2}\text{Re}\{\vec{E}_s \times \vec{H}_s^*\} + j\frac{1}{2}\text{Im}\{\vec{E}_s \times \vec{H}_s^*\}

     $$

     * **Parte Real ($\vec{S}_{real} = \langle \vec{S}(t) \rangle$):** Es el promedio temporal neto de densidad de potencia real o activa transportada irrevocablemente hacia el espacio exterior (potencia radiada neta).
     * **Parte Imaginaria ($\vec{S}_{imag}$):** Representa la densidad de potencia **reactiva** o energía electromagnética almacenada oscilante que no se propaga al infinito, sino que fluye de ida y vuelta entre la antena y el espacio circundante en cada medio ciclo de portadora. Es predominante en el **campo cercano reactivo** de la antena ($r < \lambda/2\pi \approx 11\text{ cm}$).

---

### Pregunta 1.9 (Nueva - Teórica Avanzada)

**¿Qué es la profundidad pelicular (*skin depth*) y cuál es su valor exacto para el cobre a 433.92 MHz? ¿Cómo influye en el plano de tierra y pistas de RF del transmisor?**

* **Respuesta:**
  La **profundidad pelicular o efecto pelicular** ($\delta_s$) es la distancia radial desde la superficie de un buen conductor ($\sigma \gg \omega\varepsilon$) en la cual la densidad de corriente de alta frecuencia decae exponencialmente a un factor $1/e$ ($\approx 36.79\%$) de su valor superficial:

  $$
  \delta_s = \sqrt{\frac{2}{\omega \mu \sigma}} = \frac{1}{\sqrt{\pi f \mu \sigma}}

  $$

  Para el cobre recocido electrolítico estándar en circuitos impresos ($\sigma = 5.800000000000 \times 10^7\text{ S/m}$, $\mu \approx \mu_0 = 4\pi \times 10^{-7}\text{ H/m}$) y $f = 433\,920\,000.000000000000\text{ Hz}$:

  $$
  \omega = 2\pi \times 433\,920\,000 = 2\,726\,399\,768.491366\text{ rad/s}

  $$

  $$
  \delta_s = \sqrt{\frac{2}{(2\,726\,399\,768.491366) \times (1.256637061436\times 10^{-6}) \times (5.800000\times 10^7)}}

  $$

  $$
  \delta_s = \mathbf{0.000003172497590596\text{ m}} = \mathbf{3.172497590596\,\mu\text{m}}

  $$

  **Implicaciones de Ingeniería en el PCB:**

  * El espesor típico del laminado de cobre en placas de circuito impreso (FR-4 estándar de 1 onza, *1 oz copper*) es de aproximadamente $35\,\mu\text{m}$.
  * Como el espesor de la pista ($35\,\mu\text{m}$) es más de **11 veces superior a la profundidad pelicular** ($\frac{35\,\mu\text{m}}{3.1725\,\mu\text{m}} \approx 11.0323$), la corriente de radiofrecuencia a 433.92 MHz no se distribuye uniformemente en el núcleo de las pistas de cobre, sino que viaja estrictamente confinada en una delgada película perimetral exterior de $3.17\,\mu\text{m}$.
  * Esto incrementa drásticamente la **resistencia efectiva de CA por unidad de longitud** ($R_{AC} \gg R_{DC}$) del circuito y del plano de tierra, disipando potencia por efecto Joule antes de que la señal logre alcanzar el pin radiante.

---

## Bloque 2: Antenas, Radiación, Adaptación y Líneas de Transmisión

### Pregunta 2.1

**¿Cuál es la longitud física ideal de un monopolo resonante de un cuarto de onda para este enlace a 433.92 MHz?**

* **Respuesta:**
  Un monopolo vertical de cuarto de onda requiere una longitud teórica igual a una cuarta parte de la longitud de onda de resonancia:

  $$
  L_{\lambda/4} = \frac{\lambda}{4} = \frac{c}{4f}

  $$

  Evaluando:

  * **Con la velocidad de la luz fundamental del SI ($c = 299\,792\,458\text{ m/s}$):**
    $$
    L_{\lambda/4} = \frac{0.690893385877581121\text{ m}}{4} = \mathbf{0.172723346469395280\text{ m}} = \mathbf{17.272334646940\text{ cm}}

    $$
  * **Con la aproximación didáctica convencional ($c = 3.0 \times 10^8\text{ m/s}$):**
    $$
    L_{\lambda/4,\text{ aprox}} = \frac{0.691371681415929204\text{ m}}{4} = \mathbf{0.172842920353982301\text{ m}} = \mathbf{17.284292035398\text{ cm}}

    $$

  *(Nota práctica: En el corte real de alambre de cobre para laboratorio, suele aplicarse un factor de acortamiento por efecto de borde o capacitancia terminal de extremo de aproximadamente $0.95$, recomendándose un corte físico de $L_{\text{real}} \approx 16.4\text{ cm}$).*

---

### Pregunta 2.2

**¿Qué ocurre físicamente cuando el transmisor FS1000A opera sin antena conectada al pin `ANT`?**

* **Respuesta:**
  Ocurre un colapso en el acoplamiento electromagnético manifestado en cuatro fenómenos:
  1. **Terminal en Circuito Abierto:** Al no conectar ningún conductor en el pin `ANT`, la impedancia de carga vista por el paso final del transistor oscilador tiende a circuito abierto ($Z_L \to \infty$).
  2. **Reflexión Total de Potencia:** El coeficiente de reflexión de voltaje alcanza su límite unitario ($\Gamma = \frac{Z_L - Z_0}{Z_L + Z_0} \to +1$), provocando una Relación de Onda Estacionaria teórica infinita ($VSWR \to \infty$).
  3. **Resistencia de Radiación Infinitesimal:** El único elemento capaz de radiar es la pista microscópica de circuito impreso de $1\text{ a }2\text{ cm}$ ($L \ll \lambda$). Para un elemento eléctricamente corto ($L = 1\text{ cm} = 0.01\text{ m}$), la resistencia de radiación es:
     $$
     R_{rad} = 20\pi^2 \left(\frac{L}{\lambda}\right)^2 = 20\pi^2 \left(\frac{0.01}{0.690893386}\right)^2 = \mathbf{0.041353061843\,\Omega}

     $$
  4. **Disipación Térmica:** Más del $99.9\%$ de la energía suministrada se refleja hacia el circuito, disipándose internamente por calentamiento en el transistor y resistores parásitos. La potencia radiada efectiva cae a fracciones mínimas de microwatt, confinando el enlace a escasos metros de alcance.

---

### Pregunta 2.3

**¿Cómo influye la polarización de las antenas en el enlace y cuál es la expresión matemática de la pérdida por desacoplamiento polarimétrico?**

* **Respuesta:**
  La **polarización** de una antena describe la orientación temporal del vector de campo eléctrico $\vec{E}$ en el espacio radiado. En monopolos y dipolos lineales, la polarización es lineal y paralela al eje longitudinal del conductor físico.
  La eficiencia de recepción polarimétrica se cuantifica mediante el **Factor de Pérdida por Desalineación de Polarización (*Polarization Loss Factor*, PLF)**:
  $$
  PLF = |\hat{\rho}_t \cdot \hat{\rho}_r|^2 = \cos^2(\theta)

  $$

  donde $\theta$ es el ángulo espacial relativo entre los ejes de ambas antenas:* Para alineación colineal perfecta ($\theta = 0^\circ$): $PLF = \cos^2(0^\circ) = 1$ ($0\text{ dB}$ de atenuación).
  * Para orientación cruzada a $90^\circ$ ($\theta = 90^\circ$): $PLF = \cos^2(90^\circ) = 0$ ($-\infty\text{ dB}$ teóricos).
    En un laboratorio cerrado, debido a que las reflexiones en muros de mampostería, mesas metálicas y suelo despolarizan el frente de onda (generando componentes elípticas), la atenuación real medida a $\theta = 90^\circ$ no es infinita, sino que oscila típicamente entre **$20\text{ y }35\text{ dB}$**.

---

### Pregunta 2.4 (Nueva - Teórica Avanzada)

**¿Cuáles son las tres regiones de campo electromagnético que rodean a una antena radiante y cómo se calculan sus fronteras espaciales?**

* **Respuesta:**
  El espacio circundante a cualquier estructura radiante de dimensión lineal máxima $D$ a una longitud de onda $\lambda$ se divide en tres zonas fundamentales:

  ```mermaid
  flowchart LR
      subgraph Regiones ["Estructura Espacial de Radiación"]
          A["Antena (Dimensión D)"] --> B["1. Campo Cercano Reactivo<br/>(R < 0.62 √(D³/λ))"]
          B --> C["2. Campo Cercano Radiante (Fresnel)<br/>(0.62 √(D³/λ) ≤ R < 2D²/λ)"]
          C --> D["3. Campo Lejano (Fraunhofer)<br/>(R ≥ 2D²/λ)"]
      end
  ```

  1. **Región de Campo Cercano Reactivo (*Reactive Near-Field*):**
     * **Límite exterior:** $R_1 = 0.62 \sqrt{\frac{D^3}{\lambda}}$ (o comúnmente $R < \frac{\lambda}{2\pi} \approx 0.159\lambda$).
     * **Física:** Predomina la energía reactiva inductiva y capacitiva almacenada ($\vec{S}_{imag} \gg \vec{S}_{real}$). El campo decae con potencias elevadas de la distancia ($1/R^3$, $1/R^2$). Los campos $\vec{E}$ y $\vec{H}$ están desfasados $90^\circ$. Para $\lambda \approx 0.6909\text{ m}$, esta región abarca hasta:
       $$
       R_{\text{reactivo}} = \frac{0.690893386\text{ m}}{2\pi} = \mathbf{0.109959635670\text{ m}} \approx \mathbf{11.0\text{ cm}}

       $$
  2. **Región de Campo Cercano Radiante o de Fresnel (*Radiating Near-Field*):**
     * **Intervalo:** $0.62 \sqrt{\frac{D^3}{\lambda}} \le R < \frac{2D^2}{\lambda}$.
     * **Física:** Predomina la radiación real ($\vec{S}_{real}$), pero el patrón de radiación angular aún depende de la distancia física $R$ porque las contribuciones de fase de los diferentes puntos de la antena no han convergido a rayos paralelos.
  3. **Región de Campo Lejano o de Fraunhofer (*Far-Field*):**
     * **Criterio de frontera:** $R \ge R_{ff} = \frac{2D^2}{\lambda}$.
     * **Condición de error de fase:** Garantiza que la diferencia de camino óptico desde los extremos de la antena hacia el receptor no exceda $\lambda/16$ ($22.5^\circ$ de error de fase).
     * **Física:** El patrón de radiación angular es totalmente invariante con la distancia $R$. Los campos decaen estrictamente a razón de $1/R$ y la densidad de potencia decae como $1/R^2$. La onda es localmente plana (TEM).
     * Para un dipolo de media onda ($D = \lambda/2 = 0.3454\text{ m}$):
       $$
       R_{ff} = \frac{2 (\lambda/2)^2}{\lambda} = \frac{\lambda}{2} = \mathbf{0.345446692939\text{ m}} \approx \mathbf{34.54\text{ cm}}

       $$
     * *Conclusión experimental:* Cualquier medición con flexómetro a distancias menores a $35\text{ cm}$ se encuentra dentro de las zonas de Fresnel y campo reactivo, donde las fórmulas de Friis carecen de validez analítica.

---

### Pregunta 2.5 (Nueva - Teórica Avanzada)

**¿Cuál es la diferencia entre resistencia de radiación y resistencia de pérdidas, y cómo determinan la eficiencia de radiación de una antena?**

* **Respuesta:**
  La impedancia de entrada en los terminales de una antena se compone de una parte resistiva real y una reactiva:

  $$
  Z_{in} = R_{in} + jX_{in}

  $$

  La resistencia total de entrada $R_{in}$ se descompone en dos términos físicos ortogonales:

  $$
  R_{in} = R_{rad} + R_{loss}

  $$

  * **Resistencia de Radiación ($R_{rad}$):** Resistencia equivalente ficticia que disiparía la misma cantidad de potencia que la antena radia efectivamente hacia el espacio exterior en forma de ondas electromagnéticas:
    $$
    P_{rad} = \frac{1}{2} |I_0|^2 R_{rad}

    $$
  * **Resistencia de Pérdidas ($R_{loss}$ u Óhmica):** Resistencia real debida a la disipación irreversible de energía en forma de calor por efecto Joule en los conductores metálicos de la antena y el plano de tierra:
    $$
    P_{loss} = \frac{1}{2} |I_0|^2 R_{loss}

    $$

  **Eficiencia de Radiación ($\eta_{rad}$):**
  Relaciona la potencia efectivamente radiada frente a la potencia total suministrada a los terminales de la antena:

  $$
  \eta_{rad} = \frac{P_{rad}}{P_{rad} + P_{loss}} = \frac{R_{rad}}{R_{rad} + R_{loss}}

  $$

  * En una antena resonante de cuarto de onda con plano de masa, $R_{rad} \approx 36.56\,\Omega$ mientras que las pérdidas óhmicas son pequeñas ($R_{loss} \approx 0.5\,\Omega$), lográndose una eficiencia superior al $98\%$ ($\eta_{rad} \approx 0.986$).
  * En el módulo de la práctica sin antena, la pista microscópica de $1\text{ cm}$ posee $R_{rad} \approx 0.0414\,\Omega$, mientras que la resistencia óhmica más las pérdidas del sustrato FR-4 pueden superar $R_{loss} \approx 2\,\Omega$. La eficiencia resulta:
    $$
    \eta_{rad} = \frac{0.0414}{0.0414 + 2.0} \approx \mathbf{0.0202} \approx \mathbf{2.02\%}

    $$

    *(El $98\%$ de la escasa potencia no reflejada se disipa en forma de calor).*

---

### Pregunta 2.6 (Nueva - Teórica Avanzada)

**¿Cuál es la relación teórica entre la directividad y ganancia del dipolo de media onda y del monopolo de cuarto de onda sobre plano de masa ideal?**

* **Respuesta:**
  1. **Dipolo de Media Onda ($\lambda/2$) en el Espacio Libre:**

     * Radia simétricamente en el plano azimutal ($360^\circ$) con forma toroidal (dona).
     * Su directividad máxima teórica es:

       $$
       D_{\text{dipolo}} = \frac{4\pi}{\iint |F(\theta,\phi)|^2 d\Omega} = \frac{4}{1.2188286} \approx \mathbf{1.640922436}

       $$

       En decibeles respecto a la antena isotrópica (dBi):
       $$
       D_{\text{dipolo (dBi)}} = 10\log_{10}(1.640922436) = \mathbf{2.150880435463\text{ dBi}}

       $$
     * Su resistencia de radiación en el espacio libre es:

       $$
       R_{rad,\text{ dipolo}} \approx \mathbf{73.129633706770\,\Omega}

       $$
  2. **Monopolo de Cuarto de Onda ($\lambda/4$) sobre Plano Conductor Infinito:**

     * Según el **Teorema de Imágenes de Maxwell**, el plano metálico genera una antena virtual imagen con corrientes idénticas por debajo del plano, radiando únicamente en el hemisferio superior ($2\pi$ estereorradianes en lugar de $4\pi$).
     * Al emitir la misma potencia total en la mitad del ángulo sólido espacial, la densidad de potencia en el hemisferio superior se duplica exactamente ($2\times$):

       $$
       D_{\text{monopolo}} = 2 \times D_{\text{dipolo}} = 2 \times 1.640922436 = \mathbf{3.281844871}

       $$

       En decibeles (dBi):
       $$
       D_{\text{monopolo (dBi)}} = D_{\text{dipolo (dBi)}} + 10\log_{10}(2) = 2.150880435 + 3.010299957 = \mathbf{5.161180392103\text{ dBi}}

       $$
     * Al distribuirse el voltaje de alimentación sobre una trayectoria que es la mitad de un dipolo completo, su resistencia de radiación se divide exactamente por dos:

       $$
       R_{rad,\text{ monopolo}} = \frac{R_{rad,\text{ dipolo}}}{2} = \frac{73.129633706770\,\Omega}{2} = \mathbf{36.564816853385\,\Omega}

       $$

---

### Pregunta 2.7 (Nueva - Teórica Avanzada)

**¿Cuáles son las fórmulas de Coeficiente de Reflexión ($\Gamma$), Relación de Onda Estacionaria ($VSWR$) y Pérdida de Retorno ($RL$), y qué valores adquieren en un pin `ANT` abierto?**

* **Respuesta:**
  Para una línea de transmisión o puerto de RF de impedancia característica $Z_0$ conectada a una impedancia de carga $Z_L$:

  1. **Coeficiente de Reflexión de Voltaje ($\Gamma$):**
     $$
     \Gamma = \frac{Z_L - Z_0}{Z_L + Z_0}

     $$
  2. **Relación de Onda Estacionaria (*Voltage Standing Wave Ratio* - $VSWR$ o ROE):**
     $$
     VSWR = \frac{V_{max}}{V_{min}} = \frac{1 + |\Gamma|}{1 - |\Gamma|}

     $$
  3. **Pérdida de Retorno (*Return Loss* - $RL$):**
     $$
     RL_{\text{(dB)}} = -20\log_{10}|\Gamma|

     $$
  4. **Potencia Neta Transmitida:**
     $$
     P_{\text{trans}} = P_{\text{inc}} \cdot (1 - |\Gamma|^2)

     $$

  **Evaluación para el pin `ANT` en Circuito Abierto ($Z_L \to \infty$):**

  * Coeficiente de reflexión:
    $$
    \Gamma = \lim_{Z_L \to \infty} \frac{1 - Z_0/Z_L}{1 + Z_0/Z_L} = \mathbf{+1.000000000000}

    $$
  * Relación de Onda Estacionaria:
    $$
    VSWR = \frac{1 + 1}{1 - 1} \to \mathbf{\infty}

    $$
  * Pérdida de Retorno:
    $$
    RL_{\text{(dB)}} = -20\log_{10}(1) = \mathbf{0.000000000000\text{ dB}}

    $$
  * Potencia transmitida a la antena:
    $$
    P_{\text{trans}} = P_{\text{inc}} \cdot (1 - 1^2) = \mathbf{0.000000000000\text{ W}} \quad (0\%)

    $$
  * *Conclusión:* El $100\%$ de la onda incidente es reflejada en fase ($\Gamma = 1$) en la unión del pin `ANT`, explicando analíticamente la extrema atenuación del enlace en el laboratorio.

---

## Bloque 3: Propagación en la Atmósfera y Canales Inalámbricos

### Pregunta 3.1 (Nueva - Teórica Avanzada)

**¿Qué es la Primera Zona de Fresnel y cuál es su radio analítico en el punto medio de un enlace de 3 metros a 433.92 MHz? ¿Por qué la cercanía del suelo o las mesas degrada la señal?**

* **Respuesta:**
  1. **Concepto Físico:**
     El **primer elipsoide de Fresnel** delimita la región del espacio tridimensional entre un transmisor $Tx$ y un receptor $Rx$ en la cual cualquier rayo reflejado experimenta un desfase de camino óptico inferior o igual a medio ciclo ($\le \lambda/2$, equivalente a $\le 180^\circ$). Las ondas reflejadas dentro de esta zona pueden interferir constructiva o destructivamente con el rayo en línea de vista (LOS).
  2. **Ecuación del Radio de Fresnel ($r_n$):**
     Para un vano total de distancia $d = d_1 + d_2$, el radio del elipsoide en cualquier punto intermedio $d_1$ y $d_2$ es:

     $$
     r_n = \sqrt{\frac{n \lambda d_1 d_2}{d_1 + d_2}} = \sqrt{\frac{n \lambda d_1 d_2}{d}}

     $$

     En el **punto medio exacto del vano** ($d_1 = d_2 = d/2 = 1.50\text{ m}$ para $d = 3.00\text{ m}$):

     $$
     r_1 = \sqrt{\frac{\lambda (d/2)(d/2)}{d}} = \frac{\sqrt{\lambda d}}{2}

     $$

     Sustituyendo $\lambda = 0.690893385877581121\text{ m}$ y $d = 3.000000000000\text{ m}$:

     $$
     r_1 = \sqrt{\frac{(0.690893385878) \times (3.000000)}{4}} = \sqrt{0.518170039408} = \mathbf{0.719840287430611820\text{ m}} \approx \mathbf{71.98\text{ cm}}

     $$
  3. **Criterio de Despeje del 60% de Fresnel:**
     Para que un enlace inalámbrico no experimente pérdidas por difracción de borde o bloqueo del terreno, se requiere que al menos el **$60\%$ del radio de la primera zona de Fresnel** permanezca enteramente libre de obstáculos:

     $$
     \text{Despeje Requerido} = 0.6 \times r_1 = 0.6 \times 0.719840287431\text{ m} = \mathbf{0.431904172458367092\text{ m}} \approx \mathbf{43.19\text{ cm}}

     $$
  4. **Impacto en el Laboratorio:**
     Al colocar los módulos Arduino directamente sobre mesas de trabajo (a menudo de altura similar a los módulos, con separaciones verticales inferiores a $10\text{ cm}$ del plano de la mesa), la superficie de la mesa invade ampliamente el 60% de la zona de Fresnel, provocando pérdidas suplementarias severas por difracción y bloqueo que aceleran el corte del enlace antes de alcanzar 3 metros.

---

### Pregunta 3.2 (Nueva - Teórica Avanzada)

**¿Cómo se deduce analíticamente el decaimiento de potencia $1/d^4$ en el Modelo de Dos Rayos sobre suelo plano y por qué causa fluctuaciones rápidas?**

* **Respuesta:**
  El modelo considera la superposición en el receptor de dos frentes de onda:

  * El **rayo directo** en línea de vista de longitud $r_1 = \sqrt{d^2 + (h_t - h_r)^2}$.
  * El **rayo reflejado** en el suelo de longitud $r_2 = \sqrt{d^2 + (h_t + h_r)^2}$.

  ```mermaid
  flowchart LR
      TX["Antena Transmisora (ht)"] -->|Rayo Directo r1| RX["Antena Receptora (hr)"]
      TX -->|Rayo Reflejado| P["Punto de Reflexión en Suelo (Γ ≈ -1)"]
      P -->|Rayo Reflejado r2| RX
  ```

  Para distancias horizontales grandes comparadas con las alturas de las antenas ($d \gg h_t, h_r$):

  $$
  \Delta r = r_2 - r_1 \approx \frac{2 h_t h_r}{d}

  $$

  La diferencia de fase debida al retardo geométrico de trayectoria es:

  $$
  \Delta \phi = \beta \Delta r = \frac{2\pi}{\lambda} \left(\frac{2 h_t h_r}{d}\right) = \frac{4\pi h_t h_r}{\lambda d}

  $$

  Para incidencia rasante ($d$ grande), el ángulo de incidencia con el suelo es casi $90^\circ$, donde el coeficiente de reflexión de Fresnel tanto para polarización vertical como horizontal tiende asintóticamente a $\Gamma \approx -1 = e^{j\pi}$ (inversión de fase de $180^\circ$).
  El campo eléctrico total en el receptor es la suma interferente de ambos rayos:

  $$
  E_{tot} = E_{dir} + E_{ref} \approx E_0 \frac{e^{-j\beta r_1}}{d} + \Gamma E_0 \frac{e^{-j\beta r_2}}{d} = \frac{E_0}{d} e^{-j\beta r_1} \left(1 - e^{-j\Delta \phi}\right)

  $$

  Calculando la magnitud cuadrática:

  $$
  |1 - e^{-j\Delta \phi}|^2 = |1 - \cos(\Delta \phi) + j\sin(\Delta \phi)|^2 = 2 - 2\cos(\Delta \phi) = 4\sin^2\left(\frac{\Delta \phi}{2}\right)

  $$

  Para distancias superiores a la distancia de cruce ($d > d_c = \frac{4 h_t h_r}{\lambda}$), el argumento angular es muy pequeño ($\Delta \phi \ll 1$), lo que permite emplear la aproximación de Taylor $\sin(x) \approx x$:

  $$
  \sin\left(\frac{\Delta \phi}{2}\right) \approx \frac{\Delta \phi}{2} = \frac{2\pi h_t h_r}{\lambda d}

  $$

  Sustituyendo en la expresión del campo eléctrico recibido:

  $$
  |E_{tot}| \approx \frac{E_0}{d} \cdot 2 \left(\frac{2\pi h_t h_r}{\lambda d}\right) = E_0 \frac{4\pi h_t h_r}{\lambda d^2}

  $$

  Dado que la densidad de potencia es proporcional al cuadrado de la amplitud del campo eléctrico ($P_r \propto |E_{tot}|^2$):

  $$
  P_r = P_t G_t G_r \frac{h_t^2 h_r^2}{d^4}

  $$

  En escala logarítmica:

  $$
  P_{r\text{ (dBm)}} \propto -10\log_{10}(d^4) = -40\log_{10}(d)

  $$

  Esto demuestra que la potencia decae a razón de **$40.000000000000\text{ dB}$ por década de distancia** ($12.041199826559\text{ dB}$ por octava), el doble de la pendiente de Friis en espacio libre ($20\text{ dB/década}$). Las fluctuaciones observadas al mover los Arduinos se deben a los valles de interferencia destructiva cuando $\Delta \phi$ atraviesa múltiplos enteros de $2\pi$.

---

### Pregunta 3.3 (Nueva - Teórica Avanzada)

**¿Afecta la atenuación molecular atmosférica (por vapor de agua u oxígeno) y la lluvia a un enlace de 433.92 MHz?**

* **Respuesta:**
  No. En la banda de radiofrecuencia UHF a **$433.92\text{ MHz}$**, la longitud de onda ($\lambda \approx 69.1\text{ cm}$) es órdenes de magnitud mayor que el tamaño de las gotas de lluvia ($0.1\text{ a }5\text{ mm}$) y las dimensiones de las moléculas de los gases atmosféricos ($\approx 10^{-10}\text{ m}$).
  * **Absorción por Gases:** Los picos de resonancia molecular del vapor de agua ($\text{H}_2\text{O}$) y del oxígeno molecular ($\text{O}_2$) ocurren a frecuencias mucho más altas: $22.235\text{ GHz}$, $60\text{ GHz}$ y $118.75\text{ GHz}$. A $433.92\text{ MHz}$, el coeficiente de atenuación específica atmosférica según la Recomendación UIT-R P.676 es inferior a **$0.005\text{ dB/km}$**, totalmente inapreciable para distancias de laboratorio de $3\text{ metros}$.
  * **Dispersión de Rayleigh y Lluvia:** La atenuación por lluvia solo se manifiesta apreciablemente cuando el diámetro de las gotas se aproxima a una fracción de la longitud de onda ($f > 10\text{ GHz}$, bandas Ku, Ka y milimétricas).
  * *Conclusión:* La atenuación en la práctica se debe con exclusividad al desvanecimiento multitrayecto de mesas y paredes, desalineación polarimétrica y a la severa desadaptación de impedancias de los módulos, pero nunca a pérdidas atmosféricas intrínsecas del aire.

---

## Bloque 4: Modulación Digital ASK, Ruido, Capacidad y Firmware

### Pregunta 4.1

**¿Qué principio físico distingue a la modulación ASK de las modulaciones FSK y PSK?**

* **Respuesta:**
  Una señal senoidal de portadora pura se modela matemáticamente como:
  $$
  s(t) = A(t) \cos(2\pi f(t) t + \phi(t))

  $$

  * **ASK (*Amplitude Shift Keying*):** Se hace variar de forma discreta la amplitud instantánea $A(t)$ en función de los bits a transmitir, manteniendo rigurosamente constantes la frecuencia $f(t) = f_c$ y la fase $\phi(t) = \phi_0$.
  * **FSK (*Frequency Shift Keying*):** Se conmuta la frecuencia portadora entre frecuencias discretas ($f_1$ para el bit 0 y $f_2$ para el bit 1), manteniendo constantes la amplitud y la envolvente de potencia.
  * **PSK (*Phase Shift Keying*):** Se conmuta la fase inicial $\phi(t)$ entre valores angulares discretos (ej. $0^\circ$ y $180^\circ$ en BPSK), manteniendo constantes la amplitud y la frecuencia portadora.

---

### Pregunta 4.2

**¿Por qué el receptor XY-MK-5V genera pulsos continuos de ruido aleatorio en su pin DATA cuando el transmisor está apagado?**

* **Respuesta:**
  El receptor XY-MK-5V es un receptor superregenerativo o superheterodino analógico básico de bajo costo. Incorpora un amplificador operacional de ganancia extrema configurado como comparador de nivel (LM358) con control automático de ganancia (AGC).
  Cuando el transmisor no emite portadora en $433.92\text{ MHz}$, la ganancia del AGC sube a su nivel de máxima amplificación para intentar captar señales débiles. En esa condición, el circuito amplifica el **piso de ruido térmico intrínseco de Johnson-Nyquist y el ruido electromagnético ambiental** (luces fluorescentes, computadoras, fuentes conmutadas). El comparador satura entre $0\text{ V}$ (GND) y $5\text{ V}$ (VCC) cada vez que el ruido ambiental cruza el umbral de disparo, generando una cadena caótica y continua de pulsos binarios en el pin digital `DATA`.

---

### Pregunta 4.3

**¿Qué mecanismos de seguridad implementa la librería `RH_ASK` para no interpretar ese ruido aleatorio como un paquete legítimo?**

* **Respuesta:**
  La librería `RH_ASK` filtra el ruido mediante una arquitectura de protocolo de capa de enlace estructurada en cuatro defensas consecutivas:
  1. **Preámbulo de Entrenamiento (36 bits):** Una ráfaga periódica de bits alternados `10101010...` que permite al AGC del receptor fijar su nivel de umbral analógico y al demodulador enganchar el reloj de símbolo.
  2. **Palabra de Sincronía (*Sync Word*):** Una secuencia de bits canónica e invariable (`0x2A` o `0x38`) que marca el inicio exacto de la trama de datos. Si los bits de ruido no coinciden con este valor exacto, el procesador no inicia la decodificación.
  3. **Codificación de Línea Balanceada (4b/6b o Manchester):** Cada cuarteto de datos se codifica en símbolos de 6 bits libres de componente continua (DC-balance), asegurando suficientes transiciones para mantener el sincronismo.
  4. **Código de Redundancia Cíclica (CRC-16):** Un checksum polinómico de 16 bits que se calcula en el transmisor sobre toda la trama. El receptor recalcula el CRC sobre los bytes recibidos; si un solo bit fue alterado por el ruido, el paquete es rechazado y descartado silenciosamente en la capa de interrupción sin despertar a la función `recv()`.

---

### Pregunta 4.4

**¿Por qué la función `askRx.recv(msg, &msgLen)` requiere obligatoriamente que `msgLen` se pase por referencia (puntero)?**

* **Respuesta:**
  Porque la variable `msgLen` opera con **semántica dual de entrada/salida (In/Out Parameter)**:
  * **A la entrada (Input):** Informa a la librería sobre el tamaño máximo disponible en memoria del arreglo receptor provisto (`sizeof(msg)`), protegiendo contra desbordamiento de búfer (*buffer overflow*). Si el paquete que llegó del aire es mayor que `msgLen`, la función aborta y descarta el mensaje por seguridad.
  * **A la salida (Output):** Si la verificación del CRC es exitosa, la función sobreescribe el contenido de la variable en memoria con el número exacto de bytes que contiene la carga útil realmente decodificada.

---

### Pregunta 4.5

**¿Cuál fue el fallo crítico de programación en el código original del receptor (`tamMsg = 10`) frente al transmisor?**

* **Respuesta:**
  El transmisor original emitía la cadena de prueba:
  `"Nombres o apellidos de los integrantes del equipo"` (49 caracteres de longitud).
  Por su parte, el receptor original declaraba:
  `const byte tamMsg = 10; uint8_t msg[tamMsg]; uint8_t msgLen = sizeof(msg);`
  Al invocar `askRx.recv(msg, &msgLen)`, la función evalúa internamente la condición:
  $$
  \text{if } (\text{longitud\_paquete\_recibido} > *\text{len}) \implies \text{return false;}

  $$

  Dado que $49 > 10$, el receptor consideró de forma sistemática que su búfer era insuficiente para alojar el mensaje y lo descartó en el 100% de los intentos. El enlace permaneció mudo sin emitir ningún error por pantalla. La corrección consistió en asignar el tamaño de búfer nativo máximo `RH_ASK_MAX_MESSAGE_LEN + 1` ($68\text{ bytes}$).

---

### Pregunta 4.6

**¿Por qué es indispensable ejecutar `msg[msgLen] = '\0'` antes de invocar `Serial.println((char*)msg)` en C/C++?**

* **Respuesta:**
  En el lenguaje C/C++, las cadenas de caracteres (*C-Strings*) no almacenan internamente su longitud como metadato, sino que dependen de la presencia del carácter especial **nulo delimitador `'\0'` (byte con valor ASCII `0x00`)** para determinar el final del texto en memoria.
  El búfer de radio recibido contiene exclusivamente los bytes crudos del payload transmitido por el canal inalámbrico. Si no se inyecta manualmente el byte `0x00` en la posición contigua al último carácter recibido (`msg[msgLen] = '\0'`), la función `Serial.println((char*)msg)` continuará leyendo bytes secuencialmente de las posiciones adyacentes de la memoria SRAM del ATmega328P. Esto produce una falla de lectura fuera de límites (*Buffer Over-read*), imprimiendo caracteres basura, símbolos ininteligibles o provocando inestabilidad en el puntero de la pila del microcontrolador.

---

### Pregunta 4.7 (Nueva - Teórica Avanzada)

**¿Cuál es la potencia de ruido térmico de Johnson-Nyquist a temperatura ambiente y cómo se calcula para el ancho de banda del receptor?**

* **Respuesta:**
  El ruido térmico generado por la agitación aleatoria de los electrones en cualquier resistor o medio con pérdidas viene gobernado por el postulado de Nyquist:
  1. **Densidad Espectral de Potencia de Ruido ($N_0$):**

     $$
     N_0 = k_B T \quad \left[\frac{\text{W}}{\text{Hz}}\right]

     $$

     donde:

     * Constante de Boltzmann (exacta por SI): $k_B = 1.380649000000\times 10^{-23}\text{ J/K}$
     * Temperatura absoluta de referencia ($T = 20^\circ\text{C} = 293.150000000000\text{ K}$):

     $$
     N_0 = (1.380649\times 10^{-23}\text{ J/K}) \times (293.15\text{ K}) = \mathbf{4.047372543500\times 10^{-21}\text{ W/Hz}}

     $$

     En escala logarítmica respecto a 1 mW (dBm/Hz):

     $$
     N_{0\text{ (dBm/Hz)}} = 10\log_{10}\left(\frac{N_0}{10^{-3}\text{ W}}\right) = \mathbf{-173.928268188010\text{ dBm/Hz}}

     $$

     *(A la temperatura estándar de referencia IEEE de $T = 290\text{ K}$, es el clásico valor $-174.000000\text{ dBm/Hz}$).*
  2. **Potencia de Ruido en el Ancho de Banda de FI del Receptor:**
     Para un receptor superregenerativo XY-MK-5V con un filtro pasabanda de frecuencia intermedia típico de $B = 150\text{ kHz} = 150\,000\text{ Hz}$:

     $$
     N = k_B T B = (4.0473725435\times 10^{-21}\text{ W/Hz}) \times (150\,000\text{ Hz}) = 6.071058815250\times 10^{-16}\text{ W}

     $$

     En escala de dBm:

     $$
     N_{\text{(dBm)}} = -173.928268188010\text{ dBm/Hz} + 10\log_{10}(150\,000) = -173.928268188010 + 51.760912590557 = \mathbf{-122.167355597453\text{ dBm}}

     $$

     *Conclusión:* Si la potencia de señal recibida cae cerca de este piso de ruido térmico (más la figura de ruido del amplificador del receptor), la relación señal a ruido ($SNR$) colapsa, impidiendo la detección de paquetes.

---

### Pregunta 4.8 (Nueva - Teórica Avanzada)

**¿Cómo se define el Margen de Enlace (*Link Margin*) y qué umbral dicta el corte definitivo de la comunicación según el Teorema de Capacidad de Shannon?**

* **Respuesta:**
  1. **Margen de Enlace (*Link Margin* - $LM$):**
     Es la diferencia en decibeles entre la potencia de señal efectivamente recibida en el pin de antena del receptor ($P_r$) y la sensibilidad mínima umbral del receptor ($S_{rx}$):

     $$
     LM_{\text{(dB)}} = P_{r\text{ (dBm)}} - S_{rx\text{ (dBm)}}

     $$

     * Para que el enlace sea estable y confiable, se requiere un margen de desvanecimiento típico $LM \ge 10\text{ a }15\text{ dB}$.
     * Cuando la distancia aumenta y la atenuación combinada de espacio libre, multitrayecto y desadaptación iguala a la potencia del transmisor menos la sensibilidad ($P_r = S_{rx}$), el margen se anula ($LM = 0\text{ dB}$).
     * En el receptor XY-MK-5V, la sensibilidad nominal ronda $S_{rx} \approx -105\text{ dBm}$. Si $P_r < -105\text{ dBm}$, el decodificador de `RH_ASK` es incapaz de discriminar el preámbulo frente al ruido ambiental y la comunicación se corta definitivamente ($d_{\text{corte}} \approx 2.5\text{ m a }3.2\text{ m}$).
  2. **Límite Teórico de Capacidad de Shannon-Hartley:**

     $$
     C = B \log_2(1 + SNR) \quad \left[\frac{\text{bits}}{\text{s}}\right]

     $$

     Para sostener la tasa de modulación del firmware ($R = 2000\text{ bps}$), la capacidad del canal debe ser superior a la tasa de bits ($C \ge R$). A medida que el receptor se aleja con el flexómetro, la $SNR$ se reduce progresivamente hasta que la probabilidad de error de bit ($BER$) se dispara y el CRC-16 descarta el 100% de las tramas recibidas.

---

### Pregunta 4.9 (Nueva - Teórica Avanzada)

**¿Por qué la modulación ASK requiere codificación Manchester o balance DC para su correcta decodificación en el receptor?**

* **Respuesta:**
  En los circuitos receptores de radiofrecuencia ASK/OOK, la señal analógica detectada pasa por un filtro de acoplamiento capacitivo (bloqueo de DC) antes de ingresar al comparador que regenera los bits.
  1. **Problema de la componente DC flotante:** Si se transmitiera una secuencia continua de unos lógicos (`11111...`) o ceros (`00000...`), el voltaje promedio de la señal variaría drásticamente, desplazando la línea de base del umbral del comparador (efecto conocido como *DC wander* o desplazamiento de polarización).
  2. **Pérdida de sincronismo de reloj:** Las señales digitales asíncronas no disponen de una línea compartida de reloj físico; el receptor debe extraer el reloj de los flancos de subida y bajada de los propios datos recibidos. Una secuencia larga de ceros carece de transiciones.
  3. **Solución con Codificación Manchester:**
     * Cada bit se descompone en dos semiciclos: el bit `1` se codifica como una transición BAJO-a-ALTO (`01`), y el bit `0` como ALTO-a-BAJO (`10`).
     * Garantiza exactamente un **50% de ciclo de trabajo promedio** (cero componente de offset DC) y asegura **al menos una transición de voltaje en cada periodo de bit**, permitiendo al receptor regenerar de forma robusta el reloj y fijar el umbral óptimo de decisión digital.

---

## Bloque 5: Tabla Maestra de Constantes Físicas y Parámetros Analíticos (>12 Cifras Significativas)


| Parámetro / Constante Físico-Matemática                     |          Símbolo          |  Valor Numérico de Alta Precisión  |              Unidad SI              |
| :--------------------------------------------------------------- | :--------------------------: | :-------------------------------------: | :-----------------------------------: |
| **Velocidad de la luz en el vacío (Exacta SI)**               |            $c$            |     $299\,792\,458.000000000000$     |            $\text{m/s}$            |
| **Frecuencia nominal de oscilador SAW**                        |            $f$            |     $433\,920\,000.000000000000$     |             $\text{Hz}$             |
| **Permeabilidad magnética del vacío**                        |          $\mu_0$          | $1.256637061435917295\times 10^{-6}$ |    $\text{H/m}$ ($\text{N/A}^2$)    |
| **Permitividad eléctrica del vacío**                         |      $\varepsilon_0$      | $8.854187817620389851\times 10^{-12}$ |            $\text{F/m}$            |
| **Impedancia intrínseca exacta del vacío**                   |          $\eta_0$          |        $376.7303134617706555$        |              $\Omega$              |
| **Aproximación clásica histórica de impedancia**            |          $120\pi$          |        $376.9911184307751886$        |              $\Omega$              |
| **Longitud de onda exacta en el aire**                         |         $\lambda$         |        $0.690893385877581121$        |             $\text{m}$             |
| **Longitud física monopolo de $\lambda/4$**                   |      $L_{\lambda/4}$      |        $0.172723346469395280$        |  $\text{m}$ ($17.2723\text{ cm}$)  |
| **Periodo temporal de oscilación de portadora**               |            $T$            | $2.304572271386430678\times 10^{-9}$ |   $\text{s}$ ($2.3046\text{ ns}$)   |
| **Frecuencia angular de oscilación**                          |          $\omega$          |     $2\,726\,399\,768.4913661641$     |           $\text{rad/s}$           |
| **Número de onda / Constante de fase**                        |        $\beta = k$        |        $9.094290719252737719$        |           $\text{rad/m}$           |
| **Apertura efectiva isotrópica ($f=433.92\text{ MHz}$)**      |           $A_e$           |        $0.037985006594024446$        | $\text{m}^2$ ($379.85\text{ cm}^2$) |
| **Pérdida en Espacio Libre base a $1.0\text{ m}$ ($FSPL_0$)** |          $FSPL_0$          |         $25.1959765789023843$         |             $\text{dB}$             |
| **Atenuación por duplicación de distancia (FSPL)**           |     $\Delta FSPL_{2d}$     |         $6.0205999132796240$         |             $\text{dB}$             |
| **Pendiente de decaimiento del modelo de 2 rayos**             |     $\Delta P_{2ray}$     |         $40.0000000000000000$         |         $\text{dB/década}$         |
| **Radio Primera Zona de Fresnel ($d=3\text{ m}$, centro)**     |           $r_1$           |        $0.719840287430611820$        |   $\text{m}$ ($71.98\text{ cm}$)   |
| **Despeje mínimo requerido (60% Fresnel)**                    |         $0.6 r_1$         |        $0.431904172458367092$        |   $\text{m}$ ($43.19\text{ cm}$)   |
| **Profundidad pelicular en cobre a 433.92 MHz**                |         $\delta_s$         | $3.172497590595699452\times 10^{-6}$ | $\text{m}$ ($3.1725\,\mu\text{m}$) |
| **Densidad espectral de ruido térmico ($20^\circ\text{C}$)**  |           $N_0$           |        $-173.9282681880095042$        |           $\text{dBm/Hz}$           |
| **Potencia de ruido térmico ($B=150\text{ kHz}$)**            |            $N$            |        $-122.1673555974526918$        |            $\text{dBm}$            |
| **Directividad teórica dipolo de media onda**                 |    $D_{\text{dipolo}}$    |         $2.1508804354629416$         |            $\text{dBi}$            |
| **Directividad teórica monopolo sobre masa**                  |   $D_{\text{monopolo}}$   |         $5.1611803921027536$         |            $\text{dBi}$            |
| **Resistencia de radiación dipolo media onda**                |  $R_{rad,\text{ dipolo}}$  |           $73.129633706770$           |              $\Omega$              |
| **Resistencia de radiación monopolo $\lambda/4$**             | $R_{rad,\text{ monopolo}}$ |           $36.564816853385$           |              $\Omega$              |
