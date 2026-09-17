---
id: 17_practica_1_resumen
name: practica_1_resumen
title: "Práctica 1 Resumen: Propagación de Ondas Electromagnéticas en la Atmósfera"
file_path: src/Electromagnetismo/PRACTICA_1_RESUMEN.md
version: 1.1.0
category: guides
domain: Electromagnetismo
tags: [electromagnetismo, practica-1, resumen, radiofrecuencia, friis, maxwell, antenas, uhf]
description: "Resumen técnico integral, marco teórico riguroso, cálculos electromagnéticos con alta precisión y análisis crítico de firmware para la Práctica 1."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-02T12:00:00Z
updated_at: 2026-09-03T22:00:00Z
dependencies: [00_agents_contract, 12_temario_electromagnetismo, 16_practica_1_original]
schema_version: 1.0.0
---

# INGENIERÍA ELECTRÓNICA — TEORÍA ELECTROMAGNÉTICA
## PRÁCTICA 1: PROPAGACIÓN DE ONDAS ELECTROMAGNÉTICAS EN LA ATMÓSFERA
### GUÍA TÉCNICA, MARCO TEÓRICO, BANCO DE PREGUNTAS Y CÓDIGOS CORREGIDOS

---

## 1. Ficha Técnica y Contexto Académico

* **Nivel Académico:** 7mo Semestre — Licenciatura en Ingeniería Electrónica.
* **Materia:** Teoría Electromagnética / Electromagnetismo.
* **Práctica:** Práctica 1 — *Propagación de Ondas Electromagnéticas en la Atmósfera*.
* **Objetivo Oficial:** Entender el fenómeno de propagación de ondas electromagnéticas en el rango de radiofrecuencia (VHF/UHF), por medio de un enlace inalámbrico punto a punto.
* **Componentes Principales:**
  * 2 Microcontroladores Arduino (ATmega328P: Uno o Nano).
  * 1 Módulo Transmisor de RF ASK (FS1000A).
  * 1 Módulo Receptor de RF ASK (XY-MK-5V).
  * 1 Flexómetro de 3 a 5 metros para medición física de alcance.
  * Entorno de laboratorio a condiciones atmosféricas estándar ($T \approx 20\,^\circ\text{C}$, $1\text{ atm}$, medio no dispersivo).

> [!NOTE]
> **Puntualización Técnica de Ingeniería sobre el Espectro:**
> El título institucional de la práctica hace mención histórica al rango de **VHF** (*Very High Frequency*, 30 MHz a 300 MHz). Sin embargo, los módulos de radiofrecuencia empleados en el laboratorio (FS1000A y XY-MK-5V) cuentan con un oscilador de resonador acústico de superficie (SAW) calibrado nominalmente a **$433.92\text{ MHz}$**. 
> Esta frecuencia pertenece formalmente a la banda **UHF** (*Ultra High Frequency*, 300 MHz a 3 GHz), asignada internacionalmente al espectro no licenciado **ISM** (*Industrial, Scientific and Medical*). Para todos los cálculos electromagnéticos, longitudes de onda y pérdidas de propagación de este documento, se adopta como frecuencia nominal de análisis:
> $$f = 433.920000000000\text{ MHz} = 433\,920\,000.000000000000\text{ Hz} = 4.339200000000 \times 10^8\text{ Hz}$$

---
## 2. Fundamentos de Teoría Electromagnética y Telecomunicaciones

### 2.1. Ecuaciones de Maxwell y Radiación Electromagnética
Una onda electromagnética (OEM) es una perturbación que transporta energía y momento a través del espacio sin necesidad de un soporte material. Está compuesta por un campo eléctrico $\vec{E}$ y un campo magnético $\vec{H}$ mutuamente ortogonales y oscilantes en fase.

En el aire (aproximado como vacío con permitividad dieléctrica $\varepsilon_0 = \frac{1}{\mu_0 c^2} \approx 8.854187817620390 \times 10^{-12}\text{ F/m}$ y permeabilidad magnética $\mu_0 = 4\pi \times 10^{-7}\text{ H/m} \approx 1.256637061435917 \times 10^{-6}\text{ H/m}$), las ecuaciones de Maxwell en ausencia de fuentes libres ($\rho_v = 0$, $\vec{J} = 0$) toman la forma diferencial:

1. **Ley de Gauss Eléctrica:**
   $$\nabla \cdot \vec{E} = 0$$

2. **Ley de Gauss Magnética:**
   $$\nabla \cdot \vec{B} = 0$$

3. **Ley de Faraday:**
   $$\nabla \times \vec{E} = -\frac{\partial \vec{B}}{\partial t}$$

4. **Ley de Ampère-Maxwell:**
   $$\nabla \times \vec{H} = \varepsilon_0 \frac{\partial \vec{E}}{\partial t}$$

Aplicando el rotacional a la Ley de Faraday y sustituyendo la Ley de Ampère-Maxwell, se obtiene la **ecuación de onda tridimensional de Helmholtz**:
$$\nabla^2 \vec{E} - \frac{1}{c^2} \frac{\partial^2 \vec{E}}{\partial t^2} = 0$$
donde la velocidad de propagación de fase en el vacío viene dada por la definición fundamental del SI (17ª CGPM):
$$c = \frac{1}{\sqrt{\mu_0 \varepsilon_0}} = 299\,792\,458.000000000000 \text{ m/s} = 2.997924580000 \times 10^8 \text{ m/s}$$
*(Como referencia didáctica simplificada se suele aproximar a $3.000000000000 \times 10^8 \text{ m/s}$).*

### 2.2. Impedancia Intrínseca del Medio y Vector de Poynting
* **Impedancia intrínseca del medio ($\eta_0$):** Relaciona las amplitudes relativas de campo eléctrico y magnético para una onda transversal electromagnética (TEM):
  $$\eta_0 = \frac{|\vec{E}|}{|\vec{H}|} = \sqrt{\frac{\mu_0}{\varepsilon_0}} = \mu_0 c \approx 376.730313461771\,\Omega$$
  *(Valor contrastado con la aproximación clásica histórica $120\pi\,\Omega \approx 376.991118430775\,\Omega$).*

