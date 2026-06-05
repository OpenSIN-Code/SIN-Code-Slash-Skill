# Purpose: Tests for the command dispatcher.
# Docs: tests/test_dispatcher.doc.md
# test_dispatcher.py

## What this file does
Comprehensive tests for the `CommandDispatcher` class covering dispatch, history, and command resolution.

## Test coverage
- Dispatch all built-in commands (test, docs, audit, status, commit, search, refactor)
- Dispatch custom commands
- Unknown command handling
- Invalid syntax handling
- History recording and retrieval
- History limits and ordering
- Clear history
- List all commands
- Get command help
- Dispatch with args and flags
- Result metadata (timestamp, duration)
