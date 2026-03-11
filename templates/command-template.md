---
description: Brief description of what this command does (shown in / menu)
allowed-tools: Read, Edit, Glob, Grep, Bash(npm:*)
---

## Context

- Current directory: !`pwd`
- Git status: !`git status --short 2>/dev/null`
- Other context: !`some-command`

## Task

Describe what Claude should do when this command is invoked.

### Steps

1. First step
2. Second step
3. Third step

### Options

If $ARGUMENTS contains specific values, handle them:
- `option1`: Do something specific
- `option2`: Do something else

### Example

```bash
# Example commands that might be run
some-command --flag
```

## Guidelines

- Be specific about expected behavior
- Handle edge cases
- Provide clear success/failure messages
