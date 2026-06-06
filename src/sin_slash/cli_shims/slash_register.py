# Purpose: CLI shim for slash_register
# Docs: slash-register.doc.md
"""CLI: slash-register — register a custom slash command.

Usage: slash-register --name NAME --description DESC --action CMD [--action-type TYPE]
"""
from __future__ import annotations
import argparse
import sys
from ..mcp_server import slash_register


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="slash-register", description="Register a custom slash command.")
    parser.add_argument("--name", required=True)
    parser.add_argument("--description", required=True)
    parser.add_argument("--action", required=True, help="Shell command (or template) to run.")
    parser.add_argument("--action-type", default="shell", choices=["shell", "template", "python"])
    args = parser.parse_args(argv)
    print(slash_register(
        name=args.name,
        description=args.description,
        action=args.action,
        action_type=args.action_type,
    ))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
