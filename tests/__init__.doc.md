# sin-slash/tests/__init__.py

**Purpose:** Test package marker. Makes `tests/` a Python package so
pytest can discover conftest fixtures and shared helpers across modules.

**Source file:** `tests/__init__.py` (Python)

**Header excerpt:**

```
# Purpose: Test package initialization.
# Docs: __init__.doc.md
"""Tests for the sin-slash package."""
```

---

## What it does

Marks the `tests/` directory as a Python package. This lets `pytest`
discover `conftest.py` and any shared test fixtures/helpers via
relative imports, and lets multiple test modules reference a common
test utilities module if needed.

## Dependencies

None — empty by design. The actual test logic lives in
`test_cli.py`, `test_commands.py`, `test_dispatcher.py`,
`test_executor.py`, `test_mcp_server.py`, `test_parser.py`, and
`test_registry.py`.

## Important config

None — purely structural.

## Why these decisions

- **Empty body** — pytest only needs the file to exist; any shared
  fixtures belong in `conftest.py`, not here.
- **One-line docstring** — keeps `pytest --collect-only` output clean.

## Usage example

```bash
pytest tests/ -v
# Discovers all test_*.py in the package
```

## Known caveats

- If you need shared helpers, put them in `tests/conftest.py` or a
  new `tests/helpers.py`, **not** in this file — pytest imports it
  before any test module loads.
