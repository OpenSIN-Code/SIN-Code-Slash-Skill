#!/usr/bin/env bash
# Purpose: List available slash commands.
# Docs: scripts/slash-list.sh.doc.md
set -euo pipefail

# Usage: slash-list.sh [--built-in|--custom]

BUILT_IN=""
CUSTOM=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --built-in)
            BUILT_IN="--built-in"
            shift
            ;;
        --custom)
            CUSTOM="--custom"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

if command -v sin-slash &> /dev/null; then
    sin-slash list $BUILT_IN $CUSTOM
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH" python3 -c "
from sin_slash.dispatcher import CommandDispatcher
import json

dispatcher = CommandDispatcher()
commands = dispatcher.list_commands()

if '$BUILT_IN' == '' and '$CUSTOM' == '':
    print('=== Built-in Commands ===')
    for name, info in commands['built_in'].items():
        print(f'/{name} - {info[\"description\"]}')
    print()
    print('=== Custom Commands ===')
    for name, info in commands['custom'].items():
        print(f'/{name} - {info[\"description\"]}')
elif '$BUILT_IN' != '':
    for name, info in commands['built_in'].items():
        print(f'/{name} - {info[\"description\"]}')
else:
    for name, info in commands['custom'].items():
        print(f'/{name} - {info[\"description\"]}')
"
fi
