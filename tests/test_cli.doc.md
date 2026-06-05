# Purpose: Tests for the CLI interface.
# Docs: tests/test_cli.doc.md
# test_cli.py

## What this file does
Comprehensive tests for the CLI using click.testing.CliRunner.

## Test coverage
- Version flag
- Help flag
- `run` command (success, failure, raw output, with args, with flags)
- `list` command (all, built-in only, custom only)
- `register` command (success, duplicate)
- `remove` command (success, missing)
- `history` command (with records, empty)
- `help` command (existing, missing)
