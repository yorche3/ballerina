# Ballerina

Proyectos en **Ballerina**, un lenguaje de programación open-source que compila a bytecode Java y se ejecuta sobre la JVM.

Usa el framework de pruebas integrado `ballerina/test` con anotaciones (`@test:Config`) y descubrimiento automático de tests via `bal test`.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
|--------|-------------|
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `hello_world`, `hello_user`, `calculator`, `numbers` |

---

### ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld && bal run hello_world.bal

# Hello, User!
cd core/foundations/hellouser && bal run hello_user.bal

# Calculator Tests
cd core/foundations/unit_test/calculator && bal test

# Numbers Tests
cd core/foundations/numbers && bal test
```

---

### 📦 Requisitos / Requirements

| Herramienta | Instalación |
|-------------|-------------|
| [Ballerina](https://ballerina.io/downloads/) | `winget install Ballerina.Ballerina` (Windows) / Descargar desde ballerina.io (Linux/macOS) |

```bash
# Verificar instalación
bal version
```

---

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*