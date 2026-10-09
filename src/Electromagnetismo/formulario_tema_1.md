---
id: 23_formulario_tema_1
name: formulario_tema_1
title: "Formulario: Ecuaciones de Maxwell y Propagación de Ondas Electromagnéticas"
file_path: src/Electromagnetismo/formulario_tema_1.md
version: 1.0.0
category: guides
domain: Electromagnetismo
tags: [electromagnetismo, maxwell, ondas, propagacion, polarizacion, poynting]
description: "Formulario de consulta para el Tema 1: ecuaciones de Maxwell, ondas planas, medios materiales, polarización y potencia."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-10-08T19:07:34-06:00
updated_at: 2026-10-08T19:33:28-06:00
dependencies: [00_agents_contract, 12_temario_electromagnetismo]
schema_version: 1.0.0
---
# Formulario — Tema 1: Ecuaciones de Maxwell y propagación de ondas electromagnéticas

> **Convención fasorial:** se usa $e^{j\omega t}$. Por tanto, una onda que se propaga en $+z$ lleva el factor espacial $e^{-\gamma z}$, con $\gamma=\alpha+j\beta$.
>
> **Lectura de unidades:** cada ecuación se acompaña de $[\text{magnitud física}]$, que indica la unidad SI del resultado. El radian y el neper son adimensionales, pero se conservan como $\text{rad}$ y $\text{Np}$ para identificar ángulo y atenuación.

## 1. Constantes, relaciones constitutivas y unidades


| Magnitud                             |        Símbolo |                                  Valor o relación |      Unidad SI |
| -------------------------------------- | ----------------: | ---------------------------------------------------: | ---------------: |
| Velocidad de la luz en vacío        |             $c$ |                                    $299\,792\,458$ |   $\text{m/s}$ |
| Permitividad del vacío              | $\varepsilon_0$ |                   $8.854\,187\,8128\times10^{-12}$ |   $\text{F/m}$ |
| Permeabilidad del vacío             |         $\mu_0$ |                     $1.256\,637\,062\times10^{-6}$ |   $\text{H/m}$ |
| Impedancia intrínseca del vacío    |        $\eta_0$ | $\sqrt{\mu_0/\varepsilon_0}\approx376.730\,\Omega$ |       $\Omega$ |
| Frecuencia angular                   |        $\omega$ |                                           $2\pi f$ | $\text{rad/s}$ |
| Longitud de onda                     |       $\lambda$ |                                 $v_p/f=2\pi/\beta$ |     $\text{m}$ |
| Densidad de carga libre              |        $\rho_v$ |                                                 — | $\text{C/m}^3$ |
| Densidad de corriente de conducción |     $\mathbf J$ |                                  $\sigma\mathbf E$ | $\text{A/m}^2$ |

Para un medio lineal, homogéneo e isótropo (LHI):

$$
\mathbf D=\varepsilon\mathbf E\quad[\text{C/m}^2],\qquad
\mathbf B=\mu\mathbf H\quad[\text{T}],\qquad
\mathbf J=\sigma\mathbf E\quad[\text{A/m}^2].
$$

$$
\varepsilon=\varepsilon_r\varepsilon_0\quad[\text{F/m}],\qquad
\mu=\mu_r\mu_0\quad[\text{H/m}],\qquad
\tan\delta=\frac{\sigma}{\omega\varepsilon}\quad[\text{adimensional}].
$$

### 1.1 Tangente de pérdidas

$$
\tan\delta=\frac{J_c}{J_d}=\frac{\sigma}{\omega\varepsilon}\qquad[\text{adimensional}].
$$

En donde:

- $\tan\delta$: tangente de pérdidas del medio [adimensional].
- $J_c=\sigma E$: densidad de corriente de conducción [$\text{A/m}^2$].
- $J_d=\omega\varepsilon E$: amplitud de la densidad de corriente de desplazamiento [$\text{A/m}^2$].
- $\sigma$: conductividad eléctrica [$\text{S/m}$].
- $\omega$: frecuencia angular [$\text{rad/s}$].
- $\varepsilon$: permitividad absoluta [$\text{F/m}$].

Un dieléctrico de bajas pérdidas cumple $\tan\delta\ll1$; un buen conductor cumple $\tan\delta\gg1$. Las expresiones de medios materiales son aproximaciones dependientes de frecuencia, temperatura y composición.

### 1.2 Símbolos que se repiten en las fórmulas

