# Data Structures Basics — Ballerina

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) en **Ballerina**, estructurada como un paquete nativo con pruebas unitarias integradas (`bal test`).

Implementation of the [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) specification in **Ballerina**, structured as a native package with built-in unit tests (`bal test`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / File | Propósito / Purpose |
|---|---|
| [`data_structures_basics.bal`](data_structures_basics.bal) | Implementación de las clases `Node`, `LinkedList`, `Stack`, `Queue` y la constante `Failure_Value` / Implementation of `Node`, `LinkedList`, `Stack`, `Queue` classes and `Failure_Value` constant |
| [`Ballerina.toml`](Ballerina.toml) | Manifiesto del paquete: organización, nombre, versión y distribución / Package manifest: organization, name, version, and distribution |
| [`Dependencies.toml`](Dependencies.toml) | Resolución de dependencias del paquete / Package dependency resolution |
| [`tests/lib_test.bal`](tests/lib_test.bal) | Suite de pruebas unitarias que cubre los casos de las 4 estructuras / Unit test suite covering all cases for the 4 data structures |
| [`.gitignore`](.gitignore) | Excluye artefactos generados de compilación (`target/`, etc.) / Ignores build artifacts (`target/`, etc.) |

**Estructura de directorios / Directory structure:**

```text
data_structures_basics/
├── data_structures_basics.bal   # Implementación principal / Main implementation
├── Ballerina.toml               # Manifiesto / Manifest
├── Dependencies.toml            # Dependencias / Dependencies
├── .gitignore                   # Exclusiones de Git / Git exclusions
└── tests/
    └── lib_test.bal             # Pruebas unitarias / Unit tests
```

**Desviación respecto a la ubicación esperada / Deviation from expected location:**

**ES:** La especificación propone `src/data_structures_basics.ext` y una carpeta `test/` (singular). En Ballerina, la convención canónica del compilador y del gestor de paquetes ubica los módulos en la raíz del paquete y las pruebas unitarias dentro del directorio obligatorio **`tests/`** (plural).

**EN:** The specification suggests `src/data_structures_basics.ext` and a `test/` (singular) directory. In Ballerina, canonical package layout places sources at the package root and unit tests inside the mandatory **`tests/`** (plural) directory.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El paquete se generó mediante la herramienta de línea de comandos de Ballerina (`bal new data_structures_basics`) y se aplanó en el directorio correspondiente. Las cuatro estructuras (`Node`, `LinkedList`, `Stack`, `Queue`) se implementaron manualmente mediante clases (`class`), garantizando que `Stack` y `Queue` mantengan sus propios punteros (`top`, o bien `front`/`rear`) sobre el mismo tipo `Node`, sin envolver ni delegar operaciones en `LinkedList`.

**EN:** The package was scaffolded using the Ballerina CLI tool (`bal new data_structures_basics`) and flattened in the target directory. The four structures (`Node`, `LinkedList`, `Stack`, `Queue`) were implemented manually using classes (`class`), ensuring that `Stack` and `Queue` manage their own pointers (`top`, or `front`/`rear`) on top of the shared `Node` type, without wrapping or delegating operations to `LinkedList`.

---

## 📄 Configuración clave / Key Configuration

| Archivo / File | Contenido / Content |
|---|---|
| `Ballerina.toml` | `org = "yorche3"`, `name = "data_structures_basics"`, `version = "0.1.0"`, `distribution = "2201.13.4"` |
| `Dependencies.toml` | Registro de dependencias resueltas por el compilador de Ballerina / Compiler dependency resolution record |

---

## 🚀 Compilación y ejecución / Build & Run

```bash
bal test     # Compila y ejecuta la suite de pruebas unitarias / Compile and run unit test suite
bal build    # Compila el paquete y genera el artefacto ejecutable / Build package and generate executable artifact
```

**Salida real / Actual output:**

```text
$ bal test
Compiling source
	yorche3/data_structures_basics:0.1.0

Running Tests

	data_structures_basics
Starting data_structures_basics test suite...
All tests completed.
		[pass] testLinkedList
		[pass] testNode
		[pass] testQueue
		[pass] testStack


		4 passing
		0 failing
		0 skipped

		Test execution time : 0.029s
```

**ES:** Salida copiada de la última ejecución real del 2026-09-27. El acta de evidencia del sprint se encuentra en [`docs/evidence/algorithms/data_structures_basics/ballerina.md`](https://github.com/yorche3/programming_languages/blob/main/docs/evidence/algorithms/data_structures_basics/ballerina.md).

**EN:** Output copied from the last real run on 2026-09-27. The sprint evidence record is at [`docs/evidence/algorithms/data_structures_basics/ballerina.md`](https://github.com/yorche3/programming_languages/blob/main/docs/evidence/algorithms/data_structures_basics/ballerina.md).

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.init` | `int → ()` | `O(1)` | Inicializa `value` y deja `next = ()` / Initializes `value` and leaves `next = ()`. |
| `Node.getValue` | `() → int` | `O(1)` | Observa el valor almacenado / Observes stored value. No muta / Does not mutate. |
| `Node.getNext` | `() → Node?` | `O(1)` | Devuelve el enlace al siguiente nodo o `()` / Returns link to next node or `()`. |
| `Node.setNext` | `Node? → ()` | `O(1)` | Actualiza el enlace siguiente / Updates next link. |
| `LinkedList.init` | `() → ()` | `O(1)` | Inicializa `head = ()`, `tail = ()`, `count = 0` / Initializes `head = ()`, `tail = ()`, `count = 0`. |
| `LinkedList.isEmpty` | `() → boolean` | `O(1)` | Evalúa si `count == 0` / Evaluates if `count == 0`. |
| `LinkedList.size` | `() → int` | `O(1)` | Devuelve el contador de elementos / Returns element count. |
| `LinkedList.getHead` | `() → int` | `O(1)` | Devuelve el valor del nodo cabeza o `Failure_Value` (-1) si está vacía / Returns head node value or `Failure_Value` (-1) if empty. |
| `LinkedList.insertHead` | `int → ()` | `O(1)` | Inserta al inicio y actualiza `tail` si estaba vacía / Inserts at head, updates `tail` if empty. |
| `LinkedList.insertTail` | `int → ()` | `O(1)` | Inserta al final y actualiza `head` si estaba vacía / Inserts at tail, updates `head` if empty. |
| `LinkedList.delete` | `int → boolean` | `O(n)` | Elimina la primera aparición del valor; retorna `true` si lo eliminó o `false` si no existe / Deletes first occurrence of value; returns `true` if deleted or `false` if absent. |
| `Stack.init` | `() → ()` | `O(1)` | Inicializa `top = ()`, `count = 0` / Initializes `top = ()`, `count = 0`. |
| `Stack.isEmpty` | `() → boolean` | `O(1)` | Evalúa si `count == 0` / Evaluates if `count == 0`. |
| `Stack.size` | `() → int` | `O(1)` | Devuelve el contador de elementos / Returns element count. |
| `Stack.push` | `int → ()` | `O(1)` | Inserta un nuevo nodo en la cima (`top`) / Pushes new node to top. |
| `Stack.peek` | `() → int` | `O(1)` | Observa el valor en `top` sin mutar; `Failure_Value` (-1) si está vacía / Peeks top value without mutating; `Failure_Value` (-1) if empty. |
| `Stack.pop` | `() → int` | `O(1)` | Extrae y devuelve el valor de `top`; `Failure_Value` (-1) si está vacía / Pops and returns top value; `Failure_Value` (-1) if empty. |
| `Queue.init` | `() → ()` | `O(1)` | Inicializa `front = ()`, `rear = ()`, `count = 0` / Initializes `front = ()`, `rear = ()`, `count = 0`. |
| `Queue.isEmpty` | `() → boolean` | `O(1)` | Evalúa si `count == 0` / Evaluates if `count == 0`. |
| `Queue.size` | `() → int` | `O(1)` | Devuelve el contador de elementos / Returns element count. |
| `Queue.enqueue` | `int → ()` | `O(1)` | Inserta un nodo tras `rear`; actualiza `front` si estaba vacía / Enqueues node after `rear`; updates `front` if empty. |
| `Queue.peek` | `() → int` | `O(1)` | Observa el valor en `front` sin mutar; `Failure_Value` (-1) si está vacía / Peeks front value without mutating; `Failure_Value` (-1) if empty. |
| `Queue.dequeue` | `() → int` | `O(1)` | Extrae y devuelve el valor de `front`; `Failure_Value` (-1) si está vacía; limpia `rear` si queda vacía / Dequeues and returns front value; `Failure_Value` (-1) if empty; clears `rear` if empty. |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Indicador de fallo constante `Failure_Value = -1` / Constant failure indicator `Failure_Value = -1` | Retornar unión con error (`int\|error`) o `int?` (`nil`) / Return error union (`int\|error`) or `int?` (`nil`) | El contrato de la fase temprana prohíbe retornos monádicos y exige un centinela básico no ambiguo que no colisione con las entradas de prueba positivas / Early-phase contract forbids monadic returns and requires a non-ambiguous sentinel value that does not collide with positive test inputs. |
| Clases (`class`) con campos privados para los ADTs / Classes (`class`) with private fields for ADTs | Registros (`record`) con funciones externas / Records (`record`) with external functions | Las clases permiten encapsular el estado (`head`, `tail`, `top`, `front`, `rear`, `count`) y exponer una API orientada a objetos idiomática / Classes encapsulate internal state (`head`, `tail`, `top`, `front`, `rear`, `count`) and provide an idiomatic object-oriented API. |
| Ausencia de enlace representada con `Node?` y `()` / Link absence represented with `Node?` and `()` | Centinela especial o nodo nulo / Special sentinel or null dummy node | `()` es la representación nativa de nil/ausencia en el sistema de tipos de Ballerina / `()` is the native representation of nil/absence in Ballerina's type system. |
| Un único tipo `Node` compartido / Single shared `Node` type | Tipos de nodo independientes para cada ADT / Distinct node types per ADT | La especificación estipula que `Node` es la unidad mínima compartida; cada estructura maneja sus propios punteros sin duplicar la definición de nodo / Specification mandates `Node` as the shared unit; each structure manages its own pointers without duplicating the node definition. |
| Métodos en `camelCase` (`getValue`, `insertHead`) / Methods in `camelCase` (`getValue`, `insertHead`) | Nombres en `snake_case` / Names in `snake_case` | `camelCase` es la convención canónica de nombres de métodos y funciones en Ballerina / `camelCase` is the canonical naming convention for methods and functions in Ballerina. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init(value)` y `init()` como funciones libres o métodos conceptuales / `init(value)` and `init()` as free functions or conceptual methods | Constructores `public function init(...)` de clase / Class constructor methods `public function init(...)` | En Ballerina, `init` es la palabra reservada para inicializar instancias de clase al invocarse con `new (...)` / In Ballerina, `init` is the reserved method name for instance initialization invoked by `new (...)`. |
| Nombres de métodos en `snake_case` (`get_head`, `insert_head`, etc.) / Method names in `snake_case` (`get_head`, `insert_head`, etc.) | Nombres en `camelCase` (`getHead`, `insertHead`, etc.) / Method names in `camelCase` (`getHead`, `insertHead`, etc.) | Convención idiomática estándar de Ballerina / Standard idiomatic convention in Ballerina. |
| Ausencia nativa de enlace / Native link absence | Tipo opcional `Node?` con valor `()` / Optional type `Node?` with `()` value | Forma idiomática en Ballerina para representar referencias opcionales sin punteros nulos inseguros / Idiomatic way in Ballerina to represent optional references without unsafe null pointers. |
| Indicador de fallo en extracciones sobre vacío / Failure indicator on empty extractions | `Failure_Value = -1` | Compatible con el tipo de retorno entero sin recurrir a tipos monádicos o excepciones en esta fase del monorepo / Compatible with integer return type without resorting to monadic types or exceptions in this monorepo phase. |
| Entrada nula a las estructuras (`LinkedList`, etc.) / Null input to structures (`LinkedList`, etc.) | No representable como entrada / Not representable as input | En Ballerina las instancias de clases son tipos no nillables (`LinkedList`) salvo que se anoten explícitamente (`LinkedList?`). Las pruebas utilizan instancias válidas inicializadas / In Ballerina class instances are non-nillable types by default (`LinkedList`). Tests operate on valid initialized instances. |
| Ubicación esperada `src/` y `test/` / Expected location `src/` and `test/` | Raíz del paquete y `tests/` / Package root and `tests/` | Estructura exigida por el compilador y test runner de Ballerina (`bal test`) / Layout required by Ballerina compiler and test runner (`bal test`). |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `Node.init` | No aplica: inicialización / Not applicable: initialization | — | — |
| `LinkedList.getHead` | Lista vacía / Empty list | `Failure_Value` (`-1`) | `list.getHead() == -1` |
| `LinkedList.delete` | Valor ausente en la lista / Value absent from list | `false` | `list.delete(99) == false` |
| `Stack.peek` | Pila vacía / Empty stack | `Failure_Value` (`-1`) | `s.peek() == -1` |
| `Stack.pop` | Pila vacía / Empty stack | `Failure_Value` (`-1`) | `s.pop() == -1` |
| `Queue.peek` | Cola vacía / Empty queue | `Failure_Value` (`-1`) | `q.peek() == -1` |
| `Queue.dequeue` | Cola vacía / Empty queue | `Failure_Value` (`-1`) | `q.dequeue() == -1` |
| Entrada nula o inválida / Null or invalid input | No representable para instancias de ADT / Not representable for ADT instances | — | Las instancias son referencias no anulables por defecto en Ballerina / Instances are non-nullable references by default in Ballerina. |

---

## ✅ Cobertura de pruebas / Test coverage

**ES:** La salida real certifica **4 pruebas** (una por estructura ADT) y **4 exitosas**, ejecutadas por `bal test`.

**EN:** The real output certifies **4 tests** (one per ADT structure) and **4 passing**, run by `bal test`.

### `Node` — `testNode` (`tests/lib_test.bal`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Inicializar y observar valor/enlace<br>Initialize and observe value/link | Sí / Yes | `testNode` | Comprueba `getValue() == 10` y `getNext() == ()` / Checks `getValue() == 10` and `getNext() == ()`. |
| Inicializar otro nodo, enlazar y recorrer<br>Initialize another node, link, and traverse | Sí / Yes | `testNode` | Comprueba `setNext(b)` y recorrido hasta nodo `20` / Checks `setNext(b)` and traversal to node `20`. |

### `LinkedList` — `testLinkedList` (`tests/lib_test.bal`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Estado vacío<br>Empty state | Sí / Yes | `testLinkedList` | `isEmpty() == true`, `size() == 0`, `getHead() == -1`. |
| Insertar por ambos extremos<br>Insert at both ends | Sí / Yes | `testLinkedList` | Inserciones sucesivas; `size() == 4`, `getHead() == 5` / Successive insertions; `size() == 4`, `getHead() == 5`. |
| Eliminar primera aparición<br>Delete first occurrence | Sí / Yes | `testLinkedList` | Elimina valor `10`; tamaño pasa a `3` y cabeza se conserva en `5` / Deletes value `10`; size becomes `3` and head stays `5`. |
| Valor ausente<br>Absent value | Sí / Yes | `testLinkedList` | `delete(99) == false`; estado y tamaño inalterados / `delete(99) == false`; state and size unchanged. |
| Vaciar<br>Emptying list | Sí / Yes | `testLinkedList` | Eliminación de nodos restantes; vuelve a `isEmpty() == true` y `getHead() == -1` / Removal of remaining nodes; returns to `isEmpty() == true` and `getHead() == -1`. |

### `Stack` — `testStack` (`tests/lib_test.bal`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Estado vacío y extracción fallida<br>Empty state and failed extraction | Sí / Yes | `testStack` | `peek() == -1`, `pop() == -1`, estado vacío preservado / `peek() == -1`, `pop() == -1`, empty state preserved. |
| LIFO y peek no mutante<br>LIFO and non-mutating peek | Sí / Yes | `testStack` | `push` de 10, 20, 30; `peek() == 30`, `size() == 3` / `push` of 10, 20, 30; `peek() == 30`, `size() == 3`. |
| Extracción y reutilización<br>Extraction and reuse | Sí / Yes | `testStack` | `pop` de 30, `push` de 40, vaciado sucesivo (40, 20, 10) / `pop` of 30, `push` of 40, successive emptying (40, 20, 10). |
| Vacío tras extracción<br>Empty after extraction | Sí / Yes | `testStack` | `pop() == -1`, permanece vacía con tamaño 0 / `pop() == -1`, stays empty with size 0. |

### `Queue` — `testQueue` (`tests/lib_test.bal`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Estado vacío y extracción fallida<br>Empty state and failed extraction | Sí / Yes | `testQueue` | `peek() == -1`, `dequeue() == -1`, estado vacío preservado / `peek() == -1`, `dequeue() == -1`, empty state preserved. |
| FIFO y peek no mutante<br>FIFO and non-mutating peek | Sí / Yes | `testQueue` | `enqueue` de 10, 20, 30; `peek() == 10`, `size() == 3` / `enqueue` of 10, 20, 30; `peek() == 10`, `size() == 3`. |
| Extracción y reutilización<br>Extraction and reuse | Sí / Yes | `testQueue` | `dequeue` de 10, `enqueue` de 40, vaciado sucesivo (20, 30, 40) / `dequeue` of 10, `enqueue` of 40, successive emptying (20, 30, 40). |
| Vacío tras extracción<br>Empty after extraction | Sí / Yes | `testQueue` | `dequeue() == -1`, permanece vacía con tamaño 0 / `dequeue() == -1`, stays empty with size 0. |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Gestión de memoria automática por GC / Automatic GC memory management | Los nodos desenlazados no se liberan manualmente / Unlinked nodes are not manually freed | Ballerina se ejecuta sobre la JVM y cuenta con recolección de basura automática; no se requieren destructores manuales / Ballerina runs on the JVM with automatic garbage collection; no manual destructors are needed. |
| Tipos de entero fijos (`int`) / Fixed integer types (`int`) | Las estructuras almacenan enteros de 64 bits con signo / Structures store 64-bit signed integers | Suficiente para el alcance pedagógico de estructuras de datos básicas; tipos genéricos o polimórficos se abordan en fases posteriores / Sufficient for the pedagogical scope of basic data structures; generic or polymorphic types are addressed in later phases. |

---

## 📝 Notas de implementación / Implementation Notes

### 🧱 Independencia de ADTs / ADT Independence

**ES:** `LinkedList`, `Stack` y `Queue` son tres clases completamente desacopladas que operan sobre la misma clase `Node`. Ninguna estructura envuelve a otra ni delega operaciones en ella, cumpliendo estrictamente con el principio conceptual de la especificación.

**EN:** `LinkedList`, `Stack`, and `Queue` are three completely decoupled classes operating on the shared `Node` class. No structure wraps another nor delegates operations to it, strictly adhering to the conceptual principle of the specification.

### 🧪 Aislamiento de pruebas / Test Isolation

**ES:** Cada prueba unitaria en `tests/lib_test.bal` instancia una estructura fresca a través de su constructor y ejecuta paso a paso el escenario sin reiniciar la instancia, validando la persistencia y transición del estado interno.

**EN:** Each unit test in `tests/lib_test.bal` instantiates a fresh structure via its constructor and executes the scenario step by step without resetting the instance, verifying internal state persistence and transitions.

### 🌐 Otras implementaciones / Other implementations

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

**EN:** This project is also implemented in other languages. Explore the [main repository](https://github.com/yorche3/programming_languages) to see all the versions.

---

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README / Native suite was executed and its real output is copied into this README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón) / Each specification case has its row in _Test coverage_ (or `Omitted` with reason).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_ / Each deviation from pseudocode or expected location is in _Idiomatic adaptations_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_ / Each operation with potential failure is in _Failure indicators_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas / No author absolute paths, credentials, or fabricated outputs.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe / Relative links resolve within repository and document is bilingual.
- [x] Ninguna sección repite lo que ya dice la especificación / No section repeats what the specification already states.

---

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`06_Data_Structures_Basics.md`](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) |
| Acta de evidencia / Evidence record | [`docs/evidence/algorithms/data_structures_basics/ballerina.md`](https://github.com/yorche3/programming_languages/blob/main/docs/evidence/algorithms/data_structures_basics/ballerina.md) |
| Módulo homologado del lenguaje / Homologated module | [`../naive_sort/README.md`](../naive_sort/README.md) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](https://yorche3.github.io/programming_languages/core/00_Project_Initialization_Guide/) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](https://yorche3.github.io/programming_languages/AGENT_Template/) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](https://yorche3.github.io/programming_languages/WORKFLOW/) |
| Plantilla del README / README template | [`README_Template.md`](https://yorche3.github.io/programming_languages/README_Template/) |
| Documentación oficial del lenguaje / Language official docs | [Ballerina Language Documentation](https://ballerina.io/learn/) |

---

*[← Volver al Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
