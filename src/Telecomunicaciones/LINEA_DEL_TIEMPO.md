---
id: 21_linea_del_tiempo
name: linea_del_tiempo
title: "Línea del Tiempo - Era III (Digitalización y Telefonía Móvil Inicial)"
file_path: src/Telecomunicaciones/LINEA_DEL_TIEMPO.md
version: 1.0.0
category: guides
domain: Telecomunicaciones
tags: [telecomunicaciones, era-iii, linea-del-tiempo, cronologia, x25, isdn, rdsi, gsm, cdma, is-95, glosario, tarea-1]
description: "Línea del tiempo de la Era III (X.25, RDSI/ISDN y telefonía celular 1G/2G) con hitos fechados contrastados con fuentes externas y glosario de siglas."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-16T20:00:00Z
updated_at: 2026-09-16T20:00:00Z
dependencies: [00_agents_contract, 13_temario_telecomunicaciones, 20_tarea_1_era_tecnologica]
schema_version: 1.0.0
---

# LÍNEA DEL TIEMPO — ERA III: DIGITALIZACIÓN Y TELEFONÍA MÓVIL INICIAL

**Actividad:** Act1 — Eras Tecnológicas · **Caso de estudio:** X.25, RDSI (ISDN) y telefonía celular 1G/2G

**Base documental:** síntesis verificada en `src/Telecomunicaciones/TAREA_1_ERA_TECNOLOGICA.md` (tres fuentes bibliográficas), con contraste de fechas en fuentes externas (enciclopedias técnicas, consultadas el 16 de septiembre de 2026).

**Nota sobre las fechas:** los hitos se marcan como **✅** cuando el contraste externo confirmó el año y como **📚** cuando sólo constan en la libreta bibliográfica y requieren cotejo con el ejemplar impreso.

---

## 1. Glosario de siglas

