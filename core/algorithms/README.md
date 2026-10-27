# 🚀 Algorithms Pure — Ballerina

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Ballerina**: algoritmos sobre arrays y estructuras enlazadas elementales con indicadores de fallo compatibles y sin excepciones.

---

## 📁 Estructura / Structure

```text
algorithms/
├── naive_sort/                 # 05_Naive_Sort
│   ├── naive_sort.bal
│   ├── Ballerina.toml
│   ├── tests/
│   │   └── lib_test.bal
│   └── README.md
├── data_structures_basics/     # 06_Data_Structures_Basics
│   ├── data_structures_basics.bal
│   ├── Ballerina.toml
│   ├── Dependencies.toml
│   ├── tests/
│   │   └── lib_test.bal
│   └── README.md
└── data_structures_advanced/   # 07_Data_Structures_Advanced
    ├── data_structures_advanced.bal
    ├── Ballerina.toml
    ├── Dependencies.toml
    ├── tests/
    │   └── lib_test.bal
    └── README.md
```

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|-------|--------|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `bal test` (paquete) | 3 | ✅ |
| [`data_structures_basics/`](data_structures_basics/) | [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) | `bal test` (paquete) | 4 | ✅ |
| [`data_structures_advanced/`](data_structures_advanced/) | [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) | `bal test` (paquete) | 23 | ✅ |
| `efficient_sort` | [08_Efficient_Sort](https://yorche3.github.io/programming_languages/core/algorithms/08_Efficient_Sort/) | — | — | 📋 |
| `distributed_sort` | [09_Distributed_Sort](https://yorche3.github.io/programming_languages/core/algorithms/09_Distributed_Sort/) | — | — | 📋 |
| `searching` | [10_Searching](https://yorche3.github.io/programming_languages/core/algorithms/10_Searching/) | — | — | 📋 |

> **ES:** `naive_sort`, `data_structures_basics` y `data_structures_advanced` son las implementaciones homologadas de esta fase en Ballerina. Los módulos restantes siguen el orden de la numeración canónica `08_` a `10_`.
> **EN:** `naive_sort`, `data_structures_basics` and `data_structures_advanced` are the standardized implementations of this phase in Ballerina. The remaining modules follow the canonical numbering from `08_` to `10_`.

---

## ▶️ Siguiente / Next

👉 Continúa con [`data_structures_advanced`](data_structures_advanced/README.md).<br>
👉 Continue with [`data_structures_advanced`](data_structures_advanced/README.md).

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*[← Volver a Core](../README.md)*
