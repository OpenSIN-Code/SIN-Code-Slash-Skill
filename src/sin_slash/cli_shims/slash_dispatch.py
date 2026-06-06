# Purpose: CLI shim for slash_dispatch
# Docs: slash-dispatch.doc.md
"""CLI: slash-dispatch — dispatch a slash command.

Usage: slash-dispatch <COMMAND>   e.g. slash-dispatch "/test --verbose"
"""
from __future__ import annotations
import argparse
import sys
from ..mcp_server import slash_dispatch


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="slash-dispatch", description="Dispatch a slash command string.")
    parser.add_argument("command", help='Full slash command, e.g. "/test --verbose"')
    args = parser.parse_args(argv)
    print(slash_dispatch(args.command))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
