# Calculator — Ballerina

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Ballerina**, usando el framework de pruebas integrado (`bal test`) con anotaciones `@test:Config`.

---

## 📂 Archivos y estructura / Files & Structure

### Raíz del proyecto / Project root

| Archivo | Propósito |
|---------|-----------|
| [`calculator.bal`](calculator.bal) | Módulo principal — declara e implementa `addition`, `subtraction`, `multiplication`, `division`, `modulus`. |
| [`Ballerina.toml`](Ballerina.toml) | Manifiesto del paquete — nombre (`calculator`), organización (`yorche3`), versión. |
| [`.devcontainer.json`](.devcontainer.json) | Configuración del contenedor de desarrollo (opcional). |
| [`README.md`](README.md) | Este archivo. |

### Pruebas / Tests (`tests/`)

| Archivo | Propósito |
|---------|-----------|
| `tests/lib_test.bal` | Pruebas unitarias — 5 casos con anotaciones `@test:Config` y aserciones `test:assertEquals`. |

**Estructura de directorios esperada:**

```text
calculator/                       # Paquete Ballerina
├── calculator.bal                # Módulo principal — operaciones aritméticas
├── Ballerina.toml                # Manifiesto del paquete
├── tests/
│   └── lib_test.bal              # Pruebas unitarias (5 tests)
├── .devcontainer.json            # Configuración del contenedor (opcional)
├── target/                       # Compilados (generado por bal build/test)
└── README.md                     # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Ballerina incluye un **framework de pruebas integrado** en su herramienta `bal`:

1. Las funciones de prueba se marcan con la anotación `@test:Config {}`.
2. El comando `bal test` descubre automáticamente todas las funciones anotadas en el directorio `tests/`.
3. Las aserciones usan `test:assertEquals(actual, esperado, mensaje)`.
4. Soporta hooks de ciclo de vida: `@test:BeforeSuite`, `@test:AfterSuite`.

**EN:** Ballerina includes a **built-in test framework** in its `bal` tool:

1. Test functions are marked with the `@test:Config {}` annotation.
2. The `bal test` command automatically discovers all annotated functions in the `tests/` directory.
3. Assertions use `test:assertEquals(actual, expected, message)`.
4. Supports lifecycle hooks: `@test:BeforeSuite`, `@test:AfterSuite`.

### Ciclo de vida de pruebas / Test lifecycle

```text
@test:BeforeSuite  →  beforeSuiteFunc()    ← imprime "Starting Calculator suite"
       ↓
@test:Config       →  testAddition()       ← assertEquals(addition(2,3), 5)
@test:Config       →  testSubtraction()    ← assertEquals(subtraction(5,2), 3)
@test:Config       →  testMultiplication() ← assertEquals(multiplication(3,4), 12)
@test:Config       →  testDivision()       ← assertEquals(division(10,3), 3)
@test:Config       →  testModulus()        ← assertEquals(modulus(10,3), 1)
       ↓
@test:AfterSuite   →  afterSuiteFunc()     ← imprime "All tests are done!"
```

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `calculator.bal` — Módulo principal

**ES:** Contiene las 5 operaciones aritméticas. Las funciones `multiplication` y `division` usan sumas y restas repetitivas respectivamente (sin operadores `*` ni `/` directos), cumpliendo con la especificación educativa.

**EN:** Contains the 5 arithmetic operations. The `multiplication` and `division` functions use repeated addition and subtraction respectively (no direct `*` or `/` operators), complying with the educational specification.

```ballerina
public function addition(int a, int b) returns int {
    return a + b;
}

public function multiplication(int a, int b) returns int {
    int product = 0;
    foreach var i in 0..<b {
        product += a;
    }
    return product;
}

public function division(int a, int b) returns int {
    int quotient = 0;
    int remainder = a;
    while (remainder >= b) {
        remainder = subtraction(remainder, b);
        quotient = addition(quotient, 1);
    }
    return quotient;
}
```

### `tests/lib_test.bal` — Pruebas unitarias

**ES:** Usa el framework `ballerina/test` con anotaciones. Cada función de prueba llama a la función correspondiente del módulo `calculator` y verifica el resultado con `test:assertEquals`.

**EN:** Uses the `ballerina/test` framework with annotations. Each test function calls the corresponding `calculator` module function and verifies the result with `test:assertEquals`.

```ballerina
import ballerina/test;

@test:Config {}
function testAddition() {
    test:assertEquals(addition(2, 3), 5, "should be 5");
}

@test:Config {}
function testModulus() {
    test:assertEquals(modulus(10, 3), 1, "should be 1");
}
```

### `Ballerina.toml` — Manifiesto del paquete

**ES:** Declara el nombre del paquete, la organización y la versión. El directorio `tests/` es reconocido automáticamente por `bal test` como el contenedor de pruebas.

**EN:** Declares the package name, organization and version. The `tests/` directory is automatically recognized by `bal test` as the test container.

```toml
[package]
org = "yorche3"
name = "calculator"
version = "0.1.0"
distribution = "2201.13.4"
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Ballerina instalado

```bash
bal version
```

> **ES:** Descargar desde [ballerina.io](https://ballerina.io/downloads/) o usar `winget install Ballerina.Ballerina` (Windows).
> **EN:** Download from [ballerina.io](https://ballerina.io/downloads/) or use `winget install Ballerina.Ballerina` (Windows).

### Ejecutar pruebas unitarias / Run unit tests

```bash
bal test
```

**Salida esperada / Expected output:**

```text
Compiling source
yorche3/calculator:0.1.0

Running Tests
Starting Calculator suite

testAddition ...
PASSED

testSubtraction ...
PASSED

testMultiplication ...
PASSED

testDivision ...
PASSED

testModulus ...
PASSED

All tests are done!

5 passing
0 failing
```

> **ES:** Todas las pruebas deben pasar (5 PASSED, 0 FAILED) con código de salida 0.
> **EN:** All tests must pass (5 PASSED, 0 FAILED) with exit code 0.

---

## 🧠 Algoritmos / operaciones (según el módulo)

| Función / Function | Implementación / Implementation | Cumple / Complies |
|-------------------|-------------------------------|-------------------|
| `addition(a, b)` | `a + b` (suma directa / direct addition) | ✅ |
| `subtraction(a, b)` | `a - b` (resta directa / direct subtraction) | ✅ |
| `multiplication(a, b)` | Suma repetitiva de `a`, `b` veces con `foreach` / Repeated addition | ✅ No usa `*` |
| `division(a, b)` | Resta repetitiva con `while`: cuántas veces cabe `b` en `a` / Repeated subtraction | ✅ No usa `/` |
| `modulus(a, b)` | `a - multiplication(division(a, b), b)` | ✅ No usa `%` |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Ballerina descubre automáticamente los archivos dentro del directorio `tests/`. No es necesario registrarlos manualmente en una suite ni crear un punto de entrada.
- **EN:** Ballerina automatically discovers files inside the `tests/` directory. No manual registration in a suite or entry point is needed.
- **ES:** Las funciones `multiplication` y `division` están implementadas con sumas/restas repetitivas para cumplir la especificación educativa.
- **EN:** The `multiplication` and `division` functions are implemented with repeated addition/subtraction to comply with the educational specification.
- **ES:** Los hooks `@test:BeforeSuite` y `@test:AfterSuite` son opcionales; se usan aquí para mostrar el ciclo de vida de las pruebas.
- **EN:** The `@test:BeforeSuite` and `@test:AfterSuite` hooks are optional; they are used here to illustrate the test lifecycle.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