| Sigla | Significado | Función en la Era III |
|:---|:---|:---|
| **1G / 2G / 3G** | Primera, segunda y tercera generación de telefonía móvil. | 1G analógica, 2G digital (GSM/CDMA) y 3G (UMTS). |
| **2B1Q** | *Two Binary, One Quaternary* (dos binarios, un cuaternario). | Código de línea de la interfaz U de la RDSI: 160 kbps sobre un par de cobre. |
| **AMPS** | *Advanced Mobile Phone System* (sistema telefónico móvil avanzado). | Primer estándar celular analógico de Estados Unidos (1G, modulación FM). |
| **ANSI** | *American National Standards Institute*. | Organismo estadounidense que normalizó la interfaz U de la RDSI. |
| **BRI** | *Basic Rate Interface* (interfaz de velocidad básica). | Acceso RDSI de abonado: 2 canales B de 64 kbps + 1 canal D de 16 kbps (2B+D). |
| **BSS** | *Base Station Subsystem* (subsistema de estaciones base). | Conjunto de estaciones base y su controlador en una red GSM. |
| **BTS** | *Base Transceiver Station* (estación base transceptora). | Antena y electrónica que dan cobertura a una celda. |
| **CCITT** | Comité Consultivo Internacional Telegráfico y Telefónico. | Antecesor del ITU-T; aprobó X.25 y las recomendaciones de la RDSI. |
| **CDMA** | *Code Division Multiple Access* (acceso múltiple por división de código). | Técnica de acceso de IS-95/2G: todos los usuarios comparten la misma banda mediante códigos. |
| **CEPT** | Conferencia Europea de Administraciones de Correos y Telecomunicaciones. | Creó en 1982 el grupo que originó el estándar GSM. |
| **DCS-1800** | *Digital Cellular System* en 1800 MHz. | Variante de GSM en la banda de 1800 MHz (1991). |
| **E1 / T1** | Jerarquías de transmisión digital de 2.048 Mbps (Europa) y 1.544 Mbps (EE. UU./Japón). | Soportan el acceso primario (PRI) de la RDSI: 30B+D y 23B+D. |
| **ETSI** | *European Telecommunications Standards Institute*. | Instituto europeo de normas; asumió el estándar GSM en 1989. |
| **FCC** | *Federal Communications Commission*. | Autoridad estadounidense que autorizó el servicio comercial AMPS. |
| **FM** | Modulación de frecuencia. | Modulación de la interfaz de radio de los sistemas 1G. |
| **GMSK** | *Gaussian Minimum Shift Keying* (desplazamiento mínimo gaussiano). | Modulación de la interfaz de radio de GSM. |
| **GSM** | *Global System for Mobile Communications* (originalmente *Groupe Spécial Mobile*). | Estándar europeo de telefonía celular digital de 2G. |
| **HDLC** | *High-level Data Link Control*. | Protocolo de enlace orientado a bit del que derivan las tramas de X.25 y del canal D. |
| **IPSS** | *International Packet Switched Service*. | Red internacional de datos X.25. |
| **IS-95** | *Interim Standard 95*. | Norma CDMA (Qualcomm, TIA); nombre comercial *cdmaOne*; 2G. |
| **RDSI / ISDN** | Red Digital de Servicios Integrados / *Integrated Services Digital Network*. | Estándar para integrar voz, datos y vídeo en una línea digital conmutada. |
| **ITU-T** | Sector de Normalización de las Telecomunicaciones de la UIT. | Nombre del CCITT desde la reforma de 1992. |
| **LAPB** | *Link Access Procedure, Balanced*. | Procedimiento de enlace equilibrado de X.25, derivado de HDLC (nombre adoptado en 1980). |
| **MoU** | *Memorandum of Understanding* (memorando de entendimiento). | Acuerdo de 1987 con el que 13 países europeos comprometieron el despliegue de GSM. |
| **NMT** | *Nordic Mobile Telephone* (telefonía móvil nórdica). | Primer sistema celular analógico automático de Europa (1G, 450/900 MHz). |
| **PCM** | *Pulse Code Modulation* (modulación por impulsos codificados). | Digitalización de voz a 64 kbps usada en los canales B de la RDSI. |
| **PCS** | *Personal Communications Services*. | Banda estadounidense de 1.9 GHz empleada por IS-95. |
| **PSTN** | *Public Switched Telephone Network* (red telefónica conmutada). | Red analógica de origen, limitada a 300–3400 Hz. |
| **RPE-LTP** | *Regular Pulse Excitation - Long Term Prediction*. | Vocoder de GSM que comprime la voz a 13 kbps. |
| **SIM** | *Subscriber Identity Module* (módulo de identidad del abonado). | Tarjeta inteligente que identifica al usuario de GSM. |
| **SMS** | *Short Message Service* (servicio de mensajes cortos). | Servicio de mensajería introducido por GSM. |
| **SS7** | *Signaling System No. 7* (sistema de señalización n.º 7). | Red de señalización de las centrales telefónicas, base de la movilidad de GSM. |
| **TACS** | *Total Access Communication System*. | Variante británica de AMPS (1G) adoptada en el Reino Unido y España (E-TACS). |
| **TDMA** | *Time Division Multiple Access* (acceso múltiple por división de tiempo). | Técnica de acceso de GSM: 8 usuarios por portadora de 200 kHz. |
| **TIA** | *Telecommunications Industry Association*. | Asociación estadounidense que publicó el estándar IS-95. |
| **UMTS** | *Universal Mobile Telecommunications System*. | Sistema de 3G (W-CDMA) desarrollado por el 3GPP. |
| **X.25** | Recomendación del CCITT/ITU-T. | Norma de interfaz para redes públicas de conmutación de paquetes con circuitos virtuales. |

---

## 2. Línea del tiempo

### 2.1 Bloque A — Antecedentes y conmutación de paquetes (1947–1980)

