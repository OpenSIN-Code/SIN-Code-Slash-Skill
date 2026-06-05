# Purpose: Register a custom slash command.
# Docs: scripts/slash-register.sh.doc.md
# slash-register.sh

## What this file does
Registers a new custom slash command in the registry.

## Usage
```bash
./slash-register.sh deploy "Deploy app" "git push origin main"
./slash-register.sh deploy "Deploy app" "sin_deploy" --type=sin
```

## Parameters
| Parameter | Description |
|-----------|-------------|
| name | Command name (without leading slash) |
| description | Human-readable description |
| action | Command to execute |
| --type | Action type: shell, sin, or script (default: shell) |

## Dependencies
- `sin-slash` CLI (preferred)
- Python 3 with `sin_slash` package (fallback)
