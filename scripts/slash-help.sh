#!/usr/bin/env bash
# Purpose: Show help for a slash command.
# Docs: scripts/slash-help.sh.doc.md
set -euo pipefail

# Usage: slash-help.sh <command>

if [ $# -lt 1 ]; then
    echo "Usage: $0 <command>"
    exit 1
fi

COMMAND="$1"

if command -v sin-slash &> /dev/null; then
    sin-slash help "$COMMAND"
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH" python3 -c "
from sin_slash.dispatcher import CommandDispatcher
dispatcher = CommandDispatcher()
help_text = dispatcher.get_command_help('$COMMAND')
if help_text:
    print(help_text)
else:
    print(f'Unknown command: /{\"$COMMAND\"}')
    exit(1)
"
fi
