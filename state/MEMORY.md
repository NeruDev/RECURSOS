---
id: 05_memory
name: memory
title: "Memoria Semántica y Lecciones del Sistema Didáctico"
file_path: state/MEMORY.md
version: 1.8.0
category: memory
tags: [memory, state, python314, quarto, typst, latex, schemdraw, gotchas, vhdl, git-lfs, timelinejs, csv, excel, xlsx, docx, python-docx, wikimedia, imagenes, fsm, diagramas-vectoriales, verificacion-fuentes, bibliografia, maquetacion-word]
description: "Memoria semántica permanente: lecciones aprendidas, compatibilidad de librerías y decisiones de diseño técnico."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T21:40:00Z
updated_at: 2026-10-23T17:55:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture, 03_glossary, 04_buenas_practicas]
schema_version: 1.0.0
---

# Memoria Semántica del Sistema (state/MEMORY.md)

Memoria a largo plazo del repositorio para registrar reglas aprendidas, compatibilidad de runtime y heurísticas de ejecución.

---

## 1. Heurísticas y Lecciones Aprendidas

- **2026-09-01 21:40 - Ecosistema Científico en Python 3.14.6:**
  - `numpy` (2.5.2), `scipy` (1.18.1), `matplotlib` (3.11.1), `pandas` (3.0.5) y `pillow` (12.3.0) cuentan con ruedas precompiladas para Windows x64 (`cp314`).
  - No compilar paquetes C/Fortran manualmente; usar el gestor de paquetes de `.venv`.
- **2026-09-01 21:41 - Integración Quarto / VS Code:**
  - Kernel registrado: `recursos-didacticos` apuntando a `.venv\Scripts\python.exe`.
  - Quarto (`v1.9.38`) y Typst (`v0.15.1`) están en PATH y se invocan de forma no interactiva vía CLI (`typst compile`, `quarto render`).
- **2026-09-01 21:55 - Modularidad por Materia Escolar:**
  - Cada materia (`src/Circuitos/`, `src/Electromagnetismo/`, `src/Telecomunicaciones/`, `src/VHDL/`) es un submódulo independiente.
  - La salida gráfica (diagramas de circuitos, campos, espectros) debe emitirse siempre en formato vectorial (`.svg` / `.pdf`) hacia `output/`.
- **2026-09-02 00:10 - Estilizado Vectorial Typst y Gestión Git LFS:**
  - Typst 0.15.1 permite colorear subexpresiones matemáticas mediante reglas `show math.equation` con expresiones regulares (`show regex("[01]"): ...`), aplicando estilos selectivos a variables, números y operadores lógicos.
  - La gestión de imágenes rasterizadas (`.png`) y documentos (`.pdf`) en `output/` se centraliza mediante `.gitattributes` con filtros Git LFS (`filter=lfs diff=lfs merge=lfs -text`), mientras que las imágenes vectoriales `.svg` permanecen como texto plano XML normalizado con finales de línea `LF`.
  - En diseño lógico y VHDL, el Teorema de Expansión de Shannon provee el vínculo directo entre el álgebra booleana y la arquitectura de hardware (multiplexores 2:1 y Look-Up Tables de FPGAs).
- **2026-09-03 23:48 - Inviabilidad de Bypass PDF para Fórmulas Matemáticas OMML:**
  - El formato PDF aplana el árbol de sintaxis abstracta (AST) de las matemáticas a primitivas de renderizado 2D (coordenadas, glifos de fuentes y trazos vectoriales).
  - Los motores estándar de conversión PDF a DOCX (`pdf2docx`, MS Word Reflow, Adobe Acrobat, Poppler) NO poseen reconstructores semánticos de ecuaciones: emiten `0` elementos `<m:oMath>`, omiten barras de fracción y radicales, y convierten los símbolos en texto plano Unicode plano o fragmentado.
  - Para obtener Word nativo con OMML editable (`<m:oMathPara>`, `<m:oMath>`, `<m:f>`, `<m:rad>`), los métodos deterministas son:
    1. `markdocx` (Python con hoja `MML2OMML.XSL` de Microsoft Office).
    2. Bypass estructurado LaTeX: `Markdown -> LaTeX (.tex) -> Word (.docx)` vía Pandoc.
    3. Bypass estructurado HTML+MathML: `Markdown -> HTML (MathML) -> Word (.docx)` vía Pandoc.
    4. Saneamiento sintáctico Markdown: eliminar líneas vacías dentro de `$$`, evitar espacios interiores en `$ ... $` y desanidar `$$` de listas con sangría.
