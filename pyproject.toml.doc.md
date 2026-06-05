# Purpose: What this file does in one sentence.
# Docs: pyproject.toml.doc.md
# pyproject.toml

## What this file does
Project configuration and metadata for the `sin-slash` package using the modern PEP 621 `pyproject.toml` format.

## Dependencies
- **fastmcp**: MCP server framework
- **click**: CLI framework
- **rich**: Terminal formatting
- **pydantic**: Data validation

## Dev dependencies
- **pytest**: Test runner
- **pytest-cov**: Coverage reporting
- **pytest-asyncio**: Async test support
- **ruff**: Linter and formatter
- **mypy**: Type checker

## Important config values
- `line-length`: 100 characters
- `target-version`: Python 3.9
- `timeout`: 60s for shell commands

## Usage examples
```bash
pip install -e ".[dev]"
pytest
```
