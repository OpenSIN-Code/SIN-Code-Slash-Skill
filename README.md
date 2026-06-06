> ## ⚠️ DEPRECATED — This skill has been merged into [sin-code-bundle](https://github.com/OpenSIN-Code/SIN-Code-Bundle)
>
> As of v0.9.3 (2026-06-06), this standalone skill is now a subcommand of the `sin-code-bundle` CLI:
>
> | Old | New |
> |-----|-----|
> | standalone skill | `sin slash` |
>
> **Migrate now:** `pip install --upgrade sin-code-bundle`
>
> This repo is archived; no further updates will be made.
> See [issue #29](https://github.com/OpenSIN-Code/SIN-Code-Bundle/issues/29) for the consolidation rationale.

# SIN-Code Slash Skill

OpenAI-kompatibler MCP-Server für Slash-Command-Dispatch mit eingebauten Befehlen und benutzerdefiniertem Registry.

## Quick Start

```bash
pip install -e ".[dev]"
pytest
```

## MCP Tools

| Tool | Beschreibung |
|------|-------------|
| `slash_dispatch` | Führt einen Slash-Command aus |
| `slash_list` | Listet alle verfügbaren Commands |
| `slash_register` | Registriert einen neuen Command |
| `slash_unregister` | Entfernt einen Command |
| `slash_help` | Zeigt Hilfe für einen Command |
| `slash_history` | Zeigt die letzten Aufrufe |

## Built-in Commands

| Command | Action | Type |
|---------|--------|------|
| `/refactor` | `sin_symbol_resolve` | sin |
| `/test` | `pytest` | shell |
| `/docs` | `sin codocs check` | shell |
| `/commit` | `sin_immortal_commit` | sin |
| `/audit` | `sin ceo-audit` | shell |
| `/status` | `sin status` | shell |
| `/search` | `sin_websearch` | sin |
| `/help` | internal | python |
| `/list` | internal | python |
| `/history` | internal | python |

## CLI Usage

```bash
sin-slash run /test --verbose
sin-slash list
sin-slash register deploy "Deploy app" "git push" --type shell
sin-slash remove deploy
sin-slash history --limit 20
sin-slash help test
```

## Architecture

```
MCP Client
  ↓ JSON-RPC
FastMCP Server
  ↓ slash_dispatch
CommandDispatcher
  ↓ parse → resolve → execute
SlashParser / Registry / Executor
```

## License

MIT