| Fecha | Hito | Verificación |
|:---|:---|:---:|
| **1947** | Bell Labs formula el concepto de red celular: dividir el territorio en celdas con reutilización de frecuencias. | 📚 |
| **Década de 1960** | Se formulan las bases teóricas de la conmutación de paquetes (Leonard Kleinrock, Paul Baran y Donald Davies). | 📚 |
| **1973** | Primera llamada desde un prototipo celular de mano (Martin Cooper, Motorola). | ✅ |
| **1976** | El CCITT aprueba la Recomendación **X.25** para redes públicas de conmutación de paquetes (publicada en el "libro naranja"). | ✅ |
| **1978** | Sistema de desarrollo **AMPS** de Bell Labs en Chicago: primera red celular de prueba (unos 100 equipos). | ✅ |
| **Finales de los años 70** | Entran en servicio las primeras redes públicas de datos X.25 (Datapac, Telenet, TRANSPAC, IPSS). | ✅ |
| **1980** | Revisión de X.25: la capa de enlace se alinea con HDLC y adopta el nombre **LAPB** (el servicio de datagramas se elimina en 1984). | ✅ |
| **1980** | Comienzan en Bell Labs los trabajos del estándar que dará lugar a la **RDSI**. | ✅ |

### 2.2 Bloque B — Telefonía móvil analógica 1G (1981–1986)

| Fecha | Hito | Verificación |
|:---|:---|:---:|
| **1 de septiembre de 1981** | Ericsson abre en Arabia Saudí el primer servicio comercial de **NMT** (piloto con 1.200 usuarios). | ✅ |
| **1 de octubre de 1981** | Apertura oficial del servicio **NMT** en Suecia y Noruega (Dinamarca y Finlandia en 1982). | ✅ |
| **Febrero de 1983** | El Reino Unido elige **TACS** (variante de AMPS) para sus dos primeras redes celulares nacionales. | ✅ |
| **13 de octubre de 1983** | Entrada en servicio comercial de **AMPS** en Estados Unidos (Chicago). | ✅ |
| **1985** | Lanzamiento comercial de las redes **TACS** británicas (Vodafone y Cellnet). | ✅ |
| **1986** | Entra en servicio **NMT-900**, con mayor número de canales que la banda de 450 MHz. | ✅ |

### 2.3 Bloque C — Digitalización: RDSI, GSM e IS-95 (1987–2000)

| Fecha | Hito | Verificación |
|:---|:---|:---:|
| **1987** | Quince representantes de trece países europeos firman en Copenhague el **memorando de entendimiento (MoU) de GSM**. | ✅ |
| **19 de abril de 1988** | El CCITT publica el primer conjunto de recomendaciones de la **RDSI** (libro rojo) y NTT ofrece servicios RDSI nacionales en Japón. | ✅ |
| **1988** | La CEPT crea la **ETSI**, que asume el desarrollo de las normas europeas de telecomunicaciones. | ✅ |
| **1989** | El grupo **GSM** pasa de la CEPT a la ETSI. | ✅ |
| **1990** | Se cierran las especificaciones del primer estándar **GSM-900** (DCS-1800 le sigue en 1991). | ✅ |
| **1 de julio de 1991** | Primera llamada **GSM** del mundo, en la red de Radiolinja (Finlandia), y arranque de las primeras redes comerciales. | ✅ |
| **1992** | Primeras redes europeas **GSM-900** en servicio y reforma de la UIT: el CCITT pasa a denominarse **ITU-T**. | ✅ |
| **Noviembre de 1992** | Llegan al mercado los primeros teléfonos **GSM** (Nokia 1011). | ✅ |
| **1993** | La TIA aprueba el estándar **IS-95** (**CDMA**, desarrollado por Qualcomm) para la banda celular de 900 MHz. | ✅ |
| **1995** | Primeras redes comerciales **cdmaOne / IS-95** (Hong Kong y Estados Unidos); GSM incorpora datos, fax y SMS comerciales y supera los 10 millones de suscriptores. | ✅ |
| **2000** | Las especificaciones de GSM pasan al **3GPP**, que inicia el desarrollo de la 3G (**UMTS**), cerrando la Era III. | ✅ |

