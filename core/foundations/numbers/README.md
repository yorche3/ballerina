# Numbers — Ballerina

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Ballerina**, usando el framework de pruebas integrado (`bal test`) con anotaciones `@test:Config`.

Tres enfoques de implementación para los mismos 5 algoritmos: **recursivo directo**, **recursivo con acumulador** e **iterativo**.

> **ES:** Ballerina no tiene optimización de Tail Call (TCO), por lo que las funciones con acumulador (`Acc`) son puramente educativas.
> **EN:** Ballerina does not have Tail Call Optimization (TCO), so accumulator-based functions (`Acc`) are purely educational.

---

## 📂 Archivos / Files

### Raíz del proyecto / Project root

| Archivo | Propósito |
|---------|-----------|
| [`numbers.bal`](numbers.bal) | Módulo principal — 15 funciones (3 enfoques × 5 algoritmos). |
| [`Ballerina.toml`](Ballerina.toml) | Manifiesto del paquete — nombre (`numbers`), organización (`yorche3`), versión. |
| [`.gitignore`](.gitignore) | Ignora `target/` (compilados). |
| [`.devcontainer.json`](.devcontainer.json) | Configuración del contenedor de desarrollo (opcional). |
| [`README.md`](README.md) | Este archivo. |

### Pruebas / Tests (`tests/`)

| Archivo | Propósito |
|---------|-----------|
| `tests/numbers_recursive_test.bal` | 5 tests para el enfoque recursivo directo |
| `tests/numbers_iterative_test.bal` | 5 tests para el enfoque iterativo |

> **ES:** No hay tests separados para el enfoque con acumulador porque Ballerina no tiene TCO; su implementación es equivalente a la recursiva directa pero con acumulador.
> **EN:** There are no separate tests for the accumulator approach because Ballerina lacks TCO; its implementation is equivalent to direct recursion but with an accumulator.

---

## 🏗️ Enfoque / Approach

**ES:** Sigue el mismo patrón que [`calculator`](../unit_test/calculator/): un único módulo principal (`numbers.bal`) con funciones `public` y tests en `tests/` descubiertos automáticamente por `bal test`.

Las 15 funciones se organizan en 3 grupos por enfoque:

| Enfoque | Prefijo | Ejemplo |
|---------|---------|--------|
| Recursivo directo | `...Rec` | `fibonacciRec(n)` |
| Recursivo con acumulador | `...Acc` | `fibonacciAcc(n)` |
| Iterativo | `...Ite` | `fibonacciIte(n)` |

**EN:** Follows the same pattern as [`calculator`](../unit_test/calculator/): a single main module (`numbers.bal`) with `public` functions and tests in `tests/` automatically discovered by `bal test`.

The 15 functions are organized into 3 groups by approach:

| Approach | Prefix | Example |
|----------|--------|--------|
| Direct recursion | `...Rec` | `fibonacciRec(n)` |
| Accumulator recursion | `...Acc` | `fibonacciAcc(n)` |
| Iterative | `...Ite` | `fibonacciIte(n)` |

---

## 📄 Archivos clave / Key Files

### `numbers.bal` — Módulo principal

**ES:** Cada algoritmo tiene 3 implementaciones. Por ejemplo, `fibonacci`:

**EN:** Each algorithm has 3 implementations. For example, `fibonacci`:

```ballerina
// Enfoque recursivo directo / Direct recursion
public function fibonacciRec(int n) returns int {
    if (n == 0) { return 0; }
    if (n == 1) { return 1; }
    return fibonacciRec(n - 1) + fibonacciRec(n - 2);
}

// Enfoque con acumulador / Accumulator recursion
public function fibonacciAcc(int n) returns int {
    return fibonacciAccHelp(n, 0, 1);
}
function fibonacciAccHelp(int n, int acc1, int acc2) returns int {
    if (n == 0) { return acc1; }
    return fibonacciAccHelp(n - 1, acc2, acc1 + acc2);
}

// Enfoque iterativo / Iterative
public function fibonacciIte(int n) returns int {
    if (n <= 0) { return 0; }
    if (n == 1) { return 1; }
    int acc2 = 0;
    int acc1 = 1;
    foreach int i in 2...n {
        int temp = acc1;
        acc1 = acc1 + acc2;
        acc2 = temp;
    }
    return acc1;
}
```

