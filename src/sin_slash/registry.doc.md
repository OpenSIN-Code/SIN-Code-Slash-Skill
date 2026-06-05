# Purpose: SQLite-backed registry for custom slash commands.
# Docs: src/sin_slash/registry.doc.md
# registry.py

## What this file does
Manages user-defined slash commands in a SQLite database with full CRUD operations.

## Which other files import / touch it
- `dispatcher.py` — queries registry to resolve custom commands
- `cli.py` — uses registry for `register` and `remove` commands
- `mcp_server.py` — indirect via dispatcher
- `test_registry.py` — tests all CRUD operations

## Important config values
- Default DB path: `~/.config/sin-slash/registry.db`
- Supported action_types: `shell`, `sin`, `script`
- Table schema: `commands(name, description, action, action_type, created_at, updated_at)`

## Why certain decisions were made
- SQLite chosen for zero-config persistence across sessions
- `CHECK` constraint on `action_type` prevents invalid types
- `datetime.utcnow().isoformat()` for portable timestamps

## Usage examples
```python
registry = CommandRegistry()
registry.register("deploy", "Deploy to prod", "git push origin main", "shell")
cmd = registry.get("deploy")
registry.unregister("deploy")
```
