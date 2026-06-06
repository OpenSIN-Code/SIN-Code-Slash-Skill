# Purpose: CLI shim for slash_history
# Docs: slash-history.doc.md
"""CLI: slash-history — show recent slash command invocations.

Usage: slash-history [--limit N]
"""
from __future__ import annotations
import argparse
import sys
from ..mcp_server import slash_history


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="slash-history", description="Show recent slash command invocations.")
    parser.add_argument("--limit", type=int, default=50)
    args = parser.parse_args(argv)
    print(slash_history(limit=args.limit))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
