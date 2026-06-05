#!/usr/bin/env bash
# Purpose: Show slash command history.
# Docs: scripts/slash-history.sh.doc.md
set -euo pipefail

# Usage: slash-history.sh [--limit=<n>]

LIMIT=20

for arg in "$@"; do
    if [[ "$arg" == --limit=* ]]; then
        LIMIT="${arg#--limit=}"
    fi
done

if command -v sin-slash &> /dev/null; then
    sin-slash history --limit "$LIMIT"
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH" python3 -c "
from sin_slash.dispatcher import CommandDispatcher
dispatcher = CommandDispatcher()
records = dispatcher.get_history(limit=$LIMIT)
for record in records:
    status = '✓' if record['success'] else '✗'
    print(f'{record[\"timestamp\"]} {status} /{record[\"command\"]} ({record[\"duration_ms\"]:.0f}ms)')
"
fi
