#!/usr/bin/env bash
# Purpose: Unregister a custom slash command.
# Docs: slash-remove.sh.doc.md
set -euo pipefail

# Usage: slash-remove.sh <name>

if [ $# -lt 1 ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

NAME="$1"

if command -v sin-slash &> /dev/null; then
    sin-slash remove "$NAME"
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH" python3 -c "
from sin_slash.registry import CommandRegistry
registry = CommandRegistry()
removed = registry.unregister('$NAME')
if removed:
    print(f'✓ Removed /{\"$NAME\"}')
else:
    print(f'✗ Command /{\"$NAME\"} not found')
    exit(1)
"
fi
