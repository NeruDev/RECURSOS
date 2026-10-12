Las 4 familias fundamentales de parámetros para el análisis de cuadripolos (redes de dos puertos) representan las distintas formas de elegir las dos variables independientes y las dos dependientes entre las tensiones y corrientes del puerto de entrada ($V_1, I_1$) y de salida ($V_2, I_2$).

---

### 1. Parámetros $Z$ (Impedancia de Circuito Abierto)

Expresan las **tensiones de entrada y salida** en función de las **corrientes** de ambos puertos.

$$
\begin{bmatrix} V_1 \\ V_2 \end{bmatrix} = \begin{bmatrix} z_{11} & z_{12} \\ z_{21} & z_{22} \end{bmatrix} \begin{bmatrix} I_1 \\ I_2 \end{bmatrix}
$$

* **En qué consisten:** Cada coeficiente se determina dejando uno de los puertos en **circuito abierto** ($I_1 = 0$ o $I_2 = 0$). Todos los elementos tienen unidades de impedancia ($\Omega$).
* $z_{11} = \left.\frac{V_1}{I_1}\right\vert{}_{I_2=0}$ : Impedancia de entrada a circuito abierto.
* $z_{12} = \left.\frac{V_1}{I_2}\right\vert{}_{I_1=0}$ : Impedancia de transferencia inversa.
* $z_{21} = \left.\frac{V_2}{I_1}\right\vert{}_{I_2=0}$ : Impedancia de transferencia directa.
* $z_{22} = \left.\frac{V_2}{I_2}\right\vert{}_{I_1=0}$ : Impedancia de salida a circuito abierto.
* **Aplicación principal:** Simplificar el análisis cuando dos cuadripolos están conectados en **serie**.

---

### 2. Parámetros $Y$ (Admitancia de Cortocircuito)

Expresan las **corrientes de entrada y salida** en función de las **tensiones** de ambos puertos. Es la representación dual de los parámetros $Z$ ($\mathbf{Y} = \mathbf{Z}^{-1}$).

$$
\begin{bmatrix} I_1 \\ I_2 \end{bmatrix} = \begin{bmatrix} y_{11} & y_{12} \\ y_{21} & y_{22} \end{bmatrix} \begin{bmatrix} V_1 \\ V_2 \end{bmatrix}
$$

* **En qué consisten:** Cada coeficiente se calcula aplicando un **cortocircuito** en uno de los puertos ($V_1 = 0$ o $V_2 = 0$). Todos los elementos tienen unidades de admitancia ($S$ o $\Omega^{-1}$).
* $y_{11} = \left.\frac{I_1}{V_1}\right\vert{}_{V_2=0}$ : Admitancia de entrada en cortocircuito.
* $y_{12} = \left.\frac{I_1}{V_2}\right\vert{}_{V_1=0}$ : Admitancia de transferencia inversa.
* $y_{21} = \left.\frac{I_2}{V_1}\right\vert{}_{V_2=0}$ : Admitancia de transferencia directa.
* $y_{22} = \left.\frac{I_2}{V_2}\right\vert{}_{V_1=0}$ : Admitancia de salida en cortocircuito.
* **Aplicación principal:** Análisis de redes conectadas en **paralelo**.

---

### 3. Parámetros $H$ (Híbridos)

Mezclan tensiones y corrientes: expresan la **tensión de entrada ($V_1$)** y la **corriente de salida ($I_2$)** en función de la corriente de entrada ($I_1$) y la tensión de salida ($V_2$).

$$
\begin{bmatrix} V_1 \\ I_2 \end{bmatrix} = \begin{bmatrix} h_{11} & h_{12} \\ h_{21} & h_{22} \end{bmatrix} \begin{bmatrix} I_1 \\ V_2 \end{bmatrix}
$$

* **En qué consisten:** Combinan una prueba en cortocircuito en el puerto 2 ($V_2 = 0$) y una en circuito abierto en el puerto 1 ($I_1 = 0$). Sus coeficientes tienen unidades mixtas:
* $h_{11} = \left.\frac{V_1}{I_1}\right\vert{}_{V_2=0}$ : Impedancia de entrada ($\Omega$).
* $h_{12} = \left.\frac{V_1}{V_2}\right\vert{}_{I_1=0}$ : Ganancia de tensión inversa (adimensional).
* $h_{21} = \left.\frac{I_2}{I_1}\right\vert{}_{V_2=0}$ : Ganancia de corriente directa (adimensional).
* $h_{22} = \left.\frac{I_2}{V_2}\right\vert{}_{I_1=0}$ : Admitancia de salida ($S$).
* **Aplicación principal:** Modelado de transistores BJT y dispositivos semiconductores en pequeña señal.

---

### 4. Parámetros $T$ o $ABCD$ (Transmisión)

Relacionan las variables del **puerto de entrada ($V_1, I_1$)** directamente con las del **puerto de salida ($V_2, I_2$)**.

$$
\begin{bmatrix} V_1 \\ I_1 \end{bmatrix} = \begin{bmatrix} A & B \\ C & D \end{bmatrix} \begin{bmatrix} V_2 \\ -I_2 \end{bmatrix}
$$

* **En qué consisten:** Se evalúan combinando pruebas de circuito abierto ($I_2 = 0$) y cortocircuito ($V_2 = 0$) en la salida. Miden la capacidad de la red para transmitir una señal de entrada a la salida.
* $A = \left.\frac{V_1}{V_2}\right\vert{}_{I_2=0}$ : Atenuación/ganancia inversa de voltaje (adimensional).
* $B = \left.\frac{V_1}{-I_2}\right\vert{}_{V_2=0}$ : Impedancia de transferencia en cortocircuito ($\Omega$).
* $C = \left.\frac{I_1}{V_2}\right\vert{}_{I_2=0}$ : Admitancia de transferencia a circuito abierto ($S$).
* $D = \left.\frac{I_1}{-I_2}\right\vert{}_{V_2=0}$ : Ganancia inversa de corriente (adimensional).
* **Aplicación principal:** Análisis de redes en **cascada** mediante simple multiplicación matricial ($\mathbf{T}_{\text{total}} = \mathbf{T}_1 \cdot \mathbf{T}_2$).

---

### Resumen Comparativo

| Familia | Variable Dependiente | Variable Independiente | Condición de Medición | Dimensión Dominante |
| ---- | ---- | ---- | ---- | ---- |
| **$Z$** | $V_1, V_2$ | $I_1, I_2$ | Circuito abierto ($I=0$) | Impedancia ($\Omega$) |
| **$Y$** | $I_1, I_2$ | $V_1, V_2$ | Cortocircuito ($V=0$) | Admitancia ($S$) |
| **$H$** | $V_1, I_2$ | $I_1, V_2$ | Mixta ($V_2=0$, $I_1=0$) | Híbrida ($\Omega, S$, adim.) |
| **$T$ ($ABCD$)** | $V_1, I_1$ | $V_2, -I_2$ | Transmisión entrada $\rightarrow$ salida | Híbrida ($\Omega, S$, adim.) |

*(Nota: Existen dos variantes secundarias de uso específico: los parámetros $G$ o híbridos inversos y los parámetros $T'$ o de transmisión inversa).*
