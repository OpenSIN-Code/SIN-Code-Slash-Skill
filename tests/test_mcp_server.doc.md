# Purpose: Tests for the MCP server.
# Docs: tests/test_mcp_server.doc.md
# test_mcp_server.py

## What this file does
Comprehensive tests for MCP server tools verifying JSON responses and functionality.

## Test coverage
- `slash_dispatch` (built-in, unknown, invalid, with args, with flags)
- `slash_list` (all, built-in only, custom only)
- `slash_register` (valid, duplicate, invalid type)
- `slash_unregister` (existing, missing)
- `slash_help` (built-in, custom, missing)
- `slash_history` (empty, with records, with limit)
- Response metadata (output, duration, timestamp)