- **2026-09-19 16:10 - Formato CSV de TimelineJS y medios verificados de Wikimedia Commons:**
  - La hoja de cálculo de TimelineJS (Knight Lab) exige una cabecera literal de 19 columnas: `Year`, `Month`, `Day`, `Time`, `End Year`, `End Month`, `End Day`, `End Time`, `Display Date`, `Headline`, `Text`, `Media`, `Media Credit`, `Media Caption`, `Media Thumbnail`, `Alt Text`, `Type`, `Group`, `Background`. La capitalización de `Alt Text` es significativa y el orden no debe alterarse.
  - La columna `Type` acepta cadena vacía (evento), `title` (portada sin fecha, una sola fila) y `era` (banda del eje inferior: exige año de inicio, año de fin y titular; el resto de celdas se ignora y el color es automático, no configurable). Las eras solapadas no están bien soportadas, por lo que conviene no declarar `End Year` en los eventos cuando se usan bandas `era`.
  - `Display Date` sobrescribe el formato de fecha, lo que permite escribir fechas en español, pero el año sigue siendo obligatorio para posicionar el hito en el eje.
  - `csv.writer` emite finales `\r\n` por defecto: para cumplir UTF-8 sin BOM con finales `LF` (AGENTS.md §4) hay que fijar `lineterminator="\n"` y escribir el contenido a través de `io.StringIO` con `Path.write_text(..., encoding="utf-8", newline="")`.
  - La API de Wikimedia Commons (`action=query&prop=imageinfo&iiprop=url`) devuelve la URL directa acompañada de parámetros de seguimiento `?utm_source=...` que deben recortarse antes de usarla; el filtro `iiextmetadatafilter=LicenseShortName|Artist|Credit` aporta autoría y licencia sin volcar todo el árbol de metadatos.
  - Excel puede mostrar mojibake al abrir el CSV porque el repositorio prohíbe el BOM: para revisarlo en hoja de cálculo conviene usar Google Sheets o una importación explícita como UTF-8.
- **2026-09-19 17:30 - Libros de Excel derivados (`.xlsx`) con `openpyxl` y excepción de formato:**
  - El requisito de entregables editables en Excel se resuelve con un libro `.xlsx` (contenedor binario ZIP/OPC) y no relajando el CSV: la excepción autorizada en `AGENTS.md` §13 exime al binario de UTF-8 sin BOM y de los finales `LF`, mantiene el `snake_case` y obliga a que el CSV siga siendo la fuente única de verdad, con la utilidad de conversión en `sandbox/` y su dependencia declarada en `pyproject.toml`.
  - `openpyxl` (3.1.5) no incluye `py.typed`, pero sus anotaciones se resolvieron con `mypy --strict` sin incidencias; el detalle que sí rompe el tipado estricto es reutilizar el mismo nombre de variable para la fila del CSV (`Sequence[str]`) y para el número de fila (`int`) dentro de una misma función.
  - `Worksheet.append` acepta una lista heterogénea: hay que convertir a `int` únicamente las columnas de fecha y conservar el resto como texto para no alterar el contenido del CSV; las celdas vacías se escriben como `None`.
  - Para que un libro sea utilizable en Excel conviene fijar `freeze_panes`, `auto_filter.ref`, `column_dimensions[letra].width`, `row_dimensions[1].height`, alineación con `wrap_text` en los campos largos y `hyperlink` en las celdas de media (el valor textual de la celda permanece intacto).
  - La verificación cruzada más económica es releer el libro con `pandas.read_excel(..., dtype=object)` y comparar celda a celda contra el CSV, ya que `openpyxl` por sí solo no detecta divergencias de contenido.
