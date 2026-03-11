---
name: quick-debug
description: Fast debugging skill - quickly analyze errors, suggest fixes, and explain root causes. Use when user shares error messages, stack traces, or asks "why does this fail"
---

# Quick Debug Skill

Rapid debugging assistance for common programming issues.

## Workflow

1. **Identify** - Parse error message/stack trace
2. **Analyze** - Find root cause
3. **Fix** - Provide solution code
4. **Explain** - Brief explanation of why it failed

## Response Format

```
ERROR: [Brief error description]
CAUSE: [Root cause in 1-2 sentences]
FIX:
[Code solution]

WHY: [Short explanation]
```

## Common Patterns

### JavaScript/TypeScript
- undefined/null errors -> check optional chaining
- async issues -> check await/promise handling
- type errors -> check type definitions

### Python
- ImportError -> check module installation/path
- AttributeError -> check object type/method existence
- IndentationError -> fix whitespace

### General
- Always check the line number in stack trace first
- Look for typos in variable/function names
- Check if dependencies are installed
