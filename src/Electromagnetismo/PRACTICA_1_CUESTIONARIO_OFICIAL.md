---
id: 19_practica_1_cuestionario_oficial
name: practica_1_cuestionario_oficial
title: "Cuestionario Oficial Resuelto: Práctica 1 - Propagación de Ondas Electromagnéticas"
file_path: src/Electromagnetismo/PRACTICA_1_CUESTIONARIO_OFICIAL.md
version: 1.1.0
category: guides
domain: Electromagnetismo
tags: [electromagnetismo, practica-1, cuestionario-oficial, maxwell, ampere, faraday, ask, uhf, propagacion]
description: "Respuestas concisas y directas al cuestionario oficial previo de la Práctica 1 de Teoría Electromagnética con notación de ingeniería redondeada."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-03T22:45:00Z
updated_at: 2026-09-03T23:05:00Z
dependencies: [00_agents_contract, 12_temario_electromagnetismo, 17_practica_1_resumen, 18_practica_1_cuestionario]
schema_version: 1.0.0
---

# INGENIERÍA ELECTRÓNICA — TEORÍA ELECTROMAGNÉTICA
## PRÁCTICA 1: PROPAGACIÓN DE ONDAS ELECTROMAGNÉTICAS EN LA ATMÓSFERA
### CUESTIONARIO OFICIAL PREVIO DE LABORATORIO

---

## 1. ¿Qué es una onda electromagnética?

Es una perturbación oscilatoria periódica y auto-sostenida de campos eléctricos ($\mathbf{E}$) y magnéticos ($\mathbf{H}$) que se propaga por el espacio transportando energía y momento sin necesidad de un soporte material.

En el espacio libre o aire, se comporta como una onda transversal electromagnética (TEM) donde el campo eléctrico y el campo magnético son perpendiculares entre sí y perpendiculares a la dirección de avance, viajando a la velocidad de la luz:

$$
c \approx 3 \times 10^8\text{ m/s}
$$

La relación entre las amplitudes de ambos campos está determinada por la impedancia intrínseca del medio:

$$
\eta_0 = \frac{E}{H} = \sqrt{\frac{\mu_0}{\varepsilon_0}} \approx 377\,\Omega \quad (120\pi\,\Omega)
$$

---

## 2. ¿Qué es la frecuencia y cuál es su relación con la longitud de onda?

* **Frecuencia ($f$):** Es el número de ciclos o repeticiones periódicas completas que realiza la onda por unidad de tiempo, medido en Hertz ($\text{Hz} = \text{s}^{-1}$). En esta práctica, el oscilador SAW opera a $f = 433.92\text{ MHz}$, con un periodo de oscilación:

$$
T = \frac{1}{f} \approx 2.3\text{ ns}
$$

* **Longitud de onda ($\lambda$):** Es la distancia física que recorre el frente de onda durante exactamente un periodo completo.

* **Relación inversa:** La frecuencia y la longitud de onda son inversamente proporcionales a través de la velocidad de propagación:

$$
\lambda = \frac{c}{f}
$$

Para la frecuencia nominal de $433.92\text{ MHz}$ en el aire:

$$
\lambda = \frac{3 \times 10^8}{433.92 \times 10^6} \approx 0.691\text{ m} = 69.1\text{ cm}
$$

De este valor se calcula la longitud física teórica de una antena monopolo resonante de un cuarto de onda ($\lambda/4$):

$$
L_{\lambda/4} = \frac{\lambda}{4} \approx \frac{69.1\text{ cm}}{4} \approx 17.3\text{ cm}
$$

---

## 3. ¿En qué rango del espectro electromagnético se encuentra 433 MHz?

Se encuentra ubicado en la banda **UHF (Ultra High Frequency / Frecuencia Ultra Alta)**, correspondiente al rango internacional de **$300\text{ MHz a }3\text{ GHz}$** (longitudes de onda de $1\text{ m}$ a $10\text{ cm}$).

