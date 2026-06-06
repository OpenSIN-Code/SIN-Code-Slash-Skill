# Purpose: CLI shim for slash_help
# Docs: slash-help.doc.md
"""CLI: slash-help — show help for a specific command.

Usage: slash-help <COMMAND>
"""
from __future__ import annotations
import argparse
import sys
from ..mcp_server import slash_help


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="slash-help", description="Show help for a specific slash command.")
    parser.add_argument("command")
    args = parser.parse_args(argv)
    print(slash_help(args.command))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
