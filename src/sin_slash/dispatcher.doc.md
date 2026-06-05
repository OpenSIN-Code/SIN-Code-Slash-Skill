# Purpose: Dispatch slash commands to the appropriate executor action.
# Docs: src/sin_slash/dispatcher.doc.md
# dispatcher.py

## What this file does
Central router that parses incoming slash commands, resolves them (built-in or custom), invokes the executor, and records invocation history.

## Which other files import / touch it
- `mcp_server.py` — creates shared dispatcher instance
- `cli.py` — uses dispatcher for `run`, `list`, `history`, `help`
- `test_dispatcher.py` — tests dispatch logic
- `parser.py`, `registry.py`, `executor.py`, `commands.py` — all used by dispatcher

## Important config values
- Default history DB: `~/.config/sin-slash/history.db`
- History table: `history(id, command, args, flags, success, output, error, duration_ms, timestamp)`
- Default history limit: 50 records

## Why certain decisions were made
- Built-in commands checked BEFORE custom commands (override protection)
- History records both successful and failed invocations
- JSON serialization for args/flags in history (handles complex types)

## Usage examples
```python
dispatcher = CommandDispatcher()
result = dispatcher.dispatch("/test --verbose")
print(result.success)     # True
print(result.output)      # test output
history = dispatcher.get_history(limit=10)
```
