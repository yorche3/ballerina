# Naive Sort — Ballerina

Implementación de la especificación [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) en **Ballerina**, como paquete con pruebas unitarias integradas (`bal test`).

Implementation of the [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) specification in **Ballerina**, as a package with built-in unit tests (`bal test`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / File | Propósito / Purpose |
|---|---|
| [`naive_sort.bal`](naive_sort.bal) | Las tres funciones: `selectionSort`, `bubbleSort` e `insertionSort` |
| [`Ballerina.toml`](Ballerina.toml) | Manifiesto del paquete: `org`, nombre, versión y distribución |
| [`tests/lib_test.bal`](tests/lib_test.bal) | Suite de pruebas: 8 casos compartidos por los tres algoritmos |
| [`Dependencies.toml`](Dependencies.toml) | Dependencias resueltas por el gestor de paquetes |
| [`.devcontainer.json`](.devcontainer.json) | Entorno de desarrollo con la imagen oficial de Ballerina |
| [`.gitignore`](.gitignore) | Ignora `target/`, `generated/` y `Config.toml` |

**Estructura de directorios / Directory structure:**

```text
naive_sort/
├── naive_sort.bal        # Implementación / Implementation
├── Ballerina.toml        # Manifiesto / Manifest
├── Dependencies.toml     # Dependencias / Dependencies
├── .devcontainer.json
├── .gitignore
├── tests/
│   └── lib_test.bal      # Pruebas unitarias / Unit tests
└── target/               # Artefactos generados / Generated artifacts
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Mismo patrón de paquete que [`numbers`](../../foundations/numbers/README.md): `bal test` descubre automáticamente los archivos de `tests/` y ejecuta las funciones anotadas con `@test:Config`. A diferencia de `helloworld` o `hellouser`, este módulo es un paquete completo con `Ballerina.toml`.

**EN:** Same package pattern as [`numbers`](../../foundations/numbers/README.md): `bal test` automatically discovers the files under `tests/` and runs the functions annotated with `@test:Config`. Unlike `helloworld` or `hellouser`, this module is a full package with a `Ballerina.toml`.

### Convención de las funciones / Function contract

```ballerina
function selectionSort(int[]? arr) returns int[]?
function bubbleSort(int[]? arr) returns int[]?
function insertionSort(int[]? arr) returns int[]?
```

- `arr is ()` → retorna `()` (indicador de fallo / failure indicator).
- `arr` vacío o de un elemento → retorna el array sin cambios / returns the array unchanged.
- En cualquier otro caso → retorna el array ordenado ascendentemente / returns the array sorted ascending.

**ES:** Ballerina no permite `int[]` nulo, pero sí un tipo *nillable* `int[]?`. Ese es el indicador de fallo idiomático del lenguaje para el caso "entrada nula" de la especificación. El tipo devuelto también es `int[]?`, ya que la rama de fallo retorna `()`.

**EN:** Ballerina does not allow a null `int[]`, but it does allow the *nillable* type `int[]?`. That is the language's idiomatic failure indicator for the specification's "null input" case. The return type is also `int[]?`, since the failure branch returns `()`.

---

## 📄 Configuración clave / Key Configuration

| Archivo / File | Contenido / Content |
|---|---|
| `Ballerina.toml` | `org = "yorche3"`, `name = "naive_sort"`, `version = "0.1.0"`, `distribution = "2201.13.4"` |
| `Dependencies.toml` | Resolución de dependencias del paquete / Package dependency resolution |
| `.devcontainer.json` | Imagen `ballerina/ballerina-devcontainer:2201.13.4` y extensión `WSO2.ballerina` |

---

## 🚀 Compilación y ejecución / Build & Run

```bash
bal test     # Compila y ejecuta las pruebas / Compile and run the tests
bal build    # Solo compila el paquete / Build the package only
```

**Salida real / Actual output:**

```text
Compiling source
        yorche3/naive_sort:0.1.0

Running Tests

        naive_sort
Starting naive_sort test suite...
All tests completed.


                3 passing
                0 failing
                0 skipped

                Test execution time : 0.022s
```

---

## 🧠 Algoritmos / Algorithms

| Algoritmo / Algorithm | Estrategia / Strategy | Complejidad temporal / Time complexity | In-place |
|---|---|---|:---:|
| `selectionSort` | Busca el mínimo del resto no ordenado y lo ubica al inicio / Finds the minimum of the unsorted remainder and places it at the front | $O(n^2)$ siempre / always | ✅ |
| `bubbleSort` | Compara e intercambia adyacentes; corta antes con la bandera `swapped` / Compares and swaps adjacent elements; exits early with the `swapped` flag | $O(n^2)$ peor/promedio, $O(n)$ mejor / worst-average, best | ✅ |
| `insertionSort` | Construye el sub-array ordenado insertando cada elemento en su posición / Builds the sorted sub-array by inserting each element into place | $O(n^2)$ peor/promedio, $O(n)$ mejor / worst-average, best | ✅ |

### Casos cubiertos por las pruebas / Cases covered by the tests

Cada algoritmo verifica los mismos 8 casos (24 aserciones en total) / Each algorithm checks the same 8 cases (24 assertions total):

| Caso / Case | Entrada / Input | Salida esperada / Expected output |
|---|---|---|
| Desordenado / Unsorted | `[5, 2, 9, 1, 5, 6]` | `[1, 2, 5, 5, 6, 9]` |
| Ya ordenado / Already sorted | `[1, 2, 3, 4, 5]` | `[1, 2, 3, 4, 5]` |
| Orden inverso / Reverse order | `[5, 4, 3, 2, 1]` | `[1, 2, 3, 4, 5]` |
| Idénticos / Identical | `[7, 7, 7, 7]` | `[7, 7, 7, 7]` |
| Negativos / Negatives | `[3, -1, 4, -5, 0]` | `[-5, -1, 0, 3, 4]` |
| Un elemento / Single element | `[42]` | `[42]` |
| Vacío / Empty | `[]` | `[]` |
| Nulo / Nil | `()` | `()` (indicador de fallo / failure indicator) |

---

## 📝 Notas de implementación / Implementation Notes

### 🧬 La copia es responsabilidad de la implementación / The copy belongs to the implementation

**ES:** Como la función **devuelve** el array ordenado, corresponde a la implementación no destruir el array del llamador: cada algoritmo hace `int[] result = arr.clone()` y ordena esa copia. Por eso las pruebas pasan los fixtures compartidos directamente, sin clonar: hacerlo en el test enmascararía precisamente esa responsabilidad.

**EN:** Since the function **returns** the sorted array, it is the implementation's job not to destroy the caller's array: each algorithm does `int[] result = arr.clone()` and sorts that copy. That is why the tests pass the shared fixtures directly, without cloning: doing so in the test would mask exactly that responsibility.

### 🧪 Estructura de las pruebas / Test structure

**ES:** Las tres funciones comparten el mismo perfil, así que la suite las pasa a un único helper `assertAllCases(SortFunction sortFn, string algorithm)` mediante el tipo de función `SortFunction`. Los fixtures se declaran una sola vez a nivel de módulo y se reutilizan en los tres algoritmos, evitando duplicar los 8 casos. Cada test queda en una línea.

**EN:** All three functions share the same profile, so the suite passes them to a single `assertAllCases(SortFunction sortFn, string algorithm)` helper through the `SortFunction` function type. The fixtures are declared once at module level and reused by all three algorithms, avoiding duplication of the 8 cases. Each test is a single line.

```ballerina
type SortFunction function(int[]? arr) returns int[]?;

@test:Config {}
function testSelectionSort() {
    assertAllCases(selectionSort, "SelectionSort");
}
```

### ⚠️ Fixtures compartidos / Shared fixtures

**ES:** Los arrays en Ballerina son tipos por referencia, así que los fixtures a nivel de módulo se tratan como entradas de solo lectura. Esta decisión es coherente con el contrato del punto anterior: si una implementación mutara el array recibido, los tests posteriores dejarían de ser significativos. La verificación se hizo ejecutando la suite contra una implementación correcta y contra una deliberadamente rota, confirmando que la suite detecta el fallo.

**EN:** Ballerina arrays are reference types, so the module-level fixtures are treated as read-only inputs. This is consistent with the contract above: if an implementation mutated the received array, later tests would stop being meaningful. Verification was done by running the suite against a correct implementation and against a deliberately broken one, confirming the suite detects the failure.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

This project is also implemented in other languages. Explore the [main repository](https://github.com/yorche3/programming_languages) to see all the versions.

---

*[← Volver al Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
