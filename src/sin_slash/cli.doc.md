# Purpose: CLI entry point for sin-slash.
# Docs: src/sin_slash/cli.doc.md
# cli.py

## What this file does
Provides a command-line interface for running slash commands directly via `sin-slash` command.

## Which other files import / touch it
- `pyproject.toml` — defines `sin-slash` console script entry point
- `test_cli.py` — tests all CLI commands
- Bash scripts in `scripts/` — call `sin-slash` CLI

## Important config values
- Console script: `sin-slash`
- Uses `click` for argument parsing
- Uses `rich` for formatted output

## Why certain decisions were made
- `click` chosen for robust CLI parsing with built-in help
- `rich` chosen for beautiful terminal tables and panels
- Separate from MCP server to support both programmatic and CLI usage

## Usage examples
```bash
sin-slash run /test --verbose
sin-slash list
sin-slash register deploy "Deploy app" "git push" --type shell
sin-slash remove deploy
sin-slash history --limit 20
sin-slash help test
```
