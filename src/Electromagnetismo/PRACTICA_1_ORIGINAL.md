---
id: 16_practica_1_original
name: practica_1_original
title: "Práctica 1 Original: Propagación de Ondas Electromagnéticas en la Atmósfera"
file_path: src/Electromagnetismo/PRACTICA_1_ORIGINAL.md
version: 1.0.0
category: guides
domain: Electromagnetismo
tags: [electromagnetismo, practica-1, guia-original, vhf, uhf, arduino, rf-433mhz]
description: "Guía original institucional de la Práctica 1 de Teoría Electromagnética para el enlace punto a punto de radiofrecuencia a 433 MHz con Arduino."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T23:00:00Z
updated_at: 2026-09-03T22:00:00Z
dependencies: [00_agents_contract, 12_temario_electromagnetismo]
schema_version: 1.0.0
---

# INGENIERÍA ELECTRÓNICA

## TEORÍA ELECTROMAGNÉTICA

### PRÁCTICA 1: PROPAGACIÓN DE ONDAS ELECTROMAGNÉTICAS EN LA ATMÓSFERA

#### **Objetivo de la práctica:**

Entender el fenómeno de propagación de ondas electromagnéticas en el rango de VHF, por medio de un enlace inalámbrico.

---

#### **Procedimiento:**

Para llevar a cabo esta práctica será necesario contar con:

* 1 sistema embebido Arduino, un transmisor FS1000A y un receptor XY-MK-5V (los dos últimos también conocidos como transmisor y receptor de 433 MHz).

* 1 flexómetro de 3 ó 5 metros.

Considerando que la tarjeta Arduino sólo puede controlar a uno de los módulos, será necesario que el módulo transmisor se conecte a un Arduino y el receptor a otro, para conseguir de esta manera la comunicación bidireccional.

* **Pines del módulo transmisor (FS1000A):** `DATA` (Datos), `VCC`, `GND` y `ANT` (Antena).

* **Pines del módulo receptor (XY-MK-5V):** `ANT` (Antena), `VCC`, `DATA` (Datos) y `GND`.

> *Nota del documento:* Para la realización de esta práctica no será necesario agregar ninguna antena.

* **Conexión Arduino – Transmisor:**
* Pin Digital 12 $\rightarrow$ Pin DATA del transmisor

* 5V $\rightarrow$ VCC

* GND $\rightarrow$ GND

* **Conexión Arduino – Receptor:**
* Pin Digital 11 $\rightarrow$ Pin DATA del receptor

* 5V $\rightarrow$ VCC

* GND $\rightarrow$ GND

---

### Código del Programa (Original del documento)

Para conseguir que ambas tarjetas funcionen en la forma adecuada, será necesario cargar los programas mostrados a continuación. Para que ambos programas funcionen correctamente, deberá cargar la librería **"Radio Head"**.

#### 1. Programación del módulo transmisor

```cpp
// Incluir librerías
// RadioHead ASK
// SPI
#include <RH_ASK.h>
#include <SPI.h>

// Crear un objeto de la clase ASK
RH_ASK askTx;

void setup()
{
  // Inicializar objeto
  askTx.init();
}

void loop()
{
  // Mensaje a enviar
  // Longitud: 10
  // No superar los 27 caracteres
  const char *msg = "Nombres o apellidos de los integrantes del equipo";

  // Envió información
  askTx.send((uint8_t *)msg, strlen(msg));

  // Esperar a que sea enviado el paquete
  askTx.waitPacketSent();

  // Esperamos 1 segundo antes de volver a enviar
  delay(1000);
}
```
(Referencia al pie de página: Tutorial RF 433 MHz con Arduino. Vista el viernes 29 de agosto de 2025).

---

#### 2. Programación del módulo receptor

```cpp
// Incluir librerías
// RadioHead ASK
// SPI
#include <RH_ASK.h>
#include <SPI.h>

// Indicar tamaño del mensaje que se va a recibir
const byte tamMsg = 10;

// Crear un objeto de la clase ASK
RH_ASK askRx;

void setup()
{
  // Iniciar monitor serie
  Serial.begin(9600);

  // Inicializar objeto ASK
  askRx.init();
}

void loop()
{
  // Tamaño esperado del mensaje
  uint8_t msg[tamMsg];
  uint8_t msgLen = sizeof(msg);

  // Comprobar si el mensaje recibido tiene el tamaño adecuado
  if (askRx.recv(msg, &msgLen))
  {
    // Mostrar mensaje por el monitor serie
    Serial.print("Mensaje recibido: ");
    Serial.println((char*)msg);
  }
}
```
(Referencia al pie de página: Tutorial RF 433 MHz con Arduino. Vista el viernes 29 de agosto de 2025).

---

#### **Desarrollo de la práctica:**

Una vez que ha cargado los respectivos programas en cada sistema formado por una tarjeta Arduino con el respectivo transmisor o receptor, deberá establecer el enlace entre ambos elementos.

Cada equipo deberá agruparse con otro, y serán identificados como: **Equipo A** y **Equipo B**.

1. Ambos módulos Arduino con su respectivo transmisor o receptor, deberán ser colocados uno junto al otro. El equipo A que tendrá el transmisor deberá iniciar el envío del mensaje. El equipo B, que tendrá el receptor deberá asegurarse que está recibiendo el mensaje correcto (por medio de la ventana serie en el IDE). La evidencia de la recepción deberá ser por medio de fotografías de la ventana serie.

2. A continuación, deberán intercambiarse los roles de ambos equipos: El equipo A deberá ser receptor y abrir la ventana serie y el equipo B deberá transmitir, nuevamente, la evidencia de la recepción deberá ser por medio de fotografías de la ventana serie.

3. El siguiente paso consistirá en separar ambos módulos, hasta que la comunicación se pierda; cada equipo deberá tener la función de transmisor en la primera parte y de receptor, posteriormente y viceversa. En ambos casos deberán medir la distancia entre ambos módulos y registrarla posteriormente en el reporte.