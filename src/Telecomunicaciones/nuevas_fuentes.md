---
id: 22_nuevas_fuentes
name: nuevas_fuentes
title: "Nuevas Fuentes - Contraste de Fechas e Imágenes de la Línea del Tiempo (Era III)"
file_path: src/Telecomunicaciones/nuevas_fuentes.md
version: 1.1.0
category: guides
domain: Telecomunicaciones
tags: [telecomunicaciones, era-iii, fuentes, contraste-de-fechas, conmutacion-de-paquetes, x25, datapac, telenet, transpac, ipss, wikimedia-commons, licencias, imagenes, alta-definicion, tarea-1]
description: "Fuentes externas consultadas para el contraste de fechas de la Era III y catálogo de las 30 imágenes de Wikimedia Commons empleadas en el CSV, con autoría, licencia, resolución y referencias en APA 7."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-19T16:00:00Z
updated_at: 2026-09-19T18:30:00Z
dependencies: [00_agents_contract, 21_linea_del_tiempo]
related_specs: [20_tarea_1_era_tecnologica]
schema_version: 1.0.0
---

# NUEVAS FUENTES — CONTRASTE DE FECHAS E IMÁGENES (ERA III)

**Documento asociado:** [`src/Telecomunicaciones/LINEA_DEL_TIEMPO.md`](file:///G:/REPOSITORIOS%20GITHUB/RECURSOS/src/Telecomunicaciones/LINEA_DEL_TIEMPO.md) (línea del tiempo) y [`src/Telecomunicaciones/linea_del_tiempo_tema_1.csv`](file:///G:/REPOSITORIOS%20GITHUB/RECURSOS/src/Telecomunicaciones/linea_del_tiempo_tema_1.csv) (formato de hoja de cálculo TimelineJS).

**Alcance de esta investigación:** los dos hitos de la tabla 2.1 de la línea del tiempo que no tenían fecha exacta ("Década de 1960" y "Finales de los años 70") se desdoblan en siete hitos con fechas verificables, y se precisa el mes de aprobación de la Recomendación X.25. La tabla original del documento de línea del tiempo **se conserva intacta**; el refinamiento se aplica únicamente en el CSV y se documenta aquí.

**Fuentes consultadas el 19 de septiembre de 2026** (obras de referencia terciarias), con verificación cruzada de las fuentes primarias y secundarias que cada obra cita.

---

## 1. Método de contraste

1. Se localizaron los dos hitos sin fecha exacta en la tabla 2.1 del documento de línea del tiempo.
2. Se consultaron obras de referencia terciarias y se identificaron, dentro de cada una, las fuentes primarias o secundarias disponibles (informes técnicos, tesis, artículos de revista y recomendaciones de la UIT).
3. Se adoptaron como fecha del hito la de la **primera publicación o entrada en servicio documentada**, y se rechazaron las fechas declaradas únicamente por fuentes divulgativas sin respaldo.
4. Los datos técnicos de la línea del tiempo siguen proviniendo de las tres fuentes bibliográficas de la libreta; estas fuentes externas solo se emplearon para fijar fechas.

---

## 2. Hitos refinados — Bloque A (antecedentes y conmutación de paquetes)

### 2.1 De "Década de 1960" a tres hitos fechados

| Hito refinado | Fecha adoptada | Detalle documentado | Fuente |
|:---|:---|:---|:---|
| Baran propone la red distribuida en la RAND | **1960** (serie 1960–1964) | Informe *P-1995: Reliable Digital Communications Systems Using Unreliable Network Repeater Nodes* (1960); *P-2626: On Distributed Communications Networks* (1962); serie completa *On Distributed Communications* (1964), con la división del mensaje en "bloques" enviados por rutas independientes. | Wikipedia (Paul Baran), con referencias a los documentos de la RAND |
| Kleinrock modela los retardos de los mensajes | **1961** | Propuesta de tesis *Information Flow in Large Communication Nets* (MIT, mayo de 1961; informe trimestral RLE de julio de 1961); tesis doctoral *Message Delay in Communication Nets with Storage* (diciembre de 1962), publicada como libro en 1964. | Wikipedia (Leonard Kleinrock), con el listado de obras del propio autor |
| Davies formula la conmutación de paquetes en el NPL | **1965** (serie 1965–1966) | Interés por las comunicaciones de datos tras el congreso IFIP de 1965; primer artículo con la idea de la conmutación de paquetes (1965); *Proposal for a Development of a National Communications Service for On-line Data Processing* (1966); memorando *A Protocol for Use in the NPL Data Communications Network* (abril de 1967); red local del NPL en servicio a comienzos de 1969 y Mark I plenamente operativa en enero de 1970. | Wikipedia (Donald Davies), con referencias a Campbell-Kelly (1987), Davies (1966) y Scantlebury y Wilkinson (2001) |

### 2.2 De "Finales de los años 70" a cuatro redes fechadas

| Red | Fecha adoptada | Detalle documentado | Fuente |
|:---|:---|:---|:---|
| **Telenet** (Estados Unidos) | **16 de agosto de 1975** | Primera red pública de datos con licencia de la FCC; en servicio con nodos en siete ciudades; adoptó X.25 tras la publicación del estándar en marzo de 1976, con la primera interfaz de host X.25 de la industria. | Wikipedia (Telenet), con referencias a Mathison (1975) y Mathison, Roberts y Walker (2012) |
| **DATAPAC** (Canadá) | **Marzo de 1976** (apertura en 1976) | Anunciada en marzo de 1976 sobre la red Dataroute de Bell Canada y abierta ese mismo año como primera red pública de datos diseñada específicamente para X.25. | Wikipedia (DATAPAC), con referencias a Rybczynski (2009) y Erskine (1977) |
| **TRANSPAC** (Francia) | **Diciembre de 1978** | Apertura del servicio por la sociedad Transpac, con interfaz X.25 conforme al estándar del CCITT de 1976; en 1987 era la mayor red pública de conmutación de paquetes del mundo. | Wikipedia (Transpac), con referencia a Després (2010) |
| **IPSS** (Reino Unido) | **1978** | Primera red internacional y comercial de conmutación de paquetes, creada por la colaboración entre Post Office Telecommunications, Western Union International y Tymnet. | Wikipedia (International Packet Switched Service) |

---

## 3. Otras precisiones derivadas del contraste

| Dato del documento de línea del tiempo | Precisión documentada | Fuente |
|:---|:---|:---|
| "El CCITT aprueba la Recomendación X.25 [...]; la referencia a marzo depende del acta de la fuente primaria". | El documento *Draft Recommendation X-25* del Grupo de Estudio VII está fechado en **marzo de 1976**, mientras que la aprobación unánime de la Recomendación se produjo en la **asamblea plenaria del CCITT de septiembre de 1976**, junto con otras diez recomendaciones del mismo grupo de estudio, y se publicó en el "libro naranja". | Wikipedia (X.25), con referencia a CCITT, Study Group VII, *Draft Recommendation X-25*, marzo de 1976, y a Sirbu y Zwimpfer (1985) |

---

## 4. Fuentes de las imágenes (Wikimedia Commons)

Todas las imágenes del CSV son archivos alojados en Wikimedia Commons, con enlace directo y metadatos obtenidos de la API pública del repositorio el 19 de septiembre de 2026. La atribución se consigna en la columna `Media Credit` y la descripción en `Media Caption`, visibles en la ficha de cada diapositiva.

**Criterio de calidad:** se exigió que cada archivo superase los 1000 píxeles en su lado mayor y se prefirieron los de más de 2000 píxeles. Cuando no existe fotografía histórica en alta resolución de un hito, se eligió una imagen **reciente de la misma tecnología** (antenas, terminales o equipamiento), indicándolo así en el pie de la diapositiva.

**Régimen de licencias:** tres archivos son de dominio público y dos se publican bajo CC0 (renuncia de derechos); el resto emplea licencias Creative Commons CC BY o CC BY-SA, que obligan a citar la autoría y la licencia, requisito que ya se cumple en la columna `Media Credit` de cada fila.

| Diapositiva del CSV | Archivo en Commons | Autoría | Licencia | Resolución | Enlace directo |
|:---|:---|:---|:---|:---|:---|
| Bell Labs formula el concepto de red celular (1947) | `Bell_Labs_Holmdel.jpg` | MBisanz (obra derivada) | CC BY-SA 2.0 | 3008x2000 | https://upload.wikimedia.org/wikipedia/commons/c/c1/Bell_Labs_Holmdel.jpg |
| Baran diseña una red distribuida en la RAND (1960) | `Rand_Corporation_Headquarters,_Santa_Monica.jpg` | Cbl62 | CC BY-SA 3.0 | 2448x3264 | https://upload.wikimedia.org/wikipedia/commons/3/34/Rand_Corporation_Headquarters%2C_Santa_Monica.jpg |
| Kleinrock modela el retardo de los mensajes (1961) | `Internet_Hall_of_Fame_inductees_2012.JPG` | Brewster Kahle | Dominio público | 4288x3216 | https://upload.wikimedia.org/wikipedia/commons/f/f1/Internet_Hall_of_Fame_inductees_2012.JPG |
| Davies formula la conmutación de paquetes en el NPL (1965) | `NPL_Teddington_brick_building.JPG` | Jonathan Cardy (WMUK) | CC BY-SA 3.0 | 4896x3672 | https://upload.wikimedia.org/wikipedia/commons/f/f7/NPL_Teddington_brick_building.JPG |
| Primera llamada desde un teléfono celular de mano (1973) | `2007Computex_e21Forum-MartinCooper.jpg` | Rico Shen | CC BY-SA 3.0 | 2304x3072 | https://upload.wikimedia.org/wikipedia/commons/1/1f/2007Computex_e21Forum-MartinCooper.jpg |
| Telenet entra en servicio en Estados Unidos (1975) | `BBN_IMP_connected_computers_to_Arpanet_(7995221220).jpg` | Don DeBold | CC BY 2.0 | 4000x3000 | https://upload.wikimedia.org/wikipedia/commons/8/8f/BBN_IMP_connected_computers_to_Arpanet_%287995221220%29.jpg |
| DATAPAC, primera red pública diseñada para X.25 (1976) | `CCITT_SGVII_X25_Advocates.jpg` | Tony Rybczynski | CC BY-SA 4.0 | 1193x658 | https://upload.wikimedia.org/wikipedia/commons/e/e5/CCITT_SGVII_X25_Advocates.jpg |
| El CCITT aprueba la Recomendación X.25 (1976) | `Televideo925Terminal.jpg` | Wikimedia Commons | Dominio público | 1145x949 | https://upload.wikimedia.org/wikipedia/commons/8/87/Televideo925Terminal.jpg |
| Prueba de AMPS en Chicago (1978) | `Bosch_CarTel_Autotelefon_1980.jpg` | RudolfSimon | CC BY-SA 4.0 | 3024x4032 | https://upload.wikimedia.org/wikipedia/commons/7/7f/Bosch_CarTel_Autotelefon_1980.jpg |
| Nace la IPSS (1978) | `BT_Tower_in_London_2014.jpg` | James Kevin McMahon | CC BY-SA 4.0 | 1152x2048 | https://upload.wikimedia.org/wikipedia/commons/b/b5/BT_Tower_in_London_2014.jpg |
| TRANSPAC abre servicio en Francia (1978) | `Minitel_B1_terminal_1986_02.JPG` | Philafrenzy | CC BY-SA 4.0 | 4000x3000 | https://upload.wikimedia.org/wikipedia/commons/e/e1/Minitel_B1_terminal_1986_02.JPG |
| X.25 revisa su capa de enlace con LAPB (1980) | `Siemens-DAG-64_front.jpg` | Wikimedia Commons | Uso libre con copyright | 1424x706 | https://upload.wikimedia.org/wikipedia/commons/6/64/Siemens-DAG-64_front.jpg |
| Bell Labs inicia los trabajos de la RDSI (1980) | `20200302_ZyXEL_Prestige_100_front.JPG` | Fod | CC BY 2.5 dk | 3264x2448 | https://upload.wikimedia.org/wikipedia/commons/6/61/20200302_ZyXEL_Prestige_100_front.JPG |
| Primer servicio comercial de NMT en Arabia Saudí (1981) | `Mobira_Cityman_450_02.jpg` | Jamshid Nurkulov | CC BY 4.0 | 4284x5712 | https://upload.wikimedia.org/wikipedia/commons/a/a3/Mobira_Cityman_450_02.jpg |
| NMT se abre en Suecia y Noruega (1981) | `Nokia_Talkman_(front).jpg` | krystof.k / nmuseum | CC BY-SA 3.0 | 1080x1920 | https://upload.wikimedia.org/wikipedia/commons/d/d2/Nokia_Talkman_%28front%29.jpg |
| El Reino Unido elige TACS (1983) | `Mobile_phone_mast,_Kingstanding_Circle_-_2023-04-06_-_Andy_Mabbett.jpg` | Andy Mabbett | CC BY-SA 4.0 | 2297x3063 | https://upload.wikimedia.org/wikipedia/commons/4/4c/Mobile_phone_mast%2C_Kingstanding_Circle_-_2023-04-06_-_Andy_Mabbett.jpg |
| AMPS entra en servicio comercial (1983) | `Alcobendas_-_Museo_Nacional_de_Ciencia_y_Tecnología_(MUNCYT),_teléfono_móvil_Motorola_(1985).jpg` | Zarateman | CC0 | 1398x1824 | https://upload.wikimedia.org/wikipedia/commons/4/42/Alcobendas_-_Museo_Nacional_de_Ciencia_y_Tecnolog%C3%ADa_%28MUNCYT%29%2C_tel%C3%A9fono_m%C3%B3vil_Motorola_%281985%29.jpg |
| Arrancan las redes TACS británicas (1985) | `Mobira_Cityman_450.JPG` | Fennoradio | CC BY-SA 3.0 | 1771x2657 | https://upload.wikimedia.org/wikipedia/commons/1/12/Mobira_Cityman_450.JPG |
| NMT-900 multiplica los canales disponibles (1986) | `Mobira_Cityman_5000.jpg` | Trogain | CC BY-SA 4.0 | 2336x4160 | https://upload.wikimedia.org/wikipedia/commons/f/f2/Mobira_Cityman_5000.jpg |
| Trece países firman el memorando de GSM (1987) | `Anteny_GSM-R.jpg` | Zalasem1 | CC BY-SA 4.0 | 3315x4420 | https://upload.wikimedia.org/wikipedia/commons/5/56/Anteny_GSM-R.jpg |
| Primer conjunto de recomendaciones de la RDSI (1988) | `T-ISDN_NTBA.jpg` | Heidas | CC BY-SA 3.0 | 1404x2556 | https://upload.wikimedia.org/wikipedia/commons/9/97/T-ISDN_NTBA.jpg |
| La CEPT crea la ETSI (1988) | `Camouflaged_gsm_antenna.jpg` | Valugi | CC BY-SA 3.0 | 2448x3264 | https://upload.wikimedia.org/wikipedia/commons/4/47/Camouflaged_gsm_antenna.jpg |
| El grupo GSM pasa a la ETSI (1989) | `Local_steppe^hills_landscape_with_GSM-edge_base_tranceiver_station_antenna_-_panoramio.jpg` | Shamil Valeev | CC BY-SA 3.0 | 2592x3888 | https://upload.wikimedia.org/wikipedia/commons/b/b8/Local_steppe%5Ehills_landscape_with_GSM-edge_base_tranceiver_station_antenna_-_panoramio.jpg |
| Se cierran las especificaciones de GSM-900 (1990) | `Motorola_mr30.jpg` | Bohdan Bazooka | CC0 | 5773x7409 | https://upload.wikimedia.org/wikipedia/commons/e/ed/Motorola_mr30.jpg |
| Primera llamada GSM del mundo (1991) | `Formats_de_cartes_SIM.jpg` | Bidouille82 | CC BY-SA 3.0 | 3264x2448 | https://upload.wikimedia.org/wikipedia/commons/8/81/Formats_de_cartes_SIM.jpg |
| Primeras redes europeas GSM-900 y reforma de la UIT (1992) | `International_Telecommunication_Union_(ITU),_Geneva,_Switzerland.jpg` | ITU / I. Wood | CC BY 2.0 | 3665x1853 | https://upload.wikimedia.org/wikipedia/commons/2/25/International_Telecommunication_Union_%28ITU%29%2C_Geneva%2C_Switzerland.jpg |
| Salen a la venta los primeros teléfonos GSM (1992) | `Nokia_1011.jpg` | Jkbw | CC BY 3.0 | 1160x3316 | https://upload.wikimedia.org/wikipedia/commons/4/48/Nokia_1011.jpg |
| La TIA aprueba el estándar IS-95 (1993) | `10.29.2014_Wireless_Technology_on_the_Go_The_Connected_Car_and_Beyond_(15091180773).jpg` | Comisión Federal de Comunicaciones (FCC) | Dominio público | 1600x1200 | https://upload.wikimedia.org/wikipedia/commons/2/22/10.29.2014_Wireless_Technology_on_the_Go_The_Connected_Car_and_Beyond_%2815091180773%29.jpg |
| cdmaOne llega al mercado (1995) | `Samsung_CDMA_Phone.jpg` | Steve Jurvetson | CC BY 2.0 | 2048x1536 | https://upload.wikimedia.org/wikipedia/commons/7/76/Samsung_CDMA_Phone.jpg |
| GSM pasa al 3GPP y arranca la tercera generación (2000) | `3G_speed_brussel_sept_2012_IMG_2886.JPG` | Bjoertvedt | CC BY-SA 3.0 | 2466x2776 | https://upload.wikimedia.org/wikipedia/commons/a/a9/3G_speed_brussel_sept_2012_IMG_2886.JPG |

> Las dimensiones de la columna «Resolución» proceden de la ficha técnica de cada archivo en Commons y permiten auditar el criterio de alta definición aplicado. La comprobación de disponibilidad de las URL se realizó contra la API de Wikimedia; las peticiones HTTP directas al CDN quedaron limitadas temporalmente por el control de tasa del servicio.

---

## 5. Referencias

### 5.1 Fuentes externas de contraste (consulta: 19 de septiembre de 2026)

Wikipedia. (2026). *DATAPAC*. https://en.wikipedia.org/wiki/DATAPAC

Wikipedia. (2026). *Donald Davies*. https://en.wikipedia.org/wiki/Donald_Davies

Wikipedia. (2026). *International Packet Switched Service*. https://en.wikipedia.org/wiki/International_Packet_Switched_Service

Wikipedia. (2026). *Leonard Kleinrock*. https://en.wikipedia.org/wiki/Leonard_Kleinrock

Wikipedia. (2026). *Paul Baran*. https://en.wikipedia.org/wiki/Paul_Baran

Wikipedia. (2026). *Telenet*. https://en.wikipedia.org/wiki/Telenet

Wikipedia. (2026). *Transpac (data network)*. https://en.wikipedia.org/wiki/Transpac_(data_network)

Wikipedia. (2026). *X.25*. https://en.wikipedia.org/wiki/X.25

### 5.2 Fuentes primarias y secundarias citadas por las anteriores

Baran, P. (1960). *Reliable digital communications systems using unreliable network repeater nodes* (Documento P-1995). RAND Corporation.

Baran, P. (1962). *On distributed communications networks* (Documento P-2626). RAND Corporation.

Baran, P. (1964). *On distributed communications* (Serie de once volúmenes). RAND Corporation.

Campbell-Kelly, M. (1987). Data communications at the National Physical Laboratory (1965-1975). *Annals of the History of Computing, 9*(3/4), 221-247. https://doi.org/10.1109/MAHC.1987.10023

CCITT, Study Group VII. (1976). *Draft Recommendation X-25*. Unión Internacional de Telecomunicaciones.

Davies, D. W. (1966). *Proposal for a development of a national communications service for on-line data processing*. National Physical Laboratory.

Davies, D. W., Bartlett, K. A., Scantlebury, R. A., y Wilkinson, P. T. (1967). A digital communication network for computers giving rapid response at remote terminals. *Proceedings of the ACM Symposium on Operating System Principles*. https://doi.org/10.1145/800001.811669

Després, R. (2010). X.25 virtual circuits - TRANSPAC in France - Pre-internet data networking. *IEEE Communications Magazine, 48*(11), 40-46. https://doi.org/10.1109/MCOM.2010.5621965

Erskine, S. B. (1977). DATAPAC: A Canadian packet switching network. *Canadian Electrical Engineering Journal, 2*(1), 31-36. https://doi.org/10.1109/CEEJ.1977.6592834

ITU-T. (1996). *Recommendation X.25: Interface between data terminal equipment (DTE) and data circuit-terminating equipment (DCE) for terminals operating in the packet mode and connected to public data networks by dedicated circuit*. Unión Internacional de Telecomunicaciones. https://www.itu.int/rec/T-REC-X.25/

Kleinrock, L. (1961). *Information flow in large communication nets* [Propuesta de tesis doctoral]. Massachusetts Institute of Technology.

Kleinrock, L. (1962). *Message delay in communication nets with storage* [Tesis doctoral]. Massachusetts Institute of Technology.

Kleinrock, L. (1964). *Communication nets: Stochastic message flow and design*. McGraw-Hill.

Mathison, S. L. (1975). Telenet inaugurates service. *ACM Computer Communications Review*.

Mathison, S. L., Roberts, L. G., y Walker, P. M. (2012). The history of Telenet and the commercialization of packet switching in the U.S. *IEEE Communications Magazine*. https://ieeexplore.ieee.org/document/6194380

Rybczynski, T. (2009). Commercialization of packet switching (1975-1985): A Canadian perspective. *IEEE Communications Magazine, 47*(12), 26-31. https://doi.org/10.1109/MCOM.2009.5350364

Scantlebury, R., Wilkinson, P., y Barber, D. (2001). *NPL, packet switching and the Internet*. Symposium of the Institution of Analysts and Programmers.

Sirbu, M. A., y Zwimpfer, L. E. (1985). Standards setting for computer communication: The case of X.25. *IEEE Communications Magazine*.

> Las referencias de 5.2 se localizaron a través de las obras de 5.1; cuando el ejemplar original no estaba disponible en línea, la cita se limita a los datos verificables y se evita completar paginación o volúmenes no confirmados.

---

## 6. Trazabilidad

| Artefacto | Uso de esta investigación |
|:---|:---|
| `LINEA_DEL_TIEMPO.md` | Conserva sus tablas originales sin cambios; solo incorpora la sección 5 de formato de distribución, que remite a este documento. |
| `linea_del_tiempo_tema_1.csv` | Aplica las siete fechas refinadas de las tablas 2.1 y 2.2 y la precisión de la tabla 3; incluye las ocho imágenes de la sección 4 con su crédito y texto alternativo. |
| `sandbox/generar_linea_del_tiempo_csv.py` | Utilidad de un solo uso que genera y valida el CSV; no se promueve al `PLAYBOOK.md`. |
