---
description: Create a pull request with current changes
allowed-tools: Bash(git:*), Bash(gh:*)
---

## Context

- Current branch: !`git branch --show-current 2>/dev/null || echo "not a git repo"`
- Git status: !`git status --short 2>/dev/null`
- Recent commits on this branch: !`git log --oneline -5 2>/dev/null`
- Diff summary: !`git diff --stat HEAD~1 2>/dev/null || git diff --stat`

## Task

Create a pull request:

1. Check if there are uncommitted changes - commit them first if needed
2. Push the current branch to origin
3. Create PR using `gh pr create`
   - Write clear title (under 70 chars)
   - Write concise description with:
     - Summary of changes
     - Any breaking changes
     - Test instructions if applicable

Use format:
```
gh pr create --title "..." --body "..."
```
