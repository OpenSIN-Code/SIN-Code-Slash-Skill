# Purpose: Show help for a slash command.
# Docs: scripts/slash-help.sh.doc.md
# slash-help.sh

## What this file does
Shows help text for a specific slash command.

## Usage
```bash
./slash-help.sh test
./slash-help.sh deploy
```

## Parameters
| Parameter | Description |
|-----------|-------------|
| command | Command name to show help for |

## Exit codes
- `0`: Help displayed successfully
- `1`: Unknown command

## Dependencies
- `sin-slash` CLI (preferred)
- Python 3 with `sin_slash` package (fallback)
