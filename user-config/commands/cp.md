---
description: Add, commit and push changes to remote (git add + commit + push)
allowed-tools: Bash(git:*)
---

## Context

- Current branch: !`git branch --show-current 2>/dev/null`
- Git status (all files): !`git status --short 2>/dev/null`
- Untracked files: !`git ls-files --others --exclude-standard 2>/dev/null | head -10`
- Staged changes: !`git diff --cached --stat 2>/dev/null`
- Unstaged changes: !`git diff --stat 2>/dev/null`
- Recent commits: !`git log --oneline -5 2>/dev/null`

## Task

Add, commit and push all changes to remote:

1. **Add all changes**: `git add -A` (includes new, modified, deleted files)
2. **Commit** with clear message based on the changes
3. **Push** to origin: `git push`

If user provided a message via $ARGUMENTS, use that as commit message.
Otherwise, analyze the changes and write a concise commit message.

Commit message format:
- Start with verb: add, fix, update, remove, refactor
- Keep under 72 characters
- Be specific about what changed

Example:
```bash
git add -A
git commit -m "fix: resolve null pointer in user service"
git push
```
