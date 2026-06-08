# Hello, User! — Ballerina

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Ballerina**, siguiendo el mismo enfoque minimalista que [`hello_world`](../helloworld/).

Lee un nombre desde la entrada estándar y saluda al usuario.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_user.bal`](hello_user.bal) | Código fuente: solicita un nombre al usuario y saluda. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hello_user.bal    # Código fuente
└── README.md         # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Al igual que `hello_world`, Ballerina no requiere archivos de proyecto. Un único archivo `.bal` con `public function main()` es suficiente. Las novedades respecto a `hello_world` son:

1. **Variable** `name` de tipo `string` para almacenar la entrada del usuario.
2. **Lectura de entrada** con `io:readln()` para leer desde la consola.
3. **Concatenación de cadenas** con el operador `+` para construir el saludo.
4. **Flujo secuencial** de tres pasos: imprimir prompt → leer → saludar.

**EN:** Like `hello_world`, Ballerina does not require project files. A single `.bal` file with `public function main()` is enough. The new concepts compared to `hello_world` are:

1. **Variable** `name` of type `string` to store user input.
2. **Input reading** with `io:readln()` to read from the console.
3. **String concatenation** with the `+` operator to build the greeting.
4. **Sequential flow** of three steps: print prompt → read → greet.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_user.bal` — Código fuente

**ES:** A diferencia de `hello_world`, este programa:

- Declara una variable `name` de tipo `string` con valor inicial `""`.
- Llama a `io:readln()` para leer una línea completa de la entrada estándar.
- Concatena el saludo con el operador `+`: `"Hello, " + name + "!"`.
- Imprime el resultado con `io:println`.

**EN:** Unlike `hello_world`, this program:

- Declares a `name` variable of type `string` with initial value `""`.
- Calls `io:readln()` to read a full line from standard input.
- Concatenates the greeting using the `+` operator: `"Hello, " + name + "!"`.
- Prints the result with `io:println`.

```ballerina
import ballerina/io;

public function main() {
    string name = "";
    io:println("Enter your name:");
    name = io:readln();
    io:println("Hello, " + name + "!");
}
```

**Novedades respecto a `hello_world`:**

| Elemento | `hello_world` | `hello_user` |
|----------|---------------|--------------|
| Variables | No | `string name = "";` |
| Entrada | No | `io:readln()` |
| Concatenación | No | `"Hello, " + name + "!"` |
| Flujo | 1 paso (imprimir) | 3 pasos (prompt → leer → saludar) |

---

## 🚀 Compilación y ejecución / Build & Run

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
bal run hello_user.bal
```

**Salida esperada / Expected output:**

```text
Enter your name:
Ada
Hello, Ada!
```

> **ES:** El programa espera a que el usuario escriba su nombre y presione Enter antes de mostrar el saludo.
> **EN:** The program waits for the user to type their name and press Enter before showing the greeting.

---

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `io:readln()` devuelve un `string` que incluye todo lo que el usuario escribió hasta presionar Enter, **sin** el salto de línea final.
- **EN:** `io:readln()` returns a `string` that includes everything the user typed up to pressing Enter, **without** the trailing newline.
- **ES:** La variable `name` se declara con tipo explícito `string`. Ballerina tiene inferencia de tipos, pero aquí se usa declaración explícita por claridad educativa.
- **EN:** The `name` variable is declared with explicit type `string`. Ballerina has type inference, but explicit declaration is used here for educational clarity.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
