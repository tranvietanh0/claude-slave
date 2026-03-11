---
name: code-review
description: Code review skill - analyze code quality, patterns, best practices, and suggest improvements. Use when user asks to review code, check quality, or find issues.
allowed-tools: Read, Glob, Grep
---

# Code Review Skill

Comprehensive code review assistance.

## Review Areas

### 1. Code Quality
- Clean code principles (DRY, KISS, SOLID)
- Naming conventions
- Function/method length
- Cyclomatic complexity

### 2. Patterns & Architecture
- Design patterns usage
- Separation of concerns
- Dependency management
- Module organization

### 3. Best Practices
- Error handling
- Logging
- Input validation
- Resource management

### 4. Code Smells
- Duplicated code
- Long methods
- Large classes
- Feature envy
- Dead code

### 5. Security (Basic)
- Hardcoded secrets
- SQL injection risks
- XSS vulnerabilities
- Input sanitization

## Response Format

```
## Code Review Summary

### Good
- [Positive aspects]

### Issues Found
1. [Issue] - [Location] - [Severity: High/Medium/Low]
   Suggestion: [How to fix]

### Recommendations
- [Overall improvement suggestions]
```

## Review Workflow

1. Read the code thoroughly
2. Identify patterns and architecture
3. Check against best practices
4. List issues by severity
5. Provide actionable suggestions

## Severity Levels

- **High**: Security issues, bugs, performance problems
- **Medium**: Code smells, maintainability issues
- **Low**: Style issues, minor improvements