- **2026-09-19 18:30 - Investigación masiva de imágenes en Wikimedia Commons:**
  - La API de Commons devuelve títulos, URL directa, dimensiones, autoría y licencia sin descargar la imagen: `generator=search` o `generator=categorymembers` combinados con `prop=imageinfo&iiprop=url|size`, y `iiextmetadatafilter=LicenseShortName|Artist` para la atribución. Un único `titles=File:A|File:B|...` resuelve hasta 50 archivos por petición y devuelve `MISSING` para los inexistentes.
  - Commons aplica control de tasa (HTTP 429) a ráfagas de peticiones, incluidas las lanzadas desde el terminal: conviene espaciar las consultas con un agente de usuario identificativo y no verificar las URL con peticiones `HEAD` masivas, porque el CDN responde 429 aunque los archivos existan. La existencia y las dimensiones deben tomarse de la API, no del código HTTP del CDN.
  - Búsquedas útiles (con `srnamespace=6` o `gsrnamespace=6`): nombres de modelo de dispositivo («Mobira Cityman», «Motorola mr30», «Nokia 1011»), siglas de tecnología («ISDN NTBA», «GSM base station») y emplazamientos («Bell Labs Holmdel», «NPL Teddington», «RAND Corporation»). Las categorías curadas (por ejemplo `Category:Mobira`, `Category:ISDN`) dan mejores resultados que la búsqueda libre cuando el término es ambiguo.
  - Criterio de calidad aplicado: lado mayor superior a 1000 px; si no existe fotografía histórica en alta resolución, usar una imagen reciente de la misma tecnología y decirlo en el pie de la diapositiva. Referir siempre autoría, licencia y resolución en el documento de fuentes, porque CC BY y CC BY-SA exigen atribución.
- **2026-09-19 21:25 - Informes Word derivados (`.docx`) con `python-docx` y excepción §13 ampliada:**
  - `python-docx` (1.2.0, ya presente como dependencia transitiva de `markdocx`) es suficiente para informes sin ecuaciones: `add_heading` para la jerarquía, `add_paragraph(style="List Bullet")` para viñetas, `run.add_break()` para la segunda línea de una viñeta y sangría francesa con `left_indent` de 1,27 cm y `first_line_indent` de -1,27 cm. Cuando sí se requieren fórmulas, la vía OMML sigue siendo `markdocx`. La excepción de `AGENTS.md` §13 cubre ya los dos contenedores binarios derivados (`.xlsx` y `.docx`).
  - `Document.paragraphs` conserva el orden de lectura y permite segmentar por estilo `Heading 1`: contar viñetas por sección es la comprobación más económica de que la lista tiene los 30 hitos y el glosario las 37 siglas, sin abrir el archivo en Word.
  - Los campos de las tablas Markdown llegan con énfasis literal (`**negrita**`, `*cursiva*`): si se copian tal cual, los asteriscos aparecen en el documento. Hay que tokenizar y crear runs con `bold`/`italic`. Las citas se escriben además entre comillas rectas y terminadas en punto dentro de las tablas (por ejemplo `"GSM fue fijado en 1982".`), por lo que conviene limpiar comillas y punto final antes de envolverlas en «» para no anidar signos.
  - El emoji de verificación (✅ / 📚) se conserva en las notas explicativas, pero conviene traducirlo a rótulos textuales («confirmada con contraste externo», «pendiente de cotejo con el ejemplar impreso») en el cuerpo del informe, porque el eje de verificación de las tablas no viaja en el CSV.
  - Verificación sin Microsoft Office: `pandoc -f docx -t plain --wrap=none` vuelca el texto para revisión manual, y un modo `--check` que reabra el archivo con `python-docx` puede exigir 0 tablas, las secciones esperadas y la presencia de titulares, enlaces y referencias.
  - **Sincronía de derivados:** un artefacto derivado puede quedar obsoleto aunque su marca de modificación sea posterior a la del canónico (el `.xlsx` de la línea del tiempo conservaba una portada antigua tras la última edición del CSV). Solo el cotejo de contenido celda a celda lo revela, y la reparación es regenerar el derivado desde el CSV en lugar de tocar el canónico.