---

## 3. Correcciones derivadas del contraste de fechas

| Dato del cuaderno y de la síntesis | Contraste externo | Ajuste recomendado |
|:---|:---|:---|
| "GSM fue fijado como estándar europeo por la ETSI en **1982**". | En 1982 la **CEPT** creó el grupo *Groupe Spécial Mobile*; la ETSI se creó en 1988 y asumió el grupo en 1989. | Escribir **1982** (creación del grupo en la CEPT) y **1989** (transferencia a la ETSI). |
| "GSM inició su despliegue comercial en **1990**". | Las especificaciones se cerraron en 1990; la primera llamada y las primeras redes comerciales datan de **1991**. | Sustituir por **1991** (despliegue) y **1992** (primeros teléfonos de mercado). |
| "ISDN estuvo comercialmente disponible a partir de **1990**". | La RDSI se estandarizó formalmente en **1988** y ese mismo año NTT ofreció servicio nacional en Japón. | Anticipar a **1988** y reservar los años 90 para la adopción masiva en Europa. |
| "CDMA (IS-95) se implementó a partir de **1993**". | El estándar se aprobó en 1993, pero las primeras redes comerciales son de **1995**. | Distinguir **1993** (norma) de **1995** (despliegue). |
| "NMT/TACS comenzó a utilizarse en **1982** en los países nórdicos". | El servicio **NMT** se abrió el **1 de octubre de 1981** en Suecia y Noruega. | Corregir a **1981**. |
| "**AMPS** (*American Mobile Phone System*)". | La expansión correcta del acrónimo es *Advanced Mobile Phone System*. | Corregir la sigla. |
| "X.25 aprobado en **marzo de 1976**". | La aprobación plenaria del CCITT se registra en **1976** (la referencia a marzo depende del acta de la fuente primaria). | Mantener **1976** y precisar el mes sólo con la fuente original. |

---

## 4. Referencias

**Fuentes bibliográficas de la libreta (APA 7):**

Clark, J. C., Villarreal, G., & Miralles, F. (2020). *Comunicaciones digitales*. Universitas.

Couch, L. W., II. (2008). *Sistemas de comunicación digitales y analógicos* (7.ª ed.; R. J. Romero Elizondo, Trad.). Pearson Educación.

Martín Pereda, J. A. (2022). *Historia de las telecomunicaciones*. Guadalmazán.

**Fuentes externas de contraste de fechas (obras de referencia terciarias, consultadas el 16 de septiembre de 2026):**

Wikipedia. (2026). *Advanced Mobile Phone System*. https://en.wikipedia.org/wiki/Advanced_Mobile_Phone_System

Wikipedia. (2026). *cdmaOne*. https://en.wikipedia.org/wiki/CdmaOne

Wikipedia. (2026). *GSM*. https://en.wikipedia.org/wiki/GSM

Wikipedia. (2026). *ISDN*. https://en.wikipedia.org/wiki/ISDN

Wikipedia. (2026). *ITU-T*. https://en.wikipedia.org/wiki/ITU-T

Wikipedia. (2026). *Nordic Mobile Telephone*. https://en.wikipedia.org/wiki/Nordic_Mobile_Telephone

Wikipedia. (2026). *Total Access Communication System*. https://en.wikipedia.org/wiki/Total_Access_Communication_System

Wikipedia. (2026). *X.25*. https://en.wikipedia.org/wiki/X.25

> Estas obras se emplearon únicamente para validar y corregir fechas; los datos técnicos del entregable provienen de las tres fuentes bibliográficas de la libreta, según se documenta en `TAREA_1_ERA_TECNOLOGICA.md` (Anexo A).
