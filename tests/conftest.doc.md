# Purpose: What this file does in one sentence.
# Docs: tests/conftest.doc.md
# conftest.py

## What this file does
Provides shared pytest fixtures for temporary registries, dispatchers, and executors.

## Which other files import / touch it
- All test files in `tests/` directory
- `test_parser.py`, `test_registry.py`, `test_executor.py`, `test_dispatcher.py`, `test_commands.py`, `test_mcp_server.py`, `test_cli.py`

## Why certain decisions were made
- Uses `tempfile.mkstemp()` for truly isolated temp databases per test
- `yield` pattern ensures cleanup even on test failure
- Separate fixtures for each major component (registry, dispatcher, executor)

## Usage examples
```python
def test_something(temp_registry):
    temp_registry.register("cmd", "Desc", "action", "shell")
    assert temp_registry.exists("cmd")
```
