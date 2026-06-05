# Purpose: FastMCP server exposing slash command tools.
# Docs: src/sin_slash/mcp_server.doc.md
# mcp_server.py

## What this file does
FastMCP server that exposes 6 MCP tools for slash command dispatch, listing, registration, and management.

## Which other files import / touch it
- `test_mcp_server.py` — tests all MCP tools
- `cli.py` — separate CLI entry point

## Important config values
- MCP server name: `sin-slash`
- Singleton dispatcher pattern (shared across tools)
- All tools return JSON strings for structured data

## Why certain decisions were made
- FastMCP chosen for minimal boilerplate MCP server
- JSON string return type for MCP compatibility (all clients can parse JSON)
- Singleton dispatcher to share state across tool calls

## Usage examples
```python
from sin_slash.mcp_server import slash_dispatch, slash_list

# Dispatch a command
result = slash_dispatch("/test")
# Returns JSON string

# List all commands
commands = slash_list()
# Returns JSON string
```

## MCP Tools
| Tool | Description |
|------|-------------|
| `slash_dispatch` | Execute a slash command |
| `slash_list` | List available commands |
| `slash_register` | Register a custom command |
| `slash_unregister` | Remove a custom command |
| `slash_help` | Show help for a command |
| `slash_history` | Show recent invocations |
