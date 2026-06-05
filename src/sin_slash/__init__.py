# Purpose: SIN-Code Slash Skill package initialization.
# Docs: __init__.doc.md
"""SIN-Code Slash Skill - MCP server for slash command dispatch.

Provides built-in slash commands (/refactor, /test, /docs, etc.) and a custom
command registry backed by SQLite. Dispatches commands to the appropriate
sin-* tools or shell execution.
"""

__version__ = "0.1.0"
__all__ = [
    "parser",
    "registry",
    "dispatcher",
    "executor",
    "commands",
    "mcp_server",
]
