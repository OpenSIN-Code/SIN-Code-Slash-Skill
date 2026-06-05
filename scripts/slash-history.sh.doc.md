# Purpose: Show slash command history.
# Docs: scripts/slash-history.sh.doc.md
# slash-history.sh

## What this file does
Shows recent slash command invocations with timestamps and status.

## Usage
```bash
./slash-history.sh              # Default 20 records
./slash-history.sh --limit=50   # Custom limit
```

## Output format
```
2024-01-01T00:00:00 ✓ /test (12ms)
2024-01-01T00:00:01 ✗ /nonexistent (0ms)
```

## Dependencies
- `sin-slash` CLI (preferred)
- Python 3 with `sin_slash` package (fallback)
