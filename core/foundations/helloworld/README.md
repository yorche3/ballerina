# Hello, World! — Ballerina

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **Ballerina**.

---

## 📂 Archivos / Files

| Archivo | Propósito |
|---------|-----------|
| [`hello_world.bal`](hello_world.bal) | Código fuente: imprime `"Hello, World!"` en la consola. |
| [`README.md`](README.md) | Este archivo. |

---

## 🛠️ Enfoque / Approach

**ES:** Ballerina no requiere archivos de proyecto para ejecutar un programa simple. Un único archivo `.bal` con una función `main()` pública es suficiente: el compilador/ejecutor `bal` lo reconoce automáticamente como punto de entrada.

El programa:
1. Importa el módulo `ballerina/io` para E/S.
2. Declara `public function main()` como punto de entrada.
3. Usa `io:println` para imprimir el mensaje.

**EN:** Ballerina does not require project files to run a simple program. A single `.bal` file with a public `main()` function is enough: the `bal` compiler/runner automatically recognizes it as the entry point.

The program:
1. Imports the `ballerina/io` module for I/O.
2. Declares `public function main()` as the entry point.
3. Uses `io:println` to print the message.

---

## 📄 Archivos clave / Key Files

### `hello_world.bal`

**ES:** Código fuente en Ballerina. Es autónomo: no necesita `Ballerina.toml` ni otros archivos de configuración para ejecutarse.

**EN:** Ballerina source code. It is self-contained: it does not need `Ballerina.toml` or any other configuration files to run.

```ballerina
import ballerina/io;

public function main() {
    io:println("Hello, World!");
}
```

| Elemento | Propósito |
|----------|-----------|
| `import ballerina/io;` | Importa el módulo estándar de E/S |
| `public function main()` | Punto de entrada del programa (como `main` en C, `_start` en Assembly) |
| `io:println(...)` | Imprime una línea con salto de línea al final |

---

## 🚀 Compilar y ejecutar / Build & Run

### Requisito: Tener Ballerina instalado

```bash
# Verificar instalación
bal version
```

> **ES:** Descargar desde [ballerina.io](https://ballerina.io/downloads/) o usar `winget install Ballerina.Ballerina` (Windows).  
> **EN:** Download from [ballerina.io](https://ballerina.io/downloads/) or use `winget install Ballerina.Ballerina` (Windows).

### Ejecutar

```bash
# Ejecutar directamente (compila y ejecuta en un solo paso)
bal run hello_world.bal

# O compilar primero y luego ejecutar
bal build hello_world.bal
java -jar hello_world.jar
```

**Salida esperada / Expected output:**

```text
Hello, World!
```

> **ES:** Con `bal run` no se genera ningún archivo intermedio. Con `bal build` se genera un JAR ejecutable.
> **EN:** With `bal run` no intermediate files are generated. With `bal build` a runnable JAR is produced.

---

## 📁 Estructura / Structure

```text
helloworld/
├── hello_world.bal    # Código fuente
├── hello_world.jar    # JAR ejecutable (generado con bal build)
└── README.md          # Este archivo
```

> **ES:** `hello_world.jar` solo se genera si se ejecuta `bal build`. Con `bal run` no se crean archivos adicionales.
> **EN:** `hello_world.jar` is only generated if `bal build` is run. With `bal run` no additional files are created.

---

## 🔍 Comparativa con otros lenguajes

| Aspecto | Ada | Assembly | Ballerina |
|---------|-----|----------|-----------|
| Archivo de proyecto | `hello_world.gpr` + `alire.toml` | `Makefile` (Linux) + `build.ps1` (Windows) | Ninguno (opcional `Ballerina.toml`) |
| Punto de entrada | `procedure Hello_World is` | `_start` | `public function main()` |
| Compilación | `gprbuild -P hello_world.gpr` | `nasm -f elf64` + `ld` | `bal run` (compila y ejecuta) |
| E/S | `Put_Line` (librería Ada) | `syscall` (kernel) | `io:println` (librería Ballerina) |
| Binario | ~200 KB (+ librerías) | ~1 KB (estático) | JAR ~10 MB (requiere JVM) |
| Dependencias externas | Alire, GNAT, gprbuild | NASM, ld | Ballerina (incluye JVM) |

---

## 📝 Notas / Notes

- **ES:** Ballerina ejecuta sobre la JVM (Java Virtual Machine). El comando `bal run` compila el código fuente a bytecode Java y lo ejecuta en un solo paso.
- **EN:** Ballerina runs on the JVM (Java Virtual Machine). The `bal run` command compiles the source code to Java bytecode and executes it in a single step.
- **ES:** A diferencia de Ada (que requiere `gprbuild` y `alire.toml`) o Assembly (que requiere `nasm` y `ld`), Ballerina puede ejecutar un archivo `.bal` suelto sin configuración adicional.
- **EN:** Unlike Ada (which requires `gprbuild` and `alire.toml`) or Assembly (which requires `nasm` and `ld`), Ballerina can run a standalone `.bal` file without additional configuration.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
