# Purpose: What this file does in one sentence.
# Docs: src/sin_slash/__init__.doc.md
# __init__.py

## What this file does
Package initialization for `sin_slash`, exposing the public API modules.

## Which other files import / touch it
- `mcp_server.py` — imports `dispatcher`, `registry`, `commands`
- `cli.py` — imports `dispatcher`, `registry`
- All test files import from this package

## Usage examples
```python
from sin_slash import parser, registry, dispatcher
```