| Símbolo | Nombre | Unidad SI |
|---|---|---:|
| $\mathbf E$, $E_0$ | Campo eléctrico y amplitud fasorial | $\text{V/m}$ |
| $\mathbf H$, $H_0$ | Campo magnético y amplitud fasorial | $\text{A/m}$ |
| $\mathbf D$ | Densidad de flujo eléctrico | $\text{C/m}^2$ |
| $\mathbf B$ | Densidad de flujo magnético | $\text{T}=\text{Wb/m}^2$ |
| $\varepsilon$, $\mu$, $\sigma$ | Permitividad, permeabilidad y conductividad | $\text{F/m}$, $\text{H/m}$, $\text{S/m}$ |
| $\omega$, $f$, $t$ | Frecuencia angular, frecuencia y tiempo | $\text{rad/s}$, $\text{Hz}$, $\text{s}$ |
| $\gamma$, $\alpha$, $\beta$ | Constante de propagación, atenuación y fase | $\text{m}^{-1}$, $\text{Np/m}$, $\text{rad/m}$ |
| $\eta$ | Impedancia intrínseca | $\Omega$ |
| $v_p$, $\lambda$, $z$ | Velocidad de fase, longitud de onda y posición | $\text{m/s}$, $\text{m}$, $\text{m}$ |
| $\delta$, $R_s$ | Profundidad de piel y resistencia superficial | $\text{m}$, $\Omega/\square$ |

## 2. Contexto histórico y significado físico

- **Coulomb y Gauss:** relacionan la carga eléctrica con el flujo eléctrico; fundamentan la electrostática.
- **Ørsted, Ampère y Biot–Savart:** establecen que las corrientes producen campo magnético; fundamentan la magnetostática.
- **Faraday:** una variación del flujo magnético induce un campo eléctrico no conservativo.
- **Maxwell:** añadió la **corriente de desplazamiento** $\partial\mathbf D/\partial t$ a la ley de Ampère. Con ello obtuvo una velocidad de onda igual a $1/\sqrt{\mu_0\varepsilon_0}$ e identificó la luz como una onda electromagnética.

## 3. Ecuaciones de Maxwell

### 3.1 Forma integral


| Ley | Forma integral | Magnitud física resultante |
|---|---|---:|
| Gauss eléctrica | $\displaystyle\oint_S\mathbf D\cdot d\mathbf S=Q_{\mathrm{enc}}=\int_V\rho_v\,dV$ | $[\text{C}]$ |
| Gauss magnética | $\displaystyle\oint_S\mathbf B\cdot d\mathbf S=0$ | $[\text{Wb}]$ |
| Faraday | $\displaystyle\oint_C\mathbf E\cdot d\mathbf l=-\frac{d}{dt}\int_S\mathbf B\cdot d\mathbf S$ | $[\text{V}]$ |
| Ampère–Maxwell | $\displaystyle\oint_C\mathbf H\cdot d\mathbf l=\int_S\mathbf J\cdot d\mathbf S+\frac{d}{dt}\int_S\mathbf D\cdot d\mathbf S$ | $[\text{A}]$ |

### 3.2 Forma diferencial

$$
\boxed{\nabla\cdot\mathbf D=\rho_v}\quad[\text{C/m}^3]
\qquad
\boxed{\nabla\cdot\mathbf B=0}\quad[\text{T/m}].
$$

$$
\boxed{\nabla\times\mathbf E=-\frac{\partial\mathbf B}{\partial t}}\quad[\text{V/m}^2]
\qquad
\boxed{\nabla\times\mathbf H=\mathbf J+\frac{\partial\mathbf D}{\partial t}}\quad[\text{A/m}^2].
$$

La ecuación de continuidad expresa conservación de carga:

$$
\nabla\cdot\mathbf J=-\frac{\partial\rho_v}{\partial t}\quad[\text{A/m}^3].
$$

En régimen sinusoidal fasorial, para un medio LHI sin fuentes impresas:

$$
\nabla\times\mathbf E=-j\omega\mu\mathbf H\quad[\text{V/m}^2],
\qquad
\nabla\times\mathbf H=(\sigma+j\omega\varepsilon)\mathbf E\quad[\text{A/m}^2].
$$

**Aplicaciones directas:** Gauss eléctrica permite obtener $\mathbf E$ en geometrías con alta simetría; Gauss magnética impone la continuidad del flujo magnético; Faraday describe transformadores, generadores e inducción; Ampère–Maxwell permite calcular $\mathbf H$ alrededor de corrientes y explica la propagación de ondas y la corriente de desplazamiento en capacitores.

## 4. Ecuación de onda y onda plana uniforme

En una región homogénea libre de fuentes, al aplicar el rotacional a las ecuaciones de Maxwell:

$$
\nabla^2\mathbf E-\mu\sigma\frac{\partial\mathbf E}{\partial t}
-\mu\varepsilon\frac{\partial^2\mathbf E}{\partial t^2}=0\quad[\text{V/m}^3].
$$

$$
\nabla^2\mathbf H-\mu\sigma\frac{\partial\mathbf H}{\partial t}
-\mu\varepsilon\frac{\partial^2\mathbf H}{\partial t^2}=0\quad[\text{A/m}^3].
$$

La forma fasorial correspondiente es la ecuación de Helmholtz:

$$
\nabla^2\mathbf E-\gamma^2\mathbf E=0\quad[\text{V/m}^3],
\qquad
\nabla^2\mathbf H-\gamma^2\mathbf H=0\quad[\text{A/m}^3].
$$

Para una onda plana uniforme (OPU) que viaja en $+z$:

$$
\mathbf E(z)=\hat{\mathbf x}E_0e^{-\gamma z}\quad[\text{V/m}],
\qquad
\mathbf H(z)=\hat{\mathbf y}\frac{E_0}{\eta}e^{-\gamma z}\quad[\text{A/m}].
$$

$$
\gamma=\alpha+j\beta=\sqrt{j\omega\mu(\sigma+j\omega\varepsilon)}\quad[\text{m}^{-1}],
\qquad
\eta=\sqrt{\frac{j\omega\mu}{\sigma+j\omega\varepsilon}}\quad[\Omega].
$$

En donde $E_0$ y $\mathbf E(z)$ son campos eléctricos, $H_0$ y $\mathbf H(z)$ son campos magnéticos, $z$ es la distancia de propagación y $\gamma z$ es adimensional.

Las componentes transversalmente orientadas cumplen:

$$
\mathbf E\perp\mathbf H\perp\hat{\mathbf z},
\qquad
\mathbf E\times\mathbf H\quad[\text{W/m}^2]\ \text{apunta en la dirección de propagación}.
$$

Parámetros de propagación:

$$
\alpha\quad[\text{Np/m}],\qquad
\beta\quad[\text{rad/m}],\qquad
v_p=\frac{\omega}{\beta}\quad[\text{m/s}],\qquad
\lambda=\frac{2\pi}{\beta}\quad[\text{m}].
$$

En donde $\alpha$ es la constante de atenuación, $\beta$ es la constante de fase, $v_p$ es la velocidad de fase y $\lambda$ es la longitud de onda.

La amplitud de campo decae como $e^{-\alpha z}$ y la potencia promedio como $e^{-2\alpha z}$. La conversión práctica es:

$$
\alpha_{\mathrm{dB/m}}=8.686\,\alpha_{\mathrm{Np/m}}\quad[\text{dB/m}].
$$

## 5. Propagación en cuatro medios fundamentales

### 5.1 Resumen comparativo de parámetros


| Caso | Condición | Constante de propagación $\gamma$ $[\text{m}^{-1}]$ | Impedancia intrínseca $\eta$ $[\Omega]$ |
|---|---|---|---|
| Dieléctrico disipativo    | $\sigma>0$                                           | $\sqrt{j\omega\mu(\sigma+j\omega\varepsilon)}$ | $\sqrt{j\omega\mu/(\sigma+j\omega\varepsilon)}$ |
| Dieléctrico sin pérdidas | $\sigma=0$                                           | $j\omega\sqrt{\mu\varepsilon}$                 | $\sqrt{\mu/\varepsilon}$                        |
| Espacio libre              | $\sigma=0$, $\varepsilon=\varepsilon_0$, $\mu=\mu_0$ | $j\omega\sqrt{\mu_0\varepsilon_0}=j\omega/c$   | $\eta_0$                                        |
| Buen conductor             | $\sigma\gg\omega\varepsilon$                         | $(1+j)\sqrt{\omega\mu\sigma/2}$                | $(1+j)\sqrt{\omega\mu/(2\sigma)}$               |

### 5.2 Dieléctrico disipativo

Este caso modela medios con pérdidas por conducción, como suelo húmedo, agua o dieléctricos reales. Las expresiones generales para atenuación y fase son:

$$
\alpha=\omega\sqrt{\frac{\mu\varepsilon}{2}}
\left[\sqrt{1+\left(\frac{\sigma}{\omega\varepsilon}\right)^2}-1\right]^{1/2}\quad[\text{Np/m}].
$$

$$
\beta=\omega\sqrt{\frac{\mu\varepsilon}{2}}
\left[\sqrt{1+\left(\frac{\sigma}{\omega\varepsilon}\right)^2}+1\right]^{1/2}\quad[\text{rad/m}].
$$

