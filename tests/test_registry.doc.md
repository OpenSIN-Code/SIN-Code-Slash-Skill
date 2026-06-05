# Purpose: Tests for the command registry.
# Docs: tests/test_registry.doc.md
# test_registry.py

## What this file does
Comprehensive tests for the `CommandRegistry` class covering CRUD operations, persistence, and edge cases.

## Test coverage
- Register commands (valid, duplicate, invalid type)
- Get commands (existing, missing)
- Unregister commands (existing, missing)
- List all commands (with data, empty)
- Update commands (existing, missing, invalid type)
- Check existence
- Clear all commands
- Export to dict and JSON
- Persistence across instances
- Default database path
