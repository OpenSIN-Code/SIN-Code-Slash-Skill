#!/usr/bin/env bash
# Purpose: Register a custom slash command.
# Docs: scripts/slash-register.sh.doc.md
set -euo pipefail

# Usage: slash-register.sh <name> <description> <action> [--type=<type>]

if [ $# -lt 3 ]; then
    echo "Usage: $0 <name> <description> <action> [--type=shell|sin|script]"
    exit 1
fi

NAME="$1"
DESCRIPTION="$2"
ACTION="$3"
TYPE="shell"

# Parse optional type flag
for arg in "$@"; do
    if [[ "$arg" == --type=* ]]; then
        TYPE="${arg#--type=}"
    fi
done

if command -v sin-slash &> /dev/null; then
    sin-slash register "$NAME" "$DESCRIPTION" "$ACTION" --type "$TYPE"
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH" python3 -c "
from sin_slash.registry import CommandRegistry
registry = CommandRegistry()
try:
    cmd = registry.register('$NAME', '$DESCRIPTION', '$ACTION', '$TYPE')
    print(f'✓ Registered /{cmd.name}')
except ValueError as e:
    print(f'✗ {e}')
    exit(1)
"
fi
