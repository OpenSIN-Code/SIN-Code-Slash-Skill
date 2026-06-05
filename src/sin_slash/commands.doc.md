# Purpose: Built-in slash commands and their mappings.
# Docs: src/sin_slash/commands.doc.md
# commands.py

## What this file does
Defines all built-in slash commands (`/refactor`, `/test`, `/docs`, etc.) with their descriptions, actions, and types.

## Which other files import / touch it
- `dispatcher.py` — uses `BUILTIN_COMMANDS` to resolve built-ins
- `mcp_server.py` — uses `get_command_help()` for help text
- `test_commands.py` — tests all command definitions

## Important config values
- `BUILTIN_COMMANDS`: Dict mapping command names to action metadata
- Action types: `shell` (subprocess), `sin` (sin tool), `python` (internal)
- 10 built-in commands: refactor, test, docs, commit, audit, status, search, help, list, history

## Why certain decisions were made
- `help` and `list` are `python` type because they run internal logic
- `test` and `audit` are `shell` type because they invoke CLI tools
- `refactor` and `commit` are `sin` type because they map to sin tools

## Usage examples
```python
from sin_slash.commands import get_builtin_command, get_command_help

info = get_builtin_command("test")
print(info["action"])  # "pytest"
print(info["type"])    # "shell"

help_text = get_command_help("test")
print(help_text)  # "Usage: /test [path] [--verbose]..."
```