- **2026-10-18 13:25 - Diagramas vectoriales nativos en Typst 0.15.1 y hoja carta estandarizada:**
  - `rotate()` **no** acepta un punto como `origin`, solo una alineación (`center`, `horizon`, ...): para orientar una punta de flecha conviene calcular los tres vértices del triángulo con `calc.sin`/`calc.cos` sobre `ang.rad()`, con la punta en `(0pt, 0pt)`, y colocar el polígono con `place(dx:, dy:)` en el punto final de la polilínea. Ángulos verificados: 0° derecha, 90° abajo, 180° izquierda, −90° arriba.
  - `calc.atan2` exige **números**, no longitudes; con ángulos conocidos es más simple declararlos explícitamente en cada flecha que derivarlos de los puntos.
  - `curve.cubic` recibe `(control-inicio, control-fin, fin)`; con controles simétricos `(-w, -h)` y `(2w, -h)` se obtiene un lazo de auto-transición cuya tangente final es vertical (punta a 90°), apoyado exactamente sobre la circunferencia.
  - `place` requiere un padre con tamaño conocido: todo diagrama se envuelve en `block(width:, height:, inset: 0pt)` y se centra con `align(center, ...)`.
  - Los archivos `.typ` con «tarjetas» deben declarar `breakable: false` en el `block` contenedor; de lo contrario Typst parte la tarjeta entre páginas y deja títulos huérfanos al imprimir.
  - El código en línea (`raw` dentro de celdas) hereda una familia monoespaciada distinta según el contexto; para que sea determinista se fija `#show raw: set text(font: ("Consolas", "Courier New", ...))`. `Cascadia Code`/`Cascadia Mono`/`DejaVu Sans` no están instaladas en este equipo y emiten advertencia, pero la cadena de respaldo las cubre.
  - **Formato estándar:** hoja **carta** (`paper: "us-letter"`, márgenes x 12 mm, top 10 mm, bottom 12 mm) para todas las láminas didácticas nuevas; la lámina panorámica de 350 mm de `algebra_boole.typ` queda como excepción documentada en `estilos_typst.md`.
  - La verificación visual en dos pasadas (PNG a 130 ppp para maqueta y recortes a 300 ppp con `System.Drawing` para flechas y tipografía) detecta solapamientos que el compilador no reporta, por ejemplo una etiqueta de transición sobre el separador de la leyenda.
  - **Resaltado de sintaxis del código en Typst sin paquetes:** un `#show raw: it => ...` puede tokenizar el texto y devolver `text()` por token. Los espacios deben emitirse como `U+00A0` (Typst colapsa los ordinarios y rompería la indentación); concatenar con `array.join(linebreak())` conserva las líneas. La prioridad se resuelve comparando `m.start` (`str.match` devuelve `start`, `end`, `text`) y, en empate, por el orden de las reglas; así el comentario (`--...`) gana al resto de la línea. Para unir tokens sin espacios espurios basta con concatenar elementos en línea (Typst no inserta separación entre ellos).
  - **Diagramas de estados:** una auto-transición legible es una parábola simétrica respecto de la vertical del centro del círculo (`curve.cubic` con ambos puntos de control a la misma altura), con la punta en el extremo izquierdo y tangente vertical; los extremos se separan `dIn = 8,4 mm` sobre el centro y `w = 5,2 mm` a cada lado, quedando 0,9 mm fuera de la circunferencia de radio 9 mm.
  - **Trazado de bloques:** una flecha de un bloque hacia otro debe terminar en el borde del bloque destino (coordenada dentro de su rango horizontal); si el destino es una lógica intermedia, hay que mover esa caja bajo la fuente en lugar de dejar la flecha apuntando al vacío, porque el ojo la asocia al bloque más cercano.
