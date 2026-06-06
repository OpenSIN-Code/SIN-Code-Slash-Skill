# Purpose: CLI shim for slash_unregister
# Docs: slash-unregister.doc.md
"""CLI: slash-unregister — remove a custom slash command.

Usage: slash-unregister <NAME>
"""
from __future__ import annotations
import argparse
import sys
from ..mcp_server import slash_unregister


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="slash-unregister", description="Remove a custom slash command.")
    parser.add_argument("name")
    args = parser.parse_args(argv)
    print(slash_unregister(args.name))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
