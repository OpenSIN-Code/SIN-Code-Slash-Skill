# Purpose: CLI shim for slash_list
# Docs: slash-list.doc.md
"""CLI: slash-list — list available slash commands.

Usage: slash-list [--no-built-in] [--no-custom]
"""
from __future__ import annotations
import argparse
import sys
from ..mcp_server import slash_list


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="slash-list", description="List available slash commands.")
    parser.add_argument("--no-built-in", dest="built_in", action="store_false")
    parser.add_argument("--no-custom", dest="custom", action="store_false")
    args = parser.parse_args(argv)
    print(slash_list(built_in=args.built_in, custom=args.custom))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
