# Purpose: Execute slash commands (built-in and custom).
# Docs: src/sin_slash/executor.doc.md
# executor.py

## What this file does
Executes slash commands by mapping built-ins to sin-* tools and running custom commands via shell or sin tools.

## Which other files import / touch it
- `dispatcher.py` — calls `execute_builtin()` and `execute_custom()`
- `test_executor.py` — tests all execution paths

## Important config values
- Default timeout: 60 seconds for shell commands
- Dangerous command patterns: `rm -rf /`, `mkfs`, `dd if=/dev/zero`, etc.
- Action types: `shell`, `sin`, `python`

## Why certain decisions were made
- Shell commands run via `subprocess.run()` with `shell=True` for convenience
- Dangerous commands are blocked via `validate_command()` for safety
- Timeout prevents runaway commands

## Usage examples
```python
executor = CommandExecutor()
action = {"type": "shell", "target": "echo hello"}
output = executor.execute_builtin("test", action, [], {})
# "hello\n"
```