- **2026-10-23 11:20 - Verificación de fuentes y corrección de «media octava» en material didáctico:**
  - **Media octava vs punto medio aritmético:** en acústica y normalización la media octava es la banda fraccionaria $f_u=\sqrt{2}f_l$ (600 cents, 6 semitonos templados, $f_c=2^{1/4}f_l$); para $440\ \text{Hz}$ el extremo superior es $622.25\ \text{Hz}$ (Re♯5). El valor $660\ \text{Hz}$ que circula en fuentes de teoría musical es el **punto medio aritmético** $(f_l+f_u)/2$, una quinta justa de relación $3{:}2$ y 7 semitonos, no una media octava. Conviene citarlo solo como interpretación musical y corregirlo en los cuestionarios.
  - **Frecuencias centrales de banda:** las bandas de octava usan la serie ISO 266 $f_{c,n}=1000\cdot10^{n/10}\ \text{Hz}$; los rótulos 63, 125, 250, 500, 1000, 2000, 4000 y 8000 Hz son **nominales**, con valores exactos 63.10, 125.89, 251.19, 501.19, 1000, 1995.26, 3981.07 y 7943.28 Hz, y extremos $f_l=f_c/\sqrt{2}$, $f_u=\sqrt{2}f_c$.
  - **Ganancia de antena:** la relación $P_{sal}/P_{ent}$ es la eficiencia de radiación $e_{cd}$, no la ganancia; la ganancia es $G=4\pi U/P_{in}=e_{cd}D$. Varias páginas docentes en español (por ejemplo la de *Telecomunicaciones TICS*) repiten la formulación incorrecta y hay que corregirla al citarlas.
  - **Sondeo de URL con clientes automatizados:** `fcc.gov` responde 403 a todo el dominio (incluida la portada) y `sciencedirect.com` responde 403 a las páginas de temas; ISO entrega 403 si se omite `Accept-Language`, pero devuelve el título correcto con la cabecera. Un 403 no prueba inexistencia: hay que clasificar el resultado como «no verificable por bloqueo», no como fuente falsa. Un `TCP 443` cerrado tras resolver DNS (caso de `healthyhearing.com`) indica host inaccesible y obliga a buscar una fuente de respaldo verificada.
  - **Auditoría de un PDF citado:** descargar el archivo y leer la portada con `pypdf` permite corregir autoría y título que la bibliografía original había perdido (por ejemplo «Colegio Robles» era en realidad Lozano, F. G., *Ruidos en los sistemas de comunicaciones*, Instituto Luis Manuel Robles; y el PDF de la Universidad de Zaragoza es el T3 *El ruido en los sistemas digitales* de T. Pollán).
- **2026-10-23 11:55 - Versión Word con LaTeX literal (`.docx` derivado de Markdown):**
  - **Cuándo usar LaTeX literal y cuándo OMML:** si el destino es edición interactiva de ecuaciones, conviene OMML; si se pide «las fórmulas en LaTeX», el cuerpo de cada ecuación se emite como corrida monoespaciada (`Consolas` 9 pt) en párrafos con sombreado `F2F2F2`, sin los delimitadores `$` ni `$$`, que son marcas de Markdown.
  - **Anchos de columna en tablas:** repartir por longitud de celda con tope funciona, pero un solo token no separable (una ruta de URL de 51 caracteres) fuerza mínimos absurdos y estrangula las demás columnas; hay que limitar el mínimo por columna (4.5 cm) y añadir `w:wordWrap w:val="0"` a los párrafos de celda para que Word y LibreOffice partan ese token en lugar de desbordar el margen.
  - **Filas que se rompen entre páginas:** `python-docx` no expone `allow_break` en `_Row`; el equivalente es insertar `w:cantSplit` en `trPr` y `w:tblHeader` en la primera fila para repetir el encabezado.
  - **Verificación de fidelidad sin duplicar el parser:** comparar multiconjuntos de palabras (Markdown sin marcas frente al `.docx`) detecta de inmediato texto perdido; conviene no descontar los números de lista ordenada del lado del Markdown, porque el `.docx` los conserva como texto con sangría francesa.
  - **QA visual sin Word:** `soffice --headless --convert-to pdf` (perfil aislado con `-env:UserInstallation`) y `pymupdf` a 100 ppp permiten revisar maquetación página a página; una segunda instancia de LibreOffice en paralelo devuelve «source file could not be loaded» aunque el PDF anterior sí se haya escrito.

