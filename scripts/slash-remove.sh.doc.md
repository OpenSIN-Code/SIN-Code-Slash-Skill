# Purpose: Unregister a custom slash command.
# Docs: scripts/slash-remove.sh.doc.md
# slash-remove.sh

## What this file does
Removes a custom slash command from the registry.

## Usage
```bash
./slash-remove.sh deploy
```

## Parameters
| Parameter | Description |
|-----------|-------------|
| name | Command name to remove |

## Exit codes
- `0`: Command removed successfully
- `1`: Command not found

## Dependencies
- `sin-slash` CLI (preferred)
- Python 3 with `sin_slash` package (fallback)
