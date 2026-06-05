# Purpose: List available slash commands.
# Docs: scripts/slash-list.sh.doc.md
# slash-list.sh

## What this file does
Lists all available slash commands (built-in and custom) via the `sin-slash` CLI or Python fallback.

## Usage
```bash
./slash-list.sh               # All commands
./slash-list.sh --built-in    # Only built-in
./slash-list.sh --custom      # Only custom
```

## Output format
Prints command names with descriptions in a simple text format.

## Dependencies
- `sin-slash` CLI (preferred)
- Python 3 with `sin_slash` package (fallback)