* **Vector de Poynting ($\vec{S}$):** Representa el flujo instantáneo de densidad de potencia electromagnética:
  $$\vec{S} = \vec{E} \times \vec{H} \quad \left[\frac{\text{W}}{\text{m}^2}\right]$$
  Para una onda armónica plana senoidal, el promedio temporal de densidad de potencia radiada es:
  $$\langle S \rangle = \frac{|\vec{E}_0|^2}{2\eta_0} \quad \left[\frac{\text{W}}{\text{m}^2}\right]$$

### 2.3. Longitud de Onda y Antenas Resonantes
La longitud de onda viene dada por la relación:
$$\lambda = \frac{c}{f}$$
Para la frecuencia portadora nominal ($f = 433\,920\,000.000000000000\text{ Hz}$):
- **Cálculo con la velocidad de la luz exacta del SI ($c = 299\,792\,458\text{ m/s}$):**
  $$\lambda = \frac{299\,792\,458\text{ m/s}}{433\,920\,000\text{ Hz}} = 0.690893385877581\text{ m} = 69.089338587758\text{ cm}$$
- **Cálculo con aproximación didáctica ($c = 3.000000000000 \times 10^8\text{ m/s}$):**
  $$\lambda_{\text{aprox}} = \frac{300\,000\,000\text{ m/s}}{433\,920\,000\text{ Hz}} = \frac{3125}{4520}\text{ m} \approx 0.691371681415929\text{ m} = 69.137168141593\text{ cm}$$

* **Parámetros Temporales y Espaciales de la Onda Radiada:**
  * **Frecuencia angular de oscilación:** $\omega = 2\pi f \approx 2\,726\,399\,768.491366\text{ rad/s} \approx 2.726399768491 \times 10^9\text{ rad/s}$
  * **Periodo temporal de portadora:** $T = \frac{1}{f} \approx 2.304572271386431 \times 10^{-9}\text{ s} = 2.304572271386\text{ ns}$
  * **Número de onda angular (constante de fase):** $\beta = k = \frac{2\pi}{\lambda} = \frac{\omega}{c} \approx 9.094290719253\text{ rad/m}$

* **Antena Monopolo de Cuarto de Onda ($\lambda/4$):**
  Para lograr resonancia fundamental y cancelar la componente reactiva de la impedancia de entrada, se dimensiona un monopolo vertical sobre plano de tierra:
  - **Dimensión física exacta ($c$ SI):**
    $$L_{\lambda/4} = \frac{\lambda}{4} = \frac{0.690893385877581\text{ m}}{4} = 0.172723346469395\text{ m} = 17.272334646940\text{ cm}$$
  - **Dimensión física con aproximación didáctica ($c = 3.0 \times 10^8\text{ m/s}$):**
    $$L_{\lambda/4,\text{ aprox}} = \frac{0.691371681415929\text{ m}}{4} = 0.172842920353982\text{ m} = 17.284292035398\text{ cm}$$
  * Con esta longitud física, la impedancia de entrada teórica en resonancia es puramente resistiva con $Z_{in} = R_{rad} \approx 36.564816853385\,\Omega$ (la mitad exacta de la resistencia de radiación del dipolo de media onda en el espacio libre $73.129633706770\,\Omega$), proporcionando un acoplamiento natural a líneas de transmisión coaxiales de $50\,\Omega$.

### 2.4. ¿Por qué la práctica prohíbe explícitamente agregar antena externa?
La guía original instruye: *"Para la realización de esta práctica no será necesario agregar ninguna antena."* Desde el punto de vista del electromagnetismo aplicado:
1. **Desadaptación Severa de Impedancias:** El pin `ANT` queda en circuito abierto. El elemento radiante se reduce a una minúscula pista de circuito impreso (PCB trace) de $1\text{ a }2\text{ cm}$ ($L \ll \lambda$).
2. **Resistencia de Radiación Casi Nula ($R_{rad} \ll 1\,\Omega$):** Para un radiador eléctricamente corto, la resistencia de radiación se reduce drásticamente mientras que la reactancia capacitiva se dispara ($X_{in} \approx -j1000\,\Omega$).
3. **Reflexión Total de Potencia ($\Gamma \approx 1$, $VSWR \to \infty$):** Más del $99\%$ de la potencia suministrada por el oscilador se refleja y se disipa internamente como calor en el módulo; la potencia radiada útil cae a niveles de microwatts.
4. **Propósito Pedagógico:** Esta atenuación inducida reduce deliberadamente el alcance de transmisión de decenas de metros a un rango confinado de **$0.5\text{ m a }3\text{ m}$**. Esto permite a los alumnos medir la **distancia umbral de corte de enlace** en el laboratorio con un simple flexómetro de 3 a 5 metros.

---
## 3. Mecanismos de Propagación y Fórmulas Clave para Cálculos

### 3.1. Ecuación de Transmisión de Friis (Espacio Libre / Visión Directa)
Modela la potencia recibida $P_r$ a una distancia $d$ en un canal no atenuante sin obstáculos:
$$P_r = P_t \cdot G_t \cdot G_r \cdot \left(\frac{\lambda}{4\pi d}\right)^2$$
En escala logarítmica (decibeles):
$$P_{r\text{ (dBm)}} = P_{t\text{ (dBm)}} + G_{t\text{ (dBi)}} + G_{r\text{ (dBi)}} - FSPL_{\text{(dB)}}$$

