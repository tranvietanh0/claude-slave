---
description: Run tests and fix any failures
allowed-tools: Bash(npm test:*), Bash(yarn test:*), Bash(pnpm test:*), Bash(pytest:*), Bash(go test:*), Read, Edit, Grep, Glob
---

## Context

- Project files: !`ls -la`
- Package manager: !`ls package.json 2>/dev/null && echo "npm/yarn" || (ls go.mod 2>/dev/null && echo "go") || (ls requirements.txt 2>/dev/null && echo "python") || echo "unknown"`

## Task

1. Detect project type and test framework
2. Run the appropriate test command
3. If tests fail:
   - Analyze the failure
   - Fix the code
   - Re-run tests
4. Report results