### `tests/numbers_recursive_test.bal` — Pruebas del enfoque recursivo

**ES:** Cada función de prueba ejecuta múltiples aserciones. Por ejemplo:

**EN:** Each test function runs multiple assertions. For example:

```ballerina
@test:Config {}
function testFibonacciRec(){
    int n = 0;
    test:assertEquals(fibonacciRec(n), 0, "Should be 0");
    n = 1;
    test:assertEquals(fibonacciRec(n), 1, "Should be 1");
    n = 6;
    test:assertEquals(fibonacciRec(n), 8, "Should be 8");
}
```

---

## 🚀 Compilar y ejecutar / Build & Run

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

```
Compiling source
yorche3/numbers:0.1.0

Running Tests

Starting recursive test suite...
testSumOfFirstNRec ... PASSED
testFactorialRec ... PASSED
testFibonacciRec ... PASSED
testGreatestCommonDivisorRec ... PASSED
testLeastCommonMultipleRec ... PASSED

Starting Iterative test suite...
testSumOfFirstNIte ... PASSED
testFactorialIte ... PASSED
testFibonacciIte ... PASSED
testGreatestCommonDivisorIte ... PASSED
testLeastCommonMultipleIte ... PASSED

All tests completed.

10 passing
0 failing
0 skipped
```

> **ES:** 10 tests en total (5 recursivos + 5 iterativos), los acumuladores se prueban implícitamente al ser llamados por las funciones `Acc`.
> **EN:** 10 tests total (5 recursive + 5 iterative), accumulators are implicitly tested as they are called by the `Acc` functions.

---

## 📁 Estructura / Structure

```text
numbers/                          # Paquete Ballerina
├── numbers.bal                   # Módulo principal — 15 funciones
├── Ballerina.toml                # Manifiesto del paquete
├── tests/
│   ├── numbers_recursive_test.bal    # Tests recursivos (5)
│   └── numbers_iterative_test.bal    # Tests iterativos (5)
├── .devcontainer.json            # Configuración del contenedor (opcional)
├── .gitignore                    # Ignora target/
├── target/                       # Compilados (generado por bal build/test)
└── README.md                     # Este archivo
```

---

## 🧪 Algoritmos / Algorithms

### 3 enfoques × 5 algoritmos = 15 funciones / 10 tests

| Algoritmo | Casos de prueba | `Rec` | `Acc` | `Ite` |
|-----------|----------------|-------|-------|-------|
| `SumOfFirstN` | `(0) = 0`, `(3) = 6` | ✅ | ✅ | ✅ |
| `Factorial` | `(0) = 1`, `(4) = 24` | ✅ | ✅ | ✅ |
| `Fibonacci` | `(0) = 0`, `(1) = 1`, `(6) = 8` | ✅ | ✅ | ✅ |
| `GreatestCommonDivisor` | `(12, 8) = 4`, `(7, 5) = 1` | ✅ | ✅ | ✅ |
| `LeastCommonMultiple` | `(4, 6) = 12`, `(6, 8) = 24` | ✅ | ✅ | ✅ |

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## 📝 Notas / Notes

- **ES:** Ballerina no tiene TCO (Tail Call Optimization), por lo que las funciones con acumulador (`...Acc`) son equivalentes a las recursivas directas en consumo de pila. Se incluyen por coherencia educativa con las implementaciones en otros lenguajes del repositorio.
- **EN:** Ballerina lacks TCO (Tail Call Optimization), so accumulator-based functions (`...Acc`) are equivalent to direct recursion in stack usage. They are included for educational consistency with implementations in other languages in the repository.
- **ES:** Los parámetros de función en Ballerina son inmutables por defecto. La función `greatestCommonDivisorIte` usa variables locales (`x`, `y`) en lugar de reasignar los parámetros `a`, `b`.
- **EN:** Function parameters in Ballerina are immutable by default. The `greatestCommonDivisorIte` function uses local variables (`x`, `y`) instead of reassigning parameters `a`, `b`.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
