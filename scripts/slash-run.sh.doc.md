# Purpose: Run a slash command via CLI.
# Docs: scripts/slash-run.sh.doc.md
# slash-run.sh

## What this file does
Runs a slash command via the `sin-slash` CLI or falls back to direct Python invocation.

## Usage
```bash
./slash-run.sh "/test --verbose"
```

## Dependencies
- `sin-slash` CLI (preferred)
- Python 3 with `sin_slash` package (fallback)

## Why certain decisions were made
- Checks for `sin-slash` CLI first, falls back to Python for development
- Uses `PYTHONPATH` to ensure imports work when run from scripts directory
- `set -euo pipefail` for strict error handling