En donde $\sigma/(\omega\varepsilon)=\tan\delta$ es el factor de pérdidas adimensional del medio.

Para un **buen dieléctrico** o medio de bajas pérdidas, $\sigma\ll\omega\varepsilon$ y $\tan\delta\ll1$:

$$
\alpha\approx\frac{\sigma}{2}\sqrt{\frac{\mu}{\varepsilon}}\quad[\text{Np/m}],
\qquad
\beta\approx\omega\sqrt{\mu\varepsilon}\quad[\text{rad/m}],
\qquad
\eta\approx\sqrt{\frac{\mu}{\varepsilon}}\left(1+j\frac{\tan\delta}{2}\right)\quad[\Omega].
$$

### 5.3 Dieléctrico sin pérdidas

No existe corriente de conducción y no hay atenuación por el medio:

$$
\sigma=0\quad[\text{S/m}],\qquad \alpha=0\quad[\text{Np/m}],\qquad \beta=\omega\sqrt{\mu\varepsilon}\quad[\text{rad/m}].
$$

$$
\eta=\sqrt{\frac{\mu}{\varepsilon}}\quad[\Omega],
\qquad
v_p=\frac{1}{\sqrt{\mu\varepsilon}}\quad[\text{m/s}],
\qquad
\lambda=\frac{2\pi}{\omega\sqrt{\mu\varepsilon}}\quad[\text{m}].
$$

Si el material no es magnético ($\mu_r\approx1$):

$$
v_p\approx\frac{c}{\sqrt{\varepsilon_r}}\quad[\text{m/s}],
\qquad
\eta\approx\frac{\eta_0}{\sqrt{\varepsilon_r}}\quad[\Omega].
$$

### 5.4 Espacio libre

El espacio libre es un dieléctrico ideal con parámetros fundamentales:

$$
\alpha=0\quad[\text{Np/m}],
\qquad
\beta=\omega\sqrt{\mu_0\varepsilon_0}=\frac{\omega}{c}=\frac{2\pi}{\lambda}\quad[\text{rad/m}].
$$

$$
v_p=c\quad[\text{m/s}],
\qquad
\eta_0=\sqrt{\frac{\mu_0}{\varepsilon_0}}\approx376.730\,\Omega\quad[\Omega],
\qquad
\lambda=\frac{c}{f}\quad[\text{m}].
$$

En aire seco a condiciones normales suele usarse $\varepsilon_r\approx1.0006$, $\mu_r\approx1$ y $\sigma\approx0$ como aproximación de espacio libre.

### 5.5 Buenos conductores

Un buen conductor satisface $\sigma\gg\omega\varepsilon$. En él, campo y potencia penetran sólo una distancia pequeña:

$$
\alpha\approx\beta\approx\sqrt{\frac{\omega\mu\sigma}{2}}
=\sqrt{\pi f\mu\sigma}\quad[\text{m}^{-1}].
$$

$$
\gamma\approx(1+j)\sqrt{\frac{\omega\mu\sigma}{2}}\quad[\text{m}^{-1}],
\qquad
\eta\approx(1+j)\sqrt{\frac{\omega\mu}{2\sigma}}\quad[\Omega].
$$

La profundidad de penetración o profundidad de piel es:

$$
\delta=\frac{1}{\alpha}=\sqrt{\frac{2}{\omega\mu\sigma}}
=\frac{1}{\sqrt{\pi f\mu\sigma}}\quad[\text{m}].
$$

En donde $\delta$ es la profundidad de piel: la distancia a la que la amplitud del campo cae al factor $e^{-1}$.

La corriente se concentra aproximadamente en una capa de espesor $\delta$ desde la superficie. La resistencia superficial es:

$$
R_s\approx\sqrt{\frac{\omega\mu}{2\sigma}}=\frac{1}{\sigma\delta}\quad[\Omega/\square].
$$

## 6. Valores típicos de $\varepsilon$, $\mu$ y $\sigma$

Los siguientes valores son de referencia; para diseño deben sustituirse por datos del material a la frecuencia y temperatura de operación.


