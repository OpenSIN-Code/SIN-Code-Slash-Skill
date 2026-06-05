# Purpose: Tests for the command executor.
# Docs: tests/test_executor.doc.md
# test_executor.py

## What this file does
Comprehensive tests for the `CommandExecutor` class covering built-in execution, custom execution, shell commands, and validation.

## Test coverage
- Execute built-in commands (shell, sin, python)
- Execute custom commands (shell, sin, script)
- Unknown action types
- Command validation (safe vs dangerous)
- Shell command failures
- Shell command timeouts
- Flag handling (boolean, values, mixed)
