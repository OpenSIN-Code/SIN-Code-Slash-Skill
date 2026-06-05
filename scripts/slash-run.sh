#!/usr/bin/env bash
# Purpose: Run a slash command via CLI.
# Docs: scripts/slash-run.sh.doc.md
set -euo pipefail

# Usage: slash-run.sh <command> [options]
# Example: slash-run.sh "/test --verbose"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <command>"
    echo "Example: $0 '/test --verbose'"
    exit 1
fi

COMMAND="$1"

# Check if sin-slash is installed
if command -v sin-slash &> /dev/null; then
    sin-slash run "$COMMAND"
else
    # Fallback: run via Python directly
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
    PYTHONPATH="$PROJECT_ROOT/src:$PYTHONPATH" python3 -c "
from sin_slash.dispatcher import CommandDispatcher
dispatcher = CommandDispatcher()
result = dispatcher.dispatch('$COMMAND')
if result.success:
    print(f'✓ /{result.command} ({result.duration_ms:.0f}ms)')
    if result.output:
        print(result.output)
else:
    print(f'✗ /{result.command}')
    if result.error:
        print(result.error)
    exit(1)
"
fi