### 3.2. Pérdida de Trayectoria en Espacio Libre (*Free Space Path Loss* - FSPL)
Atenuación geométrica provocada por la dispersión esférica del frente de onda electromagnética:
$$FSPL = \left(\frac{4\pi d}{\lambda}\right)^2 = \left(\frac{4\pi f d}{c}\right)^2$$
En escala logarítmica (decibeles):
$$FSPL_{\text{(dB)}} = 20\log_{10}(d) + 20\log_{10}(f) + 20\log_{10}\left(\frac{4\pi}{c}\right)$$
Evaluando la constante de espacio libre con la velocidad de la luz exacta del SI ($c = 299\,792\,458\text{ m/s}$):
$$20\log_{10}\left(\frac{4\pi}{299\,792\,458}\right) = -147.552216778116626\text{ dB}$$
Al expresar la distancia $d$ en metros [m] y la frecuencia $f$ en megahertz [MHz] ($f_{\text{Hz}} = f_{\text{MHz}} \times 10^6$):
$$FSPL_{\text{(dB)}} = 20\log_{10}(d\text{ [m]}) + 20\log_{10}(f\text{ [MHz]}) - 147.552216778116626\text{ dB} + 20\log_{10}(10^6)$$
donde $20\log_{10}(10^6) = 120.000000000000000\text{ dB}$, resultando en la constante:
$$-147.552216778116626\text{ dB} + 120.000000000000000\text{ dB} = -27.552216778116626\text{ dB}$$
*(Aproximado comúnmente en la literatura como $-27.55\text{ dB}$).*

Evaluando rigurosamente para $f = 433.920000000000\text{ MHz}$ con $20\log_{10}(433.92) = 52.748193357019011\text{ dB}$:
$$FSPL_0(1.0\text{ m}) = 52.748193357019011\text{ dB} - 27.552216778116626\text{ dB} = 25.195976578902384\text{ dB}$$
Por consiguiente, la función analítica continua exacta de pérdida en decibeles queda formulada como:
$$FSPL_{\text{(dB)}} = 20\log_{10}(d\text{ [m]}) + 25.195976578902384\text{ dB}$$

* **Cálculo analítico a $0.5\text{ m}$:** 
  $$FSPL(0.5\text{ m}) = 20\log_{10}(0.5) + 25.195976578902384 = -6.020599913279624 + 25.195976578902384 = \mathbf{19.175376665622760\text{ dB}}$$
* **Cálculo analítico a $1.0\text{ m}$:** 
  $$FSPL(1.0\text{ m}) = 20\log_{10}(1.0) + 25.195976578902384 = 0.000000000000000 + 25.195976578902384 = \mathbf{25.195976578902384\text{ dB}}$$
* **Cálculo analítico a $2.0\text{ m}$:** 
  $$FSPL(2.0\text{ m}) = 20\log_{10}(2.0) + 25.195976578902384 = 6.020599913279624 + 25.195976578902384 = \mathbf{31.216576492182008\text{ dB}}$$
* **Cálculo analítico a $3.0\text{ m}$:** 
  $$FSPL(3.0\text{ m}) = 20\log_{10}(3.0) + 25.195976578902384 = 9.542425094393249 + 25.195976578902384 = \mathbf{34.738401673295633\text{ dB}}$$

> [!TIP]
> **Regla Mnemotécnica del Inverso del Cuadrado:**
> Cada vez que la distancia se **duplica** ($2d$), la potencia cae exactamente a la **cuarta parte** ($1/4$), lo que equivale a un incremento determinista de atenuación de $20\log_{10}(2) = \mathbf{6.020599913279624\text{ dB}}$.

### 3.3. Modelo de Dos Rayos (Interferencia de Suelo)
En recintos cerrados, el rayo directo en línea de vista (LOS) interfiere constructiva o destructivamente con el rayo reflejado en mesas o piso. Para distancias mayores a la distancia de cruce:
$$P_r \approx P_t G_t G_r \frac{h_t^2 h_r^2}{d^4}$$
La potencia recibida decae a razón de $10\log_{10}(10^4) = \mathbf{40.000000000000000\text{ dB}}$ por década de distancia ($d^{-4}$), equivalente a $40\log_{10}(2) = \mathbf{12.041199826559248\text{ dB}}$ por octava (duplicación de distancia), explicando la caída abrupta de la señal al alejar los Arduinos.

---

## 4. Modulación Digital ASK / OOK y Capa Física

* **ASK (*Amplitude Shift Keying*):** Modulación digital donde la amplitud instantánea de una portadora senoidal se conmuta entre niveles discretos según el flujo binario:
  $$s(t) = A(t) \cos(2\pi f_c t)$$
* **OOK (*On-Off Keying*):** Caso particular unipolar de ASK (2-ASK) usado en el transmisor FS1000A:
  * **Bit `1`:** Oscilador activado a máxima potencia $\to s(t) = A_{max} \cos(2\pi f_c t)$.
  * **Bit `0`:** Oscilador completamente apagado $\to s(t) = 0$.
* **Vulnerabilidad al Ruido:** Como la información viaja en la amplitud, los picos de ruido electromagnético de fuentes conmutadas, motores o luces fluorescentes se suman directamente a la envolvente, generando falsos unos o ceros.
* **Mecanismos de Protección en `RH_ASK`:** Para mitigar el ruido, la librería emplea:
  1. Codificación balanceada libre de componente DC (Manchester / 4b/6b).
  2. Preámbulo de sincronización (entrena el control de ganancia AGC del receptor).
  3. Palabra de sincronía de 36 bits (*Sync Word*).
  4. Código de redundancia cíclica (**CRC-16**) que descarta cualquier paquete que presente un solo bit erróneo.

---
## 5. Cuestionario de Preparación (Guía de Estudio y Examen)

