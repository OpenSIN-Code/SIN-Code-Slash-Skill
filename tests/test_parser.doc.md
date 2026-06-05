# Purpose: Tests for the slash command parser.
# Docs: tests/test_parser.doc.md
# test_parser.py

## What this file does
Comprehensive tests for the `SlashParser` class covering parsing, validation, quoting, flags, and edge cases.

## Test coverage
- Simple commands without arguments
- Commands with positional arguments
- Long and short flags
- Flag values (numeric, boolean, string)
- Single and double quoted strings
- Invalid input (empty, no slash, unclosed quotes)
- Type coercion (boolean, integer, float)
- Batch parsing with `parse_many()`
- Validation with `is_valid_command()`