*(Nota técnica: Aunque el título del manual de prácticas menciona históricamente VHF de 30 a 300 MHz, los módulos de laboratorio operan en $433.92\text{ MHz}$, ubicándose estrictamente en UHF).*

Dentro de este rango, la frecuencia de $433.92\text{ MHz}$ pertenece a la banda libre no licenciada **ISM (Industrial, Scientific and Medical)** entre $433.05\text{ MHz}$ y $434.79\text{ MHz}$, destinada al uso de dispositivos de corto alcance y telemetría sin requerir licencia de telecomunicaciones.

---

## 4. ¿Qué factores afectan la propagación en la atmósfera?

Los principales factores que atenúan la señal de radiofrecuencia en el enlace son:

1. **Pérdida por espacio libre (FSPL):** Dispersión esférica geométrica del frente de onda, donde la densidad de potencia decae en proporción inversa al cuadrado de la distancia ($1/d^2$):

$$
FSPL_{\text{(dB)}} \approx 20\log_{10}(d) + 25.2\text{ dB}
$$

2. **Interferencia multitrayecto y reflexión de suelo (Modelo de dos rayos):** Superposición destructiva entre la onda directa y la reflejada en mesas o piso. Al experimentar un cambio de fase rasante de $\approx 180^\circ$, la señal decae abruptamente a razón de $1/d^4$ ($40\text{ dB/década}$).

3. **Obstrucción de la Primera Zona de Fresnel:** Si las mesas o cuerpos invaden el radio del primer elipsoide de Fresnel ($r_1 \approx 72\text{ cm}$ en el centro de un vano de 3 m), se generan pérdidas por difracción y bloqueo.

4. **Desalineación de polarización:** Si las antenas transmisora y receptora no comparten la misma orientación física (ej. vertical frente a horizontal a $90^\circ$), ocurre una atenuación severa por desacoplamiento polarimétrico ($PLF = \cos^2\theta$).

5. **Ruido electromagnético ambiental:** Interferencias de fuentes conmutadas, computadoras y ruido térmico de fondo ($N_0 \approx -174\text{ dBm/Hz}$) que degradan la relación señal a ruido (SNR).

*(En la banda UHF de 433 MHz, la absorción molecular por gases atmosféricos y la lluvia son insignificantes, inferiores a $0.005\text{ dB/km}$).*

---

## 5. ¿Qué es un receptor RF?

Es un subsistema electrónico diseñado para capturar a través de una antena las ondas electromagnéticas presentes en el aire, amplificar la débil señal inducida (generalmente de microvolts o menor a $-100\text{ dBm}$), filtrar las interferencias fuera de la banda de interés y demodular la portadora para recuperar los datos originales en banda base.

El módulo **XY-MK-5V** utilizado en el laboratorio es un receptor analógico **superregenerativo** sintonizado a $433.92\text{ MHz}$. Incorpora un amplificador con control automático de ganancia (AGC) y un comparador LM358 con una sensibilidad típica de **$-105\text{ dBm}$**. En ausencia de señal transmisora, el AGC eleva su ganancia al máximo y amplifica el ruido ambiental, entregando pulsos aleatorios en su pin digital `DATA`.

---

## 6. ¿Qué tipo de modulación utiliza el módulo RF 433 MHz?

Utiliza modulación **ASK (Amplitude Shift Keying)**, específicamente en su variante binaria **OOK (On-Off Keying)**:

* **Bit 1:** El oscilador se enciende y transmite la portadora a máxima potencia.
* **Bit 0:** El oscilador se apaga por completo (amplitud cero).

Dado que la información se transporta en la amplitud de la señal, es muy sensible al ruido impulsivo y ambiental. Por ello, la librería `RH_ASK` en el microcontrolador implementa una codificación Manchester balanceada y un código de redundancia cíclica (**CRC-16**) para descartar paquetes corrompidos.