| Caso y ejemplo representativo                                            |                                                                 $\varepsilon$ |                                   $\mu$ |                                            $\sigma$ |
| -------------------------------------------------------------------------- | ------------------------------------------------------------------------------: | ----------------------------------------: | ----------------------------------------------------: |
| Dieléctrico disipativo: agua dulce a radiofrecuencia, valor ilustrativo |  $\varepsilon_r\approx80$, $\varepsilon\approx7.08\times10^{-10}\,\text{F/m}$ |      $\mu_r\approx1$, $\mu\approx\mu_0$ |                        $\approx10^{-2}\,\text{S/m}$ |
| Dieléctrico sin pérdidas ideal: PTFE aproximado                        | $\varepsilon_r\approx2.1$, $\varepsilon\approx1.86\times10^{-11}\,\text{F/m}$ |      $\mu_r\approx1$, $\mu\approx\mu_0$ | $0\,\text{S/m}$ ideal; muy pequeña en la práctica |
| Espacio libre                                                            |                               $\varepsilon_0=8.854\times10^{-12}\,\text{F/m}$ | $\mu_0=1.2566\times10^{-6}\,\text{H/m}$ |                                     $0\,\text{S/m}$ |
| Buen conductor: cobre recocido                                           |                      $\varepsilon\approx\varepsilon_0$ en el modelo conductor |      $\mu_r\approx1$, $\mu\approx\mu_0$ |                         $5.8\times10^7\,\text{S/m}$ |

## 7. Polarización

Para propagación en $+z$, con componentes transversales:

$$
\mathbf E(z)=\left(\hat{\mathbf x}E_{0x}+\hat{\mathbf y}E_{0y}e^{j\delta}\right)e^{-\gamma z}\quad[\text{V/m}].
$$

En donde $E_{0x}$ y $E_{0y}$ son las amplitudes ortogonales del campo eléctrico, y $\delta$ es la diferencia de fase [rad].


| Tipo      | Condición                                                                         |
| ----------- | ------------------------------------------------------------------------------------ |
| Lineal | $\delta=0$ o $\pi$ [rad], o una componente es cero. |
| Circular | $|E_{0x}|=|E_{0y}|$ [$\text{V/m}$] y $\delta=\pm\pi/2$ [rad]. |
| Elíptica | Caso general: amplitudes distintas [$\text{V/m}$] y/o desfase distinto de $0$, $\pi$ y $\pm\pi/2$ [rad]. |

El sentido de giro debe especificarse junto con la convención temporal y la dirección de observación; así se evita ambigüedad entre las definiciones de polarización circular derecha e izquierda.

## 8. Potencia y vector de Poynting

El vector de Poynting instantáneo es la densidad de flujo de potencia:

$$
\mathbf S(t)=\mathbf E(t)\times\mathbf H(t)\quad[\text{W/m}^2].
$$

Para fasores de amplitud pico, el Poynting complejo y su parte promedio son:

$$
\mathbf S_c=\frac{1}{2}\mathbf E\times\mathbf H^*\quad[\text{VA/m}^2],
\qquad
\langle\mathbf S\rangle=\operatorname{Re}\left\{\mathbf S_c\right\}\quad[\text{W/m}^2].
$$

En donde $\mathbf H^*$ es el conjugado complejo de $\mathbf H$ y $\mathbf S_c$ separa potencia activa y reactiva.

En una OPU sin pérdidas, con $\eta$ real:

$$
\langle S\rangle=\frac{|E_0|^2}{2\eta}
=\frac{\eta|H_0|^2}{2}\quad[\text{W/m}^2].
$$

En un medio con pérdidas, para la onda que viaja en $+z$:

$$
\langle\mathbf S(z)\rangle
=\hat{\mathbf z}\,\frac{|E_0|^2}{2}\operatorname{Re}\left\{\frac{1}{\eta}\right\}e^{-2\alpha z}\quad[\text{W/m}^2].
$$

La potencia que atraviesa una superficie $S$ es:

$$
P=\iint_S\langle\mathbf S\rangle\cdot d\mathbf S\quad[\text{W}].
$$

## 9. Relaciones de consulta rápida

$$
\boxed{\gamma=\sqrt{j\omega\mu(\sigma+j\omega\varepsilon)}}\quad[\text{m}^{-1}]
\qquad
\boxed{\eta=\sqrt{\frac{j\omega\mu}{\sigma+j\omega\varepsilon}}}\quad[\Omega].
$$

$$
\boxed{\mathbf E=\eta\,\mathbf H\times\hat{\mathbf k}}\quad[\text{V/m}]
\qquad
\boxed{\mathbf H=\frac{1}{\eta}\hat{\mathbf k}\times\mathbf E}\quad[\text{A/m}].
$$

$$
\boxed{\lambda=\frac{v_p}{f}=\frac{2\pi}{\beta}}\quad[\text{m}]
\qquad
\boxed{v_p=\frac{\omega}{\beta}}\quad[\text{m/s}]
\qquad
\boxed{\delta=\frac{1}{\alpha}\ \text{(buen conductor)}}\quad[\text{m}].
$$
