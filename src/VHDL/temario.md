---
id: 14_temario_vhdl
name: temario_vhdl
title: "Temario Oficial: Diseño Digital y Programación VHDL"
file_path: src/VHDL/temario.md
version: 1.0.0
category: syllabus
domain: VHDL
tags: [temario, vhdl, logica-digital, fpga, fsm-mealy-moore, alu, uart, i2c, buses]
description: "Temario y contenido curricular oficial de Diseño Digital y VHDL (sintaxis VHDL, FSM Mealy/Moore, memorias, arquitectura ALU e interfaces UART/I2C)."
owner: AI Engineering & Architecture Team
status: active
created_at: 2026-09-01T23:00:00Z
updated_at: 2026-09-01T23:00:00Z
dependencies: [00_agents_contract, 01_readme, 02_architecture, 04_buenas_practicas]
schema_version: 1.0.0
---

# Temario: VHDL

## 1. Programación VHDL
*   **1.1.** Elementos del lenguaje VHDL.
    *   **1.1.1.** Elementos sintácticos del VHDL.
    *   **1.1.2.** Operadores y expresiones en VHDL.
*   **1.2.** Declaraciones de objetos.
    *   **1.2.1.** Declaración de señales.
    *   **1.2.2.** Declaración de ficheros.
*   **1.3.** Declaraciones concurrentes.
    *   **1.3.1.** Declaración de arquitectura de flujo de datos.
    *   **1.3.2.** Ejemplos de descripción flujo de datos.
*   **1.4.** Ejemplos de declaraciones secuenciales.
    *   **1.4.1.** Ejemplos de diagramas de máquinas de estado.
*   **1.5.** Funciones y subprogramas.
    *   **1.5.1.** Declaración de procedimientos y funciones.
    *   **1.5.2.** Subprogramas.
    *   **1.5.3.** Paquetes.
    *   **1.5.4.** Bibliotecas.
*   **1.6.** Programación de FPGA's ó CPLD'S en diferentes aplicaciones.

## 2. Máquinas de Estados Finitos
*   **2.1.** Modelo de Mealy y Modelo de Moore.
*   **2.2.** Representación de los modelos Mealy y Moore en diagramas de estado y diagrama ASM.
*   **2.3.** Diseño de máquinas de estados finitos tipo Mealy y tipo Moore utilizando VHDL.
    *   **2.3.1.** Obtención de las tablas de estado.
    *   **2.3.2.** Obtención de las ecuaciones de estado.
    *   **2.3.3.** Programación de archivo .VHD.
    *   **2.3.4.** Simulación del archivo .VHD.
    *   **2.3.5.** Obtención del archivo de programación.
    *   **2.3.6.** Programación de FPGA's ó CPLD's.

## 3. Memorias
*   **3.1.** Conceptos de memorias.
    *   **3.1.1.** Terminología de memorias.
    *   **3.1.2.** Operación general de memorias.
    *   **3.1.3.** Tipos de memorias.
    *   **3.1.4.** Aplicaciones de memorias en la lógica combinacional y secuencial.

## 4. Arquitectura de Procesadores
*   **4.1.** Arquitectura Von Neumann.
    *   **4.1.1.** Arquitectura de los Microprocesadores.
*   **4.2.** Arquitectura Harvard.
    *   **4.2.1.** Arquitectura de los Microcontroladores.
*   **4.3.** Estructura y funcionamiento de una ALU.
    *   **4.3.1.** Registro de estado.
    *   **4.3.2.** Operaciones con datos de memoria y registros.
    *   **4.3.3.** Operaciones con punto flotante y fijo.
*   **4.4.** Descripción de una ALU con VHDL.

## 5. Módulos de Interfaz en VHDL
*   **5.1.** Comunicación serial con UART.
    *   **5.1.1.** Introducción.
    *   **5.1.2.** Diseño de un UART en VHDL.
*   **5.2.** Comunicación serial por I²C.
    *   **5.2.1.** Introducción a I²C.
    *   **5.2.2.** Diseño de un módulo para comunicación I²C.
    *   **5.2.3.** Comunicación de un FPGA con otro dispositivo por medio de I²C.
*   **5.3.** Comunicación por Ethernet utilizando IP cores.
    *   **5.3.1.** Introducción a Ethernet.
    *   **5.3.2.** Utilización de IP cores para comunicar dos FPGA's por Ethernet.
*   **5.4.** Comunicación por CAN utilizando IP cores.
    *   **5.4.1.** Introducción al Bus CAN.
    *   **5.4.2.** Utilización de IP cores para comunicar dos FPGA's por bus CAN.