# Purpose: Parse slash command syntax with support for arguments, flags, and quoted strings.
# Docs: src/sin_slash/parser.doc.md
# parser.py

## What this file does
Parses raw slash command strings (`/command arg1 arg2 --flag "quoted string"`) into structured `ParsedCommand` objects with command name, positional arguments, and flags.

## Which other files import / touch it
- `dispatcher.py` — uses `SlashParser.parse()` to route commands
- `test_parser.py` — tests all parsing scenarios
- `mcp_server.py` — indirect via dispatcher

## Important config values
- `quote_chars`: Supports both `"` and `'` quotes
- `FLAG_RE`: Regex for `--flag` and `--flag=value`
- `SHORT_FLAG_RE`: Regex for `-f` and `-f=value`

## Why certain decisions were made
- Uses `shlex.split()` instead of manual splitting to handle quoted strings correctly
- Coerces boolean-like strings (`true`, `false`, `yes`, `no`) to actual booleans
- Coerces numeric strings to `int` or `float` automatically

## Usage examples
```python
parser = SlashParser()
result = parser.parse("/test --verbose tests/unit")
print(result.command)  # "test"
print(result.args)       # ["tests/unit"]
print(result.flags)      # {"verbose": True}
```
