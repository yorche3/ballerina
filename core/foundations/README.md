# 🚀 Foundations — Ballerina

Implementaciones de la [Fase 0 — Fundamentos](https://yorche3.github.io/programming_languages/ROADMAP/#fase-0--fundamentos--foundations--completada) en **Ballerina**: `hello_world`, `hello_user`, `unit_test/calculator` y `numbers`.

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|-------|--------|
| [`helloworld/`](helloworld/) | [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | `bal run` (archivo único) | — | ✅ |
| [`hellouser/`](hellouser/) | [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | `bal run` (archivo único) | — | ✅ |
| [`unit_test/calculator/`](unit_test/calculator/) | [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | `bal test` (paquete) | 5 | ✅ |
| [`numbers/`](numbers/) | [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | `bal test` (paquete) | 10 | ✅ |

---

## 📁 Estructura / Structure

```text
foundations/
├── helloworld/                   # 01_Hello_World
│   ├── hello_world.bal           # Imprime "Hello, World!"
│   └── README.md
│
├── hellouser/                    # 02_Hello_User
│   ├── hello_user.bal            # Lee nombre y saluda
│   └── README.md
│
├── unit_test/
│   └── calculator/               # 03_Unit_Test_Calculator
│       ├── calculator.bal        # 5 operaciones aritméticas
│       ├── Ballerina.toml
│       ├── tests/
│       │   └── lib_test.bal      # 5 tests
│       └── README.md
│
└── numbers/                      # 04_Numbers
    ├── numbers.bal               # 15 funciones (3 enfoques × 5 algoritmos)
    ├── Ballerina.toml
    ├── tests/
    │   ├── numbers_recursive_test.bal    # 5 tests recursivos
    │   └── numbers_iterative_test.bal    # 5 tests iterativos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Sin archivos de proyecto** | `bal run` ejecuta archivos `.bal` sueltos sin `Ballerina.toml` |
| **Framework integrado** | `bal test` descubre tests automáticamente en `tests/` |
| **Anotaciones** | `@test:Config` marca funciones de prueba |
| **Aserciones** | `test:assertEquals(actual, expected, msg)` |
| **Tipado fuerte** | Parámetros inmutables por defecto (no se pueden reasignar) |
| **JVM** | Ballerina compila a bytecode Java y ejecuta sobre JVM |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Hello, World!
cd helloworld && bal run hello_world.bal

# Hello, User!
cd hellouser && bal run hello_user.bal

# Calculator Tests
cd unit_test/calculator && bal test

# Numbers Tests
cd numbers && bal test
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Después de fundamentos, continúa con [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).  
👉 After foundations, continue with [Phase 1 — Algorithms Pure](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).

---

*[← Volver a Ballerina](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