---

## 7. ¿Cuál es el objetivo de medir la distancia máxima de comunicación?

Tiene dos propósitos experimentales principales:

1. **Determinar el umbral de corte del enlace:** Identificar la distancia física máxima donde la potencia recibida cae por debajo de la sensibilidad del receptor ($P_r \le -105\text{ dBm}$), agotando el **Margen de Enlace** ($LM = 0\text{ dB}$) y provocando que el CRC-16 rechace el 100% de las tramas por errores de bit.

2. **Evidenciar el efecto de la desadaptación de impedancias:** La práctica prohíbe intencionalmente conectar antena externa al pin `ANT`. Al quedar en circuito abierto ($VSWR \to \infty$), la resistencia de radiación se reduce a la pista del PCB ($R_{rad} \approx 0.04\,\Omega$). Esta atenuación deliberada colapsa el alcance natural de más de $50\text{ m}$ a un rango experimental de **$2.5\text{ a }3.2\text{ metros}$**, permitiendo medir la pérdida de enlace con un flexómetro escolar dentro del aula.

---

## 8. ¿Qué establece la Ley de Ampère?

Establece que la circulación del campo magnético ($\mathbf{H}$ o $\mathbf{B}$) a lo largo de cualquier trayectoria cerrada imaginaria es directamente proporcional a la corriente eléctrica de conducción total encerrada que atraviesa dicha trayectoria:

$$
\oint \mathbf{H} \cdot d\mathbf{\ell} = I_{enc} \quad \Longleftrightarrow \quad \nabla \times \mathbf{H} = \mathbf{J}
$$

*Limitación:* Esta forma clásica solo es válida bajo condiciones magnetostáticas con corrientes estacionarias continuas ($\nabla \cdot \mathbf{J} = 0$).

---

## 9. ¿Qué establece la Ley de Faraday?

Establece que la fuerza electromotriz inducida ($\text{fem}$) en un circuito cerrado es directamente proporcional a la tasa de variación temporal negativa del flujo magnético ($\Phi_B$) que lo atraviesa (Ley de Faraday-Lenz):

$$
\text{fem} = \oint \mathbf{E} \cdot d\mathbf{\ell} = -\frac{d\Phi_B}{dt} \quad \Longleftrightarrow \quad \nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}
$$

*Significado físico:* Un campo magnético que varía en el tiempo engendra un campo eléctrico rotacional (no conservativo). El signo negativo indica que el campo inducido se opone al cambio de flujo magnético que lo origina.

---

## 10. ¿Cómo se relacionan las Leyes de Ampère y Faraday con la propagación de ondas electromagnéticas?

Se relacionan mediante una **retroalimentación dinámica continua y auto-sostenida**:

1. Maxwell corrigió la ley de Ampère incorporando el término de **corriente de desplazamiento** ($\varepsilon \frac{\partial \mathbf{E}}{\partial t}$). Por ende, un campo eléctrico variable en el tiempo engendra un campo magnético rotacional:

$$
\nabla \times \mathbf{H} = \varepsilon \frac{\partial \mathbf{E}}{\partial t}
$$

2. A su vez, por la Ley de Faraday, ese campo magnético variable en el tiempo engendra un campo eléctrico rotacional:

$$
\nabla \times \mathbf{E} = -\mu \frac{\partial \mathbf{H}}{\partial t}
$$

Ambos campos oscilan mutuamente acoplados: ninguno puede existir sin el otro y se regeneran continuamente hacia adelante en el espacio libre a la velocidad de la luz:

$$
c = \frac{1}{\sqrt{\mu_0 \varepsilon_0}} \approx 3 \times 10^8\text{ m/s}
$$

Esta interacción recíproca descrita por Faraday y Ampère-Maxwell es precisamente lo que constituye la onda electromagnética y permite transmitir información inalámbrica entre el transmisor y el receptor de la práctica.