> [!TIP]
> **Banco Extendido de Preguntas Teórico-Prácticas:**
> Para acceder al banco integral ampliado con preguntas profundas sobre Ecuaciones de Maxwell, condiciones de frontera, regiones de campo de antenas, zonas de Fresnel, modelo de dos rayos, coeficiente de reflexión y ruido térmico, consulte el documento dedicado: [`PRACTICA_1_CUESTIONARIO.md`](file:///G:/REPOSITORIOS%20GITHUB/RECURSOS/src/Electromagnetismo/PRACTICA_1_CUESTIONARIO.md).

### Bloque 1: Fundamentos de Teoría Electromagnética
1. **¿Qué ecuación de Maxwell predice la existencia de ondas electromagnéticas al demostrar que un campo eléctrico variable genera un campo magnético?**
   * *Respuesta:* La Ley de Ampère-Maxwell, a través del término de la corriente de desplazamiento: $\nabla \times \vec{H} = \vec{J} + \varepsilon \frac{\partial \vec{E}}{\partial t}$.

2. **¿Cuál es la relación de fase y orientación espacial entre el campo eléctrico y el campo magnético en la onda radiada?**
   * *Respuesta:* En una onda plana transversal electromagnética (TEM), el campo eléctrico $\vec{E}$ y el campo magnético $\vec{H}$ se encuentran en fase temporal, son perpendiculares entre sí ($\vec{E} \perp \vec{H}$) y su producto vectorial define la dirección de propagación $\vec{k}$ ($\vec{E} \times \vec{H} \parallel \vec{k}$).

3. **¿Cuál es el valor teórico de la impedancia intrínseca del aire y qué significado físico tiene?**
   * *Respuesta:* $\eta_0 = \mu_0 c \approx 376.730313461771\,\Omega$ (aproximación clásica $120\pi\,\Omega \approx 376.991118430775\,\Omega$). Representa la oposición del medio dieléctrico al flujo de energía electromagnética, determinando la relación entre las amplitudes de los campos eléctrico y magnético: $\eta_0 = E_0 / H_0$.

4. **Si una onda electromagnética a 433.92 MHz se propaga en el aire, ¿cuál es su longitud de onda?**
   * *Respuesta:* Con la velocidad de la luz exacta del SI ($c = 299\,792\,458\text{ m/s}$):
     $$\lambda = \frac{299\,792\,458\text{ m/s}}{433\,920\,000\text{ Hz}} = 0.690893385877581\text{ m} = 69.089338587758\text{ cm}$$
     *(Con la aproximación didáctica usual $c = 3.0 \times 10^8\text{ m/s}$: $\lambda_{\text{aprox}} = \frac{300\,000\,000}{433\,920\,000} \approx 0.691371681415929\text{ m} = 69.137168141593\text{ cm}$).*

5. **¿Por qué la atenuación de Friis en espacio libre aumenta con la frecuencia si la velocidad de la luz es constante?**
   * *Respuesta:* Porque el área de apertura efectiva de captura de una antena isotrópica receptora disminuye de forma cuadrática con la frecuencia ($A_e = \frac{\lambda^2}{4\pi} = \frac{c^2}{4\pi f^2}$). A mayor frecuencia, menor longitud de onda y menor superficie geométrica equivalente de recolección de energía electromagnética. Para $f = 433.920000000000\text{ MHz}$, la apertura efectiva isotrópica exacta es:
     $$A_e = \frac{(0.690893385877581\text{ m})^2}{4\pi} = 0.037985006594024\text{ m}^2 = 379.850065940244\text{ cm}^2$$
     *(O $0.038037632616475\text{ m}^2 = 380.376326164746\text{ cm}^2$ empleando la aproximación $c = 3.0 \times 10^8\text{ m/s}$).*

---

### Bloque 2: Antenas y Líneas de Transmisión
6. **¿Cuál es la dimensión física ideal de un monopolo resonante de un cuarto de onda para este enlace?**
   * *Respuesta:* Con la longitud de onda exacta derivada del SI:
     $$L_{\lambda/4} = \frac{\lambda}{4} = \frac{0.690893385877581\text{ m}}{4} = 0.172723346469395\text{ m} = 17.272334646940\text{ cm}$$
     *(Con aproximación didáctica $c = 3.0 \times 10^8\text{ m/s}$: $L_{\text{aprox}} = \frac{0.691371681415929\text{ m}}{4} \approx 0.172842920353982\text{ m} = 17.284292035398\text{ cm}$).*

7. **¿Qué ocurre electromagnéticamente cuando el transmisor FS1000A opera sin antena conectada?**
   * *Respuesta:* El terminal de salida queda en circuito abierto, provocando una desadaptación severa de impedancias ($\Gamma \approx 1$, $VSWR \to \infty$). La resistencia de radiación cae a una fracción minúscula de ohmio ($R_{rad} \ll 1\,\Omega$), disipándose casi toda la potencia en calor dentro del módulo y emitiéndose únicamente una radiación residual espuria por las pistas del PCB, reduciendo el alcance a pocos metros.

8. **¿Cómo influye la polarización de las antenas en el enlace si ambos módulos se rotan $90^\circ$ entre sí?**
   * *Respuesta:* Si la polarización del transmisor es vertical y la del receptor se orienta horizontal, ocurre una pérdida por desalineación de polarización (*Polarization Mismatch Loss*), la cual teóricamente atenúa la señal en un factor $\cos^2(\theta)$. Para $\theta = 90^\circ$, la atenuación teórica es infinita (en la práctica suele atenuar entre $20\text{ y }30\text{ dB}$ debido a reflexiones multitrayecto).

---

### Bloque 3: Modulación, Ruido y Sistemas Embebidos
9. **¿Qué principio físico distingue a la modulación ASK de la FSK y la PSK?**
   * *Respuesta:* En ASK únicamente varía la amplitud de la portadora manteniendo constantes la frecuencia y la fase; en FSK se varía la frecuencia portadora y en PSK se conmuta la fase de la señal senoidal.

10. **¿Por qué el pin DATA del receptor XY-MK-5V entrega pulsos de ruido errático cuando el transmisor está apagado?**
    * *Respuesta:* El receptor tiene una etapa analógica con control automático de ganancia (AGC) y un comparador de alta ganancia (LM358). Al no existir una portadora RF dominante en 433 MHz, el circuito amplifica al máximo el piso de ruido térmico ambiental y lo convierte en una secuencia aleatoria de unos y ceros digitales.

11. **¿Qué mecanismo utiliza la librería `RH_ASK` para no confundir ese ruido aleatorio con un mensaje legítimo?**
    * *Respuesta:* Utiliza un preámbulo de sincronización estructurado (bits alternados), seguido de una palabra de inicio de trama (*Sync Word*) y un código de redundancia cíclica de 16 bits (**CRC-16**). Si el ruido no cumple la firma exacta o el cálculo del CRC no coincide bit a bit, el paquete es automáticamente rechazado.

12. **¿Por qué la función `askRx.recv(msg, &msgLen)` requiere que `msgLen` se pase por referencia?**
    * *Respuesta:* Funciona con semántica de entrada/salida: al invocarla, `msgLen` le indica a la función cuántos bytes tiene de capacidad máxima el buffer provisto; si la recepción es exitosa, la función sobreescribe el valor de `msgLen` con el número exacto de bytes que componen la carga útil recibida.

13. **¿Cuál fue el error de diseño en el código original del receptor con respecto al buffer de recepción?**
    * *Respuesta:* Se definió `tamMsg = 10`, mientras que el transmisor enviaba una cadena de 49 caracteres. Dado que `RH_ASK::recv()` rechaza de inmediato cualquier paquete cuyo tamaño supere el buffer disponible (`*len < packet_len`), el receptor descartaba silenciosamente el 100% de las tramas recibidas.

14. **¿Por qué es obligatorio asignar `msg[msgLen] = '\0'` antes de invocar `Serial.println((char*)msg)`?**
    * *Respuesta:* Porque en el lenguaje C/C++ las funciones de impresión de cadenas buscan secuencialmente en memoria hasta encontrar el carácter nulo delimitador `\0` (0x00). Como el paquete recibido por radio solo contiene los datos crudos, si no se coloca el `\0` manualmente, `Serial.println` continuará leyendo posiciones contiguas de la memoria RAM del microcontrolador, imprimiendo caracteres basura o provocando lecturas fuera de límites.

---
## 6. Análisis Crítico y Comentado del Código Original

El archivo original [`PRACTICA_1_ORIGINAL.md`](file:///G:/7MO%20SEMESTRE/ELECTROMAGNETISMO/Practica%201/PRACTICA_1_ORIGINAL.md) proporcionaba los programas base para el transmisor y el receptor. A continuación se presenta cada código con comentarios técnicos profundos que evidencian los fallos, riesgos y las justificaciones de por qué fue necesario modificarlos.

### 6.1. Código Original del Transmisor (`askTx`) — Con análisis de fallas

```cpp
// ============================================================================
// CÓDIGO ORIGINAL DEL TRANSMISOR (Extraído de PRACTICA_1_ORIGINAL.md)
// Comentarios de ingeniería sobre debilidades y riesgos de implementación
// ============================================================================

// Incluir librerías
// RadioHead ASK: Administra la modulación digital por amplitud a bajo nivel
// SPI: Requisito de compilación de la suite RadioHead (no utiliza pines SPI aquí)
#include <RH_ASK.h>
#include <SPI.h>

// Instanciación del objeto ASK utilizando el constructor por defecto.
// Por hardware en ATmega328P, asigna de forma fija:
// Pin 12: Transmisión (DATA TX)
// Pin 11: Recepción (DATA RX)
// Pin 10: Control PTT (Push To Talk)
// Tasa de transferencia: 2000 bps (baudios)
RH_ASK askTx;

void setup()
{
  // DEBILIDAD 1: No se inicializa la comunicación serial (Serial.begin(9600)).
  // Al no haber monitor serie en el transmisor, el usuario se encuentra a ciegas:
  // no puede saber si el microcontrolador arrancó, si falló o si está transmitiendo.

  // DEBILIDAD 2: askTx.init() retorna un valor booleano (true/false) que informa
  // si los temporizadores internos por hardware (Timer 1 o Timer 2) se reservaron
  // con éxito. En el código original se descarta el valor de retorno sin validar.
  askTx.init();
}

void loop()
{
  // FALLA CRÍTICA 1 (Incoherencia semántica y desbordamiento):
  // Los comentarios afirman:
  //   // Longitud: 10
  //   // No superar los 27 caracteres
  // Sin embargo, la cadena asignada tiene 49 caracteres de longitud:
  const char *msg = "Nombres o apellidos de los integrantes del equipo"; 
  // Esta longitud excede por completo el buffer del receptor original (tamMsg = 10),
  // garantizando que el enlace falle en el 100% de los intentos de recepción.

  // Envío del paquete: se convierte el apuntador a uint8_t* y se pasa la longitud en bytes
  askTx.send((uint8_t *)msg, strlen(msg));

  // Bloqueo de CPU: detiene el hilo principal hasta que los pulsos terminen de
  // modularse físicamente en la portadora a través de la rutina de interrupción (ISR).
  askTx.waitPacketSent();

  // Pausa de 1000 ms: estabiliza el ciclo de trabajo de RF y previene colisiones continuas.
  delay(1000);
}
```

---

### 6.2. Código Original del Receptor (`askRx`) — Con análisis de fallas

```cpp
// ============================================================================
// CÓDIGO ORIGINAL DEL RECEPTOR (Extraído de PRACTICA_1_ORIGINAL.md)
// Comentarios de ingeniería sobre fallos catastróficos que impiden el funcionamiento
// ============================================================================

// Incluir librerías
#include <RH_ASK.h>
#include <SPI.h>

// ERROR FATAL 1: Subdimensionamiento severo del buffer receptor
// Se declara un tamaño fijo de apenas 10 bytes:
const byte tamMsg = 10;

// Crear un objeto de la clase ASK
RH_ASK askRx;

void setup()
{
  // Iniciar monitor serie a 9600 baudios para visualizar datos en PC
  Serial.begin(9600);

  // DEBILIDAD: No se verifica si askRx.init() pudo reclamar el temporizador del micro.
  askRx.init();
}

void loop()
{
  // ERROR FATAL 2: Arreglo de recepción sin margen para terminador nulo '\0'
  uint8_t msg[tamMsg];          // Arreglo de 10 bytes en la memoria SRAM (pila)
  uint8_t msgLen = sizeof(msg); // msgLen se fija en 10 bytes

  // ERROR FATAL 3: Rechazo sistemático de paquetes por desbordamiento de buffer
  // La función askRx.recv(msg, &msgLen) evalúa:
  // Si (bytes_del_paquete_recibido > msgLen), la función retorna FALSE de inmediato
  // y descarta el paquete sin procesarlo.
  // Dado que el transmisor emite 49 bytes y aquí msgLen es 10, askRx.recv()
  // NUNCA retornará true. El receptor permanece en silencio perpetuo.
  if (askRx.recv(msg, &msgLen))
  {
    // ERROR FATAL 4: Lectura fuera de límites de memoria (Buffer Over-read)
    // En caso hipotético de recibir un mensaje de 10 bytes, el arreglo contendrá
    // 10 caracteres alfanuméricos SIN el delimitador de escape '\0'.
    // Al ejecutar:
    Serial.print("Mensaje recibido: ");
    Serial.println((char*)msg); 
    // Serial.println recorre el puntero hasta hallar un byte 0 en la RAM.
    // Esto imprime símbolos extraños, signos de interrogación o basura de memoria,
    // pudiendo desestabilizar el apuntador de la pila.
  }
}
```

---
## 7. Códigos Corregidos y Optimizados del Proyecto

Para subsanar las fallas de diseño, desbordamientos de memoria y falta de diagnóstico, se implementaron los códigos definitivos en las carpetas del proyecto: [Transmisor.ino](file:///G:/7MO%20SEMESTRE/ELECTROMAGNETISMO/Practica%201/Transmisor/Transmisor.ino) y [Receptor.ino](file:///G:/7MO%20SEMESTRE/ELECTROMAGNETISMO/Practica%201/Receptor/Receptor.ino).

### 7.1. Código Corregido: `Transmisor\Transmisor.ino`

```cpp
#include <RH_ASK.h>
#include <SPI.h>

// Instancia del objeto ASK
// Por defecto: Pin 12 (TX), Pin 11 (RX), Pin 10 (PTT) a 2000 bps
RH_ASK askTx;

void setup()
{
  Serial.begin(9600);
  
  askTx.init();
  // Validar si el hardware o temporizadores se inicializaron correctamente
  if (!askTx.init()) {
    Serial.println("Error al inicializar el módulo transmisor.");
    while (1);
  }
}

void loop()
{
  // Mensaje a transmitir (máximo recomendado dentro del estándar: hasta 27-60 bytes según payload)
  const char *msg = "Equipo: Christian, Jesus, Evan";
  uint8_t msgLen = strlen(msg);

  // Enviar arreglo de bytes y longitud real de la cadena
  askTx.send((uint8_t *)msg, msgLen);

  // Esperar a que la modulación física termine por completo
  askTx.waitPacketSent();

  // Intervalo entre transmisiones
  delay(1000);
}
```

#### ¿Qué se hizo y por qué en el Transmisor?
1. **Verificación de inicialización de hardware (`if (!askTx.init())`):**
   * *Qué se hizo:* Se capturó el valor de retorno de `askTx.init()` y se añadió una trampa con bucle infinito `while(1)` y mensaje de error por `Serial`.
   * *Por qué se hizo:* En sistemas embebidos (ATmega328P), los temporizadores pueden entrar en conflicto con librerías de servos o PWM. La validación previene que el programa corra en falso si el Timer 1/2 no pudo ser configurado.
2. **Mensaje representativo, coherente y acotado:**
   * *Qué se hizo:* Se cambió la cadena de prueba por `"Equipo: Christian, Jesus, Evan"` ($30\text{ bytes}$).
   * *Por qué se hizo:* Identifica con exactitud a los integrantes del equipo de laboratorio y mantiene la carga útil en un tamaño perfectamente compatible con la modulación de 2000 bps sin fragmentación.
3. **Cálculo explícito y tipificado de longitud (`uint8_t msgLen = strlen(msg)`):**
   * *Qué se hizo:* Se calculó la longitud en una variable de tipo `uint8_t` antes de la transmisión.
   * *Por qué se hizo:* Garantiza compatibilidad formal con los parámetros de la firma `RH_ASK::send(const uint8_t* address, uint8_t len)`.

---

### 7.2. Código Corregido: `Receptor\Receptor.ino`

```cpp
#include <RH_ASK.h>
#include <SPI.h>

// Instancia del objeto ASK
RH_ASK askRx;

// const byte tamMsg = 10;

void setup()
{
  Serial.begin(9600);

  askRx.init();

  // Validar si el temporizador y el pin de recepción se inicializaron correctamente
  if (!askRx.init()) {
    Serial.println("Error al inicializar el módulo receptor.");
    while (1);
  }
  
  Serial.println("Receptor listo para escuchar paquetes...");
}

void loop()
{
  // Buffer dimensionado con la constante nativa de la librería (RH_ASK_MAX_MESSAGE_LEN = 67 bytes)
  // Se agrega +1 byte de reserva para alojar el terminador nulo '\0'
  uint8_t msg[RH_ASK_MAX_MESSAGE_LEN + 1];
  
  // msgLen DEBE reasignarse en cada ciclo al tamaño disponible del buffer
  uint8_t msgLen = sizeof(msg) - 1;

  // askRx.recv() retorna true solo si el paquete es íntegro y el CRC coincide
  if (askRx.recv(msg, &msgLen))
  {
    // Colocar explícitamente el terminador nulo al final del texto recibido
    msg[msgLen] = '\0';

    // Imprimir el mensaje de forma segura sin desbordamiento ni basura de memoria
    Serial.print("Mensaje recibido (");
    Serial.print(msgLen);
    Serial.print(" bytes): ");
    Serial.println((char *)msg);
  }
}
```

#### ¿Qué se hizo y por qué en el Receptor?
1. **Adopción de `RH_ASK_MAX_MESSAGE_LEN + 1` en el buffer receptor:**
   * *Qué se hizo:* Se eliminó la limitación arbitraria `tamMsg = 10` y se asignó el tamaño nativo máximo de la librería ($67\text{ bytes}$) más un byte extra ($68\text{ bytes}$ en total).
   * *Por qué se hizo:* Resuelve de raíz el error fatal del código original. Con 68 bytes de buffer, el receptor puede recibir cualquier mensaje transmitido sin riesgo de descartarlo por falta de espacio.
2. **Reasignación continua de `msgLen = sizeof(msg) - 1` en el `loop()`:**
   * *Qué se hizo:* Se calcula en cada ciclo la capacidad útil del buffer.
   * *Por qué se hizo:* El método `recv(msg, &msgLen)` sobreescribe la variable `msgLen` con la longitud real del paquete que acaba de llegar (por ejemplo, 30 bytes). Si no se reasigna a 67 al iniciar la siguiente vuelta del `loop()`, la variable quedaría recortada a 30, y cualquier paquete posterior de 35 bytes sería rechazado.
3. **Inyección manual del carácter terminador nulo (`msg[msgLen] = '\0'`):**
   * *Qué se hizo:* Se coloca explícitamente el byte cero en la posición posterior al último carácter recibido.
   * *Por qué se hizo:* Las cadenas en C/C++ requieren el terminador `\0` para saber dónde concluyen. Esto permite que `Serial.println((char *)msg)` imprima únicamente el mensaje recibido de forma segura, sin leer basura de la memoria RAM ni provocar desbordamientos de lectura.
4. **Métricas cuantitativas en el monitor serie:**
   * *Qué se hizo:* Se añadió la impresión entre paréntesis del número de bytes recibidos (`msgLen`).
   * *Por qué se hizo:* Proporciona una herramienta de depuración en tiempo real que confirma la integridad del payload en cada medición del flexómetro.

---

### 7.3. Matriz Comparativa: Código Original vs. Código Corregido

| Parámetro / Módulo | Implementación Original | Implementación Corregida | Ventaja Técnica / Razón de Ingeniería |
| :--- | :--- | :--- | :--- |
| **Capacidad de Buffer (RX)** | $10\text{ bytes}$ (`tamMsg = 10`) | $68\text{ bytes}$ (`RH_ASK_MAX_MESSAGE_LEN + 1`) | Elimina el descarte silencioso del paquete por buffer insuficiente. |
| **Integridad de C-Strings** | Sin terminador nulo | `msg[msgLen] = '\0'` | Garantiza impresión segura sin basura de memoria RAM (*buffer over-read*). |
| **Inicialización de Periféricos** | Se ignora el retorno de `.init()` | `if (!ask.init())` con diagnóstico | Detección inmediata de fallos en temporizadores o pines digitales. |
| **Longitud de Transmisión (TX)** | Mensaje incoherente de $49\text{ B}$ | Mensaje definido del equipo de $30\text{ B}$ | Asegura estabilidad de modulación y recepción sin truncamiento. |
| **Reasignación de Longitud (RX)** | Local en stack, estática a 10 | Reasignada dinámicamente en cada ciclo | Permite recibir paquetes de longitudes variables de forma consecutiva. |
| **Métricas de Recepción** | Solo texto no delimitado | Conteo de bytes + texto limpio | Facilita la correlación de datos en el reporte experimental. |

---
## 8. Análisis y Funcionamiento del Sistema (Arquitectura RF y Firmware)

El conjunto opera un enlace unidireccional de radiofrecuencia (habitualmente a 433.92 MHz o 315 MHz) modulado por **ASK** (*Amplitude Shift Keying* o modulación por desplazamiento de amplitud), donde los ceros y unos lógicos se transmiten variando la amplitud de la portadora senoidal.

### 8.1. Mapeo de Hardware por Defecto
Al instanciar `RH_ASK askTx;` y `RH_ASK askRx;` sin argumentos en un microcontrolador ATmega328P (como Arduino Uno o Nano), la librería asigna pines fijos mediante temporizadores por hardware:
* **Pin digital 12:** Transmisión (TX Data hacia el pin *DATA* del transmisor FS1000A).
* **Pin digital 11:** Recepción (RX Data desde el pin *DATA* del receptor XY-MK-5V).
* **Pin digital 10:** PTT (*Push-to-Talk* o habilitación del transmisor, si aplica).
* **Velocidad de modulación predeterminada:** $2000\text{ bps}$ (bits por segundo).

### 8.2. Dinámica del Transmisor (TX)
1. **Empaquetado de Capa de Enlace:** `askTx.send((uint8_t *)msg, strlen(msg))` no envía texto plano simple; ensambla un paquete digital compuesto por un preámbulo de sincronización (entrenamiento del AGC del receptor), encabezados de sincronización (*Sync Word* de 36 bits), la longitud de la trama, la carga útil codificada en símbolos de 4 a 6 bits (balance DC) y un código de redundancia cíclica (**CRC-16**).
2. **Bloqueo de Envío:** La función `askTx.waitPacketSent()` detiene la CPU mientras los pulsos se modulan físicamente hacia el aire a través de la rutina de interrupción del temporizador, evitando sobreescribir el buffer antes de que la portadora termine de radiar la señal.
3. **Temporización:** El `delay(1000)` espacia las emisiones para evitar saturar el canal de radiofrecuencia y controlar el consumo energético del transmisor.

### 8.3. Dinámica del Receptor (RX)
1. **Filtrado de Ruido Ambiental:** Las señales de RF en frecuencias ISM (433 MHz) presentan ruido electromagnético continuo en el pin receptor. La librería vigila la señal en segundo plano (usando la interrupción del Timer 1 o Timer 2) buscando activamente el patrón del preámbulo.
2. **Verificación de Integridad:** La función `askRx.recv(msg, &msgLen)` solo retorna `true` si el paquete llegó íntegro y el cálculo del CRC local coincide exactamente con el del transmisor; de lo contrario, descarta la trama sin pasarla al código principal.
3. **Paso por Referencia:** La variable `msgLen` se pasa a `recv` como puntero (`&msgLen`). Al entrar indica la capacidad máxima del buffer disponible y, si se recibe con éxito, el método la sobreescribe con el número exacto de bytes que realmente llegaron.

### 8.4. Observaciones Críticas sobre el Código Original
* **Discrepancia en el tamaño del buffer (`tamMsg`):** En el original, el receptor definía un buffer de apenas 10 bytes (`tamMsg = 10`), mientras que el transmisor contenía la cadena `"Nombres o apellidos de los integrantes del equipo"` (49 caracteres). Si el tamaño del paquete enviado excede `tamMsg`, la función `recv()` descarta el paquete completo por desbordamiento de buffer.
* **Terminador nulo en recepción:** Al convertir bytes de radio a texto mediante `Serial.println((char*)msg)`, Arduino necesita un carácter nulo de escape (`\0`) al final de la cadena. Sin delimitar `msg[msgLen] = '\0'`, el microcontrolador continuará leyendo bytes basura de la memoria RAM hasta encontrar un cero fortuito.

---

## 9. Metodología Experimental de Laboratorio y Registro de Datos

### 9.1. Procedimiento de Medición con Flexómetro
1. **Alineación Inicial ($d \approx 0.2\text{ m}$):**
   * Conectar los módulos a sus respectivos Arduinos según el pinout:
     * **TX:** $DATA \to \text{Pin 12}$, $VCC \to 5\text{V}$, $GND \to GND$.
     * **RX:** $DATA \to \text{Pin 11}$, $VCC \to 5\text{V}$, $GND \to GND$.
   * Abrir el monitor serie del receptor a $9600\text{ baudios}$.
   * Verificar la recepción limpia: `"Mensaje recibido (30 bytes): Equipo: Christian, Jesus, Evan"`.
   * Tomar captura de pantalla de evidencia.
2. **Intercambio de Roles (Bidireccionalidad):**
   * Cargar el código receptor en el equipo A y el código transmisor en el equipo B.
   * Confirmar la recepción correcta y registrar la evidencia gráfica de reciprocidad.
3. **Barrido de Distancia hasta Corte de Enlace:**
   * Fijar el punto cero del flexómetro en el módulo transmisor.
   * Desplazar lentamente el módulo receptor en línea recta (manteniendo línea de vista LOS).
   * Registrar las distancias intermedias y anotar la tasa de éxito de paquetes.
   * Medir la **distancia máxima de corte ($d_{max}$)** en la cual la consola serie deja de imprimir mensajes de forma definitiva.

### 9.2. Tabla de Registro Experimental y Pérdida Calculada

| Medición | Distancia Física ($d$) | Estado de Recepción | Tasa de Pérdida | Pérdida de Espacio Libre Teórica ($FSPL$) | Observaciones Electromagnéticas |
| :---: | :---: | :---: | :---: | :---: | :--- |
| **M1** | $0.20\text{ m}$ ($20\text{ cm}$) | 100% Correcta | $0\%$ | $\mathbf{11.216576492182\text{ dB}}$ | Enlace en campo cercano reactivo/radiante. Señal saturada de alta intensidad. |
| **M2** | $0.50\text{ m}$ ($50\text{ cm}$) | 100% Correcta | $0\%$ | $\mathbf{19.175376665623\text{ dB}}$ | Señal estable, preámbulo y CRC perfectamente detectados en campo lejano. |
| **M3** | $1.00\text{ m}$ ($100\text{ cm}$) | 100% Correcta | $0\%$ | $\mathbf{25.195976578902\text{ dB}}$ | Pérdida de referencia a 1 metro. Enlace óptimo en línea de vista (LOS). |
| **M4** | $1.50\text{ m}$ ($150\text{ cm}$) | 90% - 100% | $\le 10\%$ | $\mathbf{28.717801760016\text{ dB}}$ | Comienzan descartes esporádicos por desvanecimiento multitrayecto de mesa/suelo. |
| **M5** | $2.00\text{ m}$ ($200\text{ cm}$) | Intermitente | $40\% - 60\%$ | $\mathbf{31.216576492182\text{ dB}}$ | Sensibilidad límite del receptor alcanzada (degradación de SNR). |
| **M6** | $d_{corte} \approx 2.50\text{ m} - 3.20\text{ m}$ | **Enlace Perdido** | $100\%$ | $\mathbf{33.154776752343\text{ dB} - 35.298976145301\text{ dB}}$ | Potencia recibida cae por debajo del umbral de corte del receptor ($\approx -105\text{ dBm}$). |

---

## 10. Conclusiones y Recomendaciones de Ingeniería

1. **Impacto de la Ausencia de Antena Resonante:** La experiencia demuestra de forma empírica que prescindir de una antena de cuarto de onda ($17.3\text{ cm}$) convierte el enlace en un radiador extremadamente ineficiente. La desadaptación de impedancias reduce el alcance de más de $50\text{ metros}$ a apenas $2\text{ a }3\text{ metros}$, evidenciando la importancia crítica del acoplamiento de impedancias y la resonancia en sistemas de RF.
2. **Robustez de la Capa de Enlace:** La inclusión de mecanismos como el preámbulo, codificación Manchester balanceada y verificación CRC-16 en la librería `RH_ASK` es indispensable en canales ASK/OOK. Sin estas técnicas, el microcontrolador interpretaría como datos válidos el ruido electromagnético continuo del ambiente de laboratorio.
3. **Buenas Prácticas en Sistemas Embebidos:** La depuración de este laboratorio pone de manifiesto que el software de microcontroladores debe contemplar el manejo riguroso de buffers, terminaciones de cadenas C-String y comprobaciones de estado de los temporizadores de hardware, evitando asumir comportamientos implícitos que conllevan a fallas catastróficas silenciosas.
