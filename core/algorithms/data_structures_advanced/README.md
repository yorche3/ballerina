# Data Structures Advanced — Ballerina

Implementación de la especificación [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) en **Ballerina**, estructurada como un paquete nativo con pruebas unitarias integradas (`bal test`).

Implementation of the [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) specification in **Ballerina**, structured as a native package with built-in unit tests (`bal test`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / File | Propósito / Purpose |
|---|---|
| [`data_structures_advanced.bal`](data_structures_advanced.bal) | Implementación de las clases `TreeNode`, `BinaryTree`, `GraphNode`, `Graph` y el registro `NeighborNode` / Implementation of `TreeNode`, `BinaryTree`, `GraphNode`, `Graph` classes and `NeighborNode` record |
| [`Ballerina.toml`](Ballerina.toml) | Manifiesto del paquete: organización, nombre, versión y distribución / Package manifest: organization, name, version, and distribution |
| [`Dependencies.toml`](Dependencies.toml) | Registro de dependencias resueltas por el compilador de Ballerina / Compiler dependency resolution record |
| [`tests/lib_test.bal`](tests/lib_test.bal) | Suite de pruebas unitarias parametrizadas con 23 casos de prueba / Parameterized unit test suite covering 23 test cases |
| [`.devcontainer.json`](.devcontainer.json) | Configuración de contenedor de desarrollo / Dev container configuration |
| [`.gitignore`](.gitignore) | Excluye artefactos de compilación (`target/`, etc.) / Ignores build artifacts (`target/`, etc.) |

**Estructura de directorios / Directory structure:**

```text
data_structures_advanced/
├── data_structures_advanced.bal   # Implementación principal / Main implementation
├── Ballerina.toml                 # Manifiesto / Manifest
├── Dependencies.toml              # Dependencias / Dependencies
├── .devcontainer.json             # Contenedor opcional / Optional dev container
├── .gitignore                     # Exclusiones de Git / Git exclusions
└── tests/
    └── lib_test.bal               # Pruebas unitarias / Unit tests
```

**Desviación respecto a la ubicación esperada / Deviation from expected location:**

**ES:** La especificación propone `src/data_structures_advanced.ext` y una carpeta `test/` (singular). En Ballerina, la convención canónica del compilador y del gestor de paquetes ubica los archivos fuentes en la raíz del paquete y las pruebas unitarias dentro del directorio obligatorio **`tests/`** (plural).

**EN:** The specification suggests `src/data_structures_advanced.ext` and a `test/` (singular) directory. In Ballerina, canonical package layout places sources at the package root and unit tests inside the mandatory **`tests/`** (plural) directory.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El paquete se generó mediante la herramienta CLI de Ballerina (`bal new data_structures_advanced`) y se adaptó a la estructura plana canónica del monorepo. La reutilización del valor de la base `Node` se realiza mediante **valor embebido** (composición interna en `TreeNode` y `GraphNode`), donde cada clase valida y administra sus propios enlaces y estado interno. El registro canónico de vértices de `Graph` y la lista de vecinos de adyacencia ordenada `NeighborNode` se implementan de forma completamente manual mediante referencias enlazadas, sin recurrir a mapas, diccionarios ni colecciones externas.

**EN:** The package was scaffolded using the Ballerina CLI tool (`bal new data_structures_advanced`) and adapted to the monorepo's canonical flat package structure. Reuse of the `Node` base value is achieved via an **embedded value** pattern (internal composition inside `TreeNode` and `GraphNode`), where each child class validates and manages its own links and internal state. The canonical linked vertex registry of `Graph` and the sorted adjacency list `NeighborNode` are implemented completely manually with linked references, without delegating to maps, dictionaries, or external collections.

---

## 📄 Configuración clave / Key Configuration

| Archivo / File | Contenido / Content |
|---|---|
| `Ballerina.toml` | `org = "yorche3"`, `name = "data_structures_advanced"`, `version = "0.1.0"`, `distribution = "2201.13.4"`, `observabilityIncluded = true` |
| `Dependencies.toml` | Registro de resolución de dependencias del compilador de Ballerina / Ballerina compiler dependency resolution lockfile |

---

## 🚀 Compilación y ejecución / Build & Run

```bash
bal build    # Compila el paquete y genera el binario ejecutable / Build package and generate executable binary
bal test     # Ejecuta la suite de pruebas unitarias / Run unit test suite
```

**Salida real / Actual output:**

```text
$ bal test
Compiling source
	yorche3/data_structures_advanced:0.1.0

Running Tests

	data_structures_advanced


		23 passing
		0 failing
		0 skipped

		Test execution time : 0.042s
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `TreeNode.init` | `int → ()` | `O(1)` | Inicializa `value`; enlaces `left = ()`, `right = ()` / Initializes `value`; links `left = ()`, `right = ()`. |
| `TreeNode.getValue` | `() → int` | `O(1)` | Observa el valor almacenado / Observes stored value. |
| `TreeNode.getLeft` | `() → TreeNode?` | `O(1)` | Devuelve subárbol izquierdo o `()` / Returns left subtree or `()`. |
| `TreeNode.getRight` | `() → TreeNode?` | `O(1)` | Devuelve subárbol derecho o `()` / Returns right subtree or `()`. |
| `TreeNode.setLeft` | `TreeNode? → ()` | `O(1)` | Actualiza subárbol izquierdo / Updates left subtree. |
| `TreeNode.setRight` | `TreeNode? → ()` | `O(1)` | Actualiza subárbol derecho / Updates right subtree. |
| `BinaryTree.init` | `() → ()` | `O(1)` | Inicializa `root = ()`, `count = 0` / Initializes `root = ()`, `count = 0`. |
| `BinaryTree.insert` | `int → ()` | `O(h)` | Inserción iterativa en ABB; `count + 1` si es nuevo; duplicados no alteran tamaño / Iterative BST insertion; `count + 1` if new; duplicates preserve size. |
| `BinaryTree.contains` | `int → boolean` | `O(h)` | Búsqueda iterativa siguiendo invariante ABB / Iterative search following BST invariant. |
| `BinaryTree.isEmpty` | `() → boolean` | `O(1)` | Evalúa si `count == 0` / Evaluates if `count == 0`. |
| `BinaryTree.size` | `() → int` | `O(1)` | Devuelve cantidad de nodos / Returns node count. |
| `GraphNode.init` | `int → ()` | `O(1)` | Inicializa `value`, `neighbours = ()`, `nextVertex = ()` / Initializes `value`, `neighbours = ()`, `nextVertex = ()`. |
| `Graph.init` | `() → ()` | `O(1)` | Inicializa `vertices = ()`, `vertexTotal = 0`, `edges = 0` / Initializes `vertices = ()`, `vertexTotal = 0`, `edges = 0`. |
| `Graph.addVertex` | `int → ()` | `O(V)` | Registro enlazado idempotente de vértices; `vertexTotal + 1` si es nuevo / Idempotent linked vertex registration; `vertexTotal + 1` if new. |
| `Graph.addEdge` | `(int, int) → boolean` | `O(V + d(u))` | Exige extremos existentes; inserción ordenada en `NeighborNode`; bucles y duplicados soportados / Requires endpoints to exist; sorted insertion in `NeighborNode`; self-loops and duplicates supported. |
| `Graph.hasEdge` | `(int, int) → boolean` | `O(V + d(u))` | Búsqueda manual sobre lista ordenada de vecinos / Manual search over sorted neighbour list. |
| `Graph.getNeighbors` | `int → int[]?` | `O(V + d(u))` | Retorna copia de vecinos ordenados o `()` si `u` no existe / Returns copy of sorted neighbours or `()` if `u` is absent. |
| `Graph.isEmpty` | `() → boolean` | `O(1)` | Evalúa si `vertices == ()` / Evaluates if `vertices == ()`. |
| `Graph.vertexCount` | `() → int` | `O(1)` | Devuelve cantidad de vértices / Returns vertex count. |
| `Graph.edgeCount` | `() → int` | `O(1)` | Devuelve cantidad de aristas / Returns edge count. |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Reutilización de valor mediante valor embebido / Base value reuse via embedded value | Herencia de clases (`class TreeNode extends Node`) / Class inheritance (`class TreeNode extends Node`) | Ballerina soporta encapsulación directa con campos privados y métodos observadores; el valor embebido cumple la especificación simplificando el grafo de tipos sin sobrecarga innecesaria / Ballerina supports direct encapsulation with private fields and observer methods; embedded value complies with specification simplifying the type hierarchy without unnecessary overhead. |
| Ausencia de enlace representada como `()` con tipos anulables (`TreeNode?`, `int[]?`) / Absent links represented as `()` with nullable types (`TreeNode?`, `int[]?`) | Centinelas especiales (-1, nodo dummy) o tipos `Result/Error` / Special sentinels (-1, dummy node) or `Result/Error` types | `()` (`nil`) es la representación nativa idiomática del sistema de tipos de Ballerina para la ausencia de valor o referencia opcional / `()` (`nil`) is the native idiomatic representation in Ballerina's type system for absence of value or optional references. |
| Lista de vecinos enlazada manual con `NeighborNode` record / Manual linked neighbour list with `NeighborNode` record | Arrays nativos mutables `int[]` o listas de biblioteca / Native mutable arrays `int[]` or library lists | El contrato exige inserción ordenada y búsqueda manual con enlaces propios, reservando la conversión a array (`int[]`) únicamente como copia aislada defensiva para el retorno de `getNeighbors` / Contract requires manual sorted insertion and traversal using own links, reserving array conversion (`int[]`) only as a defensive isolated copy for `getNeighbors` return. |
| Registro de vértices mediante lista enlazada propia (`nextVertex`) / Vertex registry via own linked list (`nextVertex`) | `map<GraphNode>` o tabla hash / `map<GraphNode>` or hash table | Cumple estrictamente con la restricción del módulo de no delegar el registro en tablas hash o diccionarios, manteniendo la complejidad contractual `O(V)` / Strictly satisfies module constraint against delegating vertex registry to hash tables or dictionaries, preserving contractual `O(V)` complexity. |
| Métodos en convención `camelCase` / Methods in `camelCase` convention | Nombres en `snake_case` / `snake_case` naming | `camelCase` es la convención idiomática establecida en Ballerina para funciones y métodos / `camelCase` is the idiomatic standard in Ballerina for functions and methods. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| Ausencia de enlaces (`left is absent`, `root is absent`) / Absence of links (`left is absent`, `root is absent`) | Valor `()` en tipos anulables (`TreeNode?`, `NeighborNode?`, `GraphNode?`) / `()` value in nullable types (`TreeNode?`, `NeighborNode?`, `GraphNode?`) | Representación nativa y segura de ausencia de referencia en Ballerina / Native, type-safe representation of reference absence in Ballerina. |
| `get_neighbors(u)` falla cuando `u` no existe / `get_neighbors(u)` fails when `u` is absent | Retorna `()` (`nil`) con tipo de retorno `int[]?` / Returns `()` (`nil`) with return type `int[]?` | Distingue de forma inequívoca el fallo por vértice ausente (`()`) del caso de vértice existente aislado con secuencia vacía (`[]`) / Unambiguously distinguishes failure due to missing vertex (`()`) from existing isolated vertex with empty sequence (`[]`). |
| Inmutabilidad de la secuencia devuelta por `get_neighbors` / Immutability of sequence returned by `get_neighbors` | Construcción de nuevo array (`int[] neighbors = []`) en cada invocación / Construction of a fresh array (`int[] neighbors = []`) on each call | Asegura el aislamiento defensivo: modificaciones sobre el array retornado no mutan el estado interno del grafo ni se ven afectadas por adiciones posteriores / Ensures defensive isolation: modifications to the returned array do not mutate internal graph state nor are affected by subsequent additions. |
| Métodos en `snake_case` (`get_value`, `set_left`, `has_edge`, etc.) / Methods in `snake_case` (`get_value`, `set_left`, `has_edge`, etc.) | Convención `camelCase` (`getValue`, `setLeft`, `hasEdge`, etc.) / `camelCase` convention (`getValue`, `setLeft`, `hasEdge`, etc.) | Convención de nombrado canónica del lenguaje Ballerina / Canonical naming convention of the Ballerina language. |
| Ubicación esperada `src/` y `test/` / Expected location `src/` and `test/` | Raíz del paquete y `tests/` / Package root and `tests/` | Estructura canónica impuesta por el compilador y runner nativo de Ballerina (`bal test`) / Canonical layout mandated by Ballerina compiler and native test runner (`bal test`). |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `TreeNode.init`, observadores y mutadores | Sin fallo por contrato / No contractual failure | — | — |
| `BinaryTree.contains` | Valor ausente en el árbol / Value absent from tree | `false` | `tree.contains(99) == false` |
| `Graph.addEdge` | Uno o ambos vértices `u`, `v` no existen / Either vertex `u` or `v` does not exist | `false` | `graph.addEdge(10, 99) == false` |
| `Graph.hasEdge` | Arista ausente o vértices inexistentes / Missing edge or missing vertices | `false` | `graph.hasEdge(10, 99) == false` |
| `Graph.getNeighbors` | Vértice `u` no existe / Vertex `u` does not exist | `()` (`nil`) | `graph.getNeighbors(99) == ()` |
| Entrada nula a estructuras / Null input to structures | No representable para tipos primitivos (`int`) o instancias de clase / Not representable for primitive types (`int`) or class instances | — | Las instancias son referencias no anulables por defecto en Ballerina / Instances are non-nullable references by default in Ballerina. |

---

## ✅ Cobertura de pruebas / Test coverage

**ES:** La salida real certifica **23 pruebas passing** ejecutadas por `bal test` mediante data providers parametrizados en `tests/lib_test.bal`.

**EN:** The real output certifies **23 passing tests** executed by `bal test` via parameterized data providers in `tests/lib_test.bal`.

### `TreeNode` (`testTreeNode`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Crear un nodo de árbol / Create a tree node | Sí / Yes | `testTreeNode` (`createNode`) | Inicializa con 10 y comprueba `getValue() == 10` / Initializes with 10 and verifies `getValue() == 10`. |
| Enlaces iniciales ausentes / Absent initial links | Sí / Yes | `testTreeNode` (`absentInitialLinks`) | Comprueba `getLeft() == ()` y `getRight() == ()` / Verifies `getLeft() == ()` and `getRight() == ()`. |
| Enlazar dos hijos / Link two children | Sí / Yes | `testTreeNode` (`linkChildren`) | Enlaza hijos 20 y 30 y observa sus valores / Links children 20 and 30 and observes their values. |
| Recorrer cada enlace / Traverse each link | Sí / Yes | `testTreeNode` (`traverseLinks`) | Recorre enlaces de hijos verificando enlaces hijos ausentes / Traverses child links verifying children's links are absent. |
| Desenlazar hijos / Unlink children | Sí / Yes | `testTreeNode` (`unlinkChildren`) | Desvincula hijo izquierdo y luego derecho con `()` preservando valor / Unlinks left then right child with `()` preserving value. |
| Adaptación inmutable / Immutable adaptation | Omitido / Omitted | — | No aplica: `TreeNode` es mutable por diseño de clase / Not applicable: `TreeNode` is mutable by class design. |

### `BinaryTree` (`testBinaryTree`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Crear vacío / Create empty | Sí / Yes | `testBinaryTree` (`createEmpty`) | `isEmpty() == true`, `size() == 0`, `contains(50) == false`. |
| Insertar la raíz / Insert the root | Sí / Yes | `testBinaryTree` (`insertRoot`) | Inserta 50; `size() == 1`, `isEmpty() == false`, `contains(50) == true`. |
| Insertar menor y mayor / Insert lower and higher | Sí / Yes | `testBinaryTree` (`insertLowerAndHigher`) | Inserta 50, 30, 70; `size() == 3`, comprueba pertenencia de los tres / Inserts 50, 30, 70; `size() == 3`, checks membership of all three. |
| Ramas de varios niveles / Multilevel branches | Sí / Yes | `testBinaryTree` (`multilevelBranches`) | Inserta 50, 30, 70, 20, 40; `size() == 5`, verifica todos / Inserts 50, 30, 70, 20, 40; `size() == 5`, verifies all. |
| Valor ausente en árbol no vacío / Missing value in nonempty tree | Sí / Yes | `testBinaryTree` (`missingValue`) | Inserta 50; `contains(99) == false`, `size() == 1`, `contains(50) == true`. |
| Duplicado idempotente / Idempotent duplicate | Sí / Yes | `testBinaryTree` (`idempotentDuplicate`) | Inserta 50, 30, 70, 30; `size() == 3`, mantiene los tres valores / Inserts 50, 30, 70, 30; `size() == 3`, retains all three values. |
| Inserciones ordenadas / Ordered insertions | Sí / Yes | `testBinaryTree` (`orderedInsertions`) | Inserta 20, 30, 40, 50, 70 en orden; `size() == 5`, `contains(99) == false`. |

### `Graph` (`testGraph`)

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|:--:|---|---|
| Crear vacío / Create empty | Sí / Yes | `testGraph` (`createEmpty`) | `isEmpty() == true`, `vertexCount() == 0`, `edgeCount() == 0`, `hasEdge` y `getNeighbors` fallan / `hasEdge` and `getNeighbors` fail. |
| Vértice aislado / Isolated vertex | Sí / Yes | `testGraph` (`isolatedVertex`) | `addVertex(10)`; 1 vértice, 0 aristas, `getNeighbors(10) == []`. |
| Etiquetas no consecutivas y arista dirigida / Nonconsecutive labels and directed edge | Sí / Yes | `testGraph` (`nonconsecutiveDirectedEdge`) | Registra 10, 70; `addEdge(10, 70)`; `hasEdge(10, 70) == true`, `hasEdge(70, 10) == false`. |
| Vértice duplicado conserva adyacencia / Duplicate vertex preserves adjacency | Sí / Yes | `testGraph` (`duplicateVertexPreservesAdjacency`) | Duplica registro de vértice 10; adyacencia `[30]` intacta, 2 vértices, 1 arista / Duplicates registration of vertex 10; adjacency `[30]` intact, 2 vertices, 1 edge. |
| Arista duplicada / Duplicate edge | Sí / Yes | `testGraph` (`duplicateEdge`) | `addEdge(10, 30)` repetido; idempotente, 2 vértices, 1 arista / Repeated `addEdge(10, 30)`; idempotent, 2 vertices, 1 edge. |
| Extremo inexistente sin mutación / Missing endpoint without mutation | Sí / Yes | `testGraph` (`missingEndpointWithoutMutation`) | Intenta 4 aristas inválidas con vértices inexistentes; todas retornan `false`, contadores y adyacencias inalterados / Attempts 4 invalid edges with missing vertices; all return `false`, counts and adjacencies unchanged. |
| Vecinos ordenados y contadores / Sorted neighbours and counts | Sí / Yes | `testGraph` (`sortedNeighborsAndCounts`) | Aristas añadidas desordenadas; vecinos quedan `[30, 50, 70]`, 4 vértices, 4 aristas / Edges added out of order; neighbours become `[30, 50, 70]`, 4 vertices, 4 edges. |
| Consulta de arista ausente / Missing-edge query | Sí / Yes | `testGraph` (`missingEdgeQuery`) | `hasEdge(10, 30) == false`, 2 vértices, 0 aristas / `hasEdge(10, 30) == false`, 2 vertices, 0 edges. |
| Vecinos de vértice inexistente / Neighbours of missing vertex | Sí / Yes | `testGraph` (`missingVertexNeighbors`) | `getNeighbors(99) == ()`, distinto de vecinos vacíos `[]` / `getNeighbors(99) == ()`, distinct from empty neighbours `[]`. |
| Bucle y duplicado / Self-loop and duplicate | Sí / Yes | `testGraph` (`selfLoopAndDuplicate`) | `addEdge(10, 10)` repetido; 1 vértice, 1 arista, vecinos `[10]` / Repeated `addEdge(10, 10)`; 1 vertex, 1 edge, neighbours `[10]`. |
| Aislamiento del resultado de vecinos / Neighbour-result isolation | Sí / Yes | `testGraph` (`neighborResultIsolation`) | Mutar copia devuelta (`push`) no altera el grafo; `savedNeighbors` se conserva intacto / Mutating returned copy (`push`) does not alter graph; `savedNeighbors` remains intact. |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Recolección de basura automática / Automatic garbage collection | Nodos desvinculados no se liberan explícitamente / Unlinked nodes are not explicitly freed | Ballerina corre sobre la JVM y gestiona la memoria de nodos desenlazados con GC automático / Ballerina runs on the JVM and manages unlinked node memory with automatic GC. |
| Tipos de clave y valor enteros (`int`) / Fixed integer value and key types (`int`) | Las estructuras manejan enteros de 64 bits con signo / Structures handle 64-bit signed integers | Suficiente para el contrato de la fase algorítmica; generalización polimórfica o genérica se aborda en fases avanzadas / Sufficient for algorithmic phase contract; polymorphic or generic generalization is addressed in advanced phases. |

---

## 📝 Notas de implementación / Implementation Notes

### 🧱 Reutilización e independencia / Reuse and Independence

**ES:** Se optó por el modelo de **valor embebido** para representar la base `Node`: `TreeNode` y `GraphNode` encapsulan internamente su valor entero sin exponer ni requerir validaciones comunes en un nodo raíz abstracto. `BinaryTree` y `Graph` son totalmente independientes y no comparten estado ni lógica entre sí.

**EN:** The **embedded value** model was selected to represent the `Node` base: `TreeNode` and `GraphNode` encapsulate their integer value internally without exposing or requiring common validations on an abstract root node. `BinaryTree` and `Graph` are completely decoupled, sharing neither state nor logic.

### 🔗 Registro de vértices y adyacencia manual / Manual Vertex Registry and Adjacency

**ES:** El registro de vértices de `Graph` implementa una lista enlazada simple mediante referencias `nextVertex` en `GraphNode`, preservando la cota `O(V)` requerida por la especificación. La adyacencia de cada vértice se gestiona mediante registros enlazados `NeighborNode` que garantizan la inserción ordenada ascendente y la deduplicación en tiempo `O(d(u))`.

**EN:** The `Graph` vertex registry implements a simple singly linked list via `nextVertex` references in `GraphNode`, preserving the specification's required `O(V)` bound. Each vertex's adjacency is managed through linked `NeighborNode` records that guarantee sorted ascending insertion and deduplication in `O(d(u))` time.

### 🛡️ Aislamiento defensivo / Defensive Isolation

**ES:** Para evitar la exposición o mutación accidental de la lista de adyacencia interna, `Graph.getNeighbors` proyecta la lista enlazada interna a un nuevo arreglo `int[]` en cada llamada. Esto asegura que operaciones de mutación del cliente sobre el array retornado no comprometan los invariantes del grafo.

**EN:** To prevent exposure or accidental mutation of the internal adjacency list, `Graph.getNeighbors` projects the internal linked list into a fresh `int[]` array on each invocation. This ensures client mutation operations on the returned array do not compromise graph invariants.

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
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) |
| Primera base del lenguaje / First language reference | `data_structures_basics` — [`../data_structures_basics/README.md`](../data_structures_basics/README.md) |
| Segunda base del lenguaje / Second language reference | `numbers` — [`../../foundations/numbers/README.md`](../../foundations/numbers/README.md) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](https://yorche3.github.io/programming_languages/core/00_Project_Initialization_Guide/) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](https://yorche3.github.io/programming_languages/AGENT_Template/) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](https://yorche3.github.io/programming_languages/WORKFLOW/) |
| Documentación oficial del lenguaje / Language official docs | [Ballerina Language Documentation](https://ballerina.io/learn/) |

---

*[← Volver al Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
