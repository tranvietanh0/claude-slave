---
name: security-check
description: Security vulnerability checker - scan for OWASP top 10 vulnerabilities, hardcoded secrets, and dependency issues. Use when user asks to check security, find vulnerabilities, or audit code.
allowed-tools: Read, Glob, Grep, Bash(npm audit:*), Bash(pip audit:*), Bash(safety:*)
---

# Security Check Skill

Scan code for security vulnerabilities and issues.

## Check Areas

### 1. OWASP Top 10

- **Injection**: SQL, NoSQL, OS command, LDAP injection
- **Broken Authentication**: Weak passwords, session issues
- **Sensitive Data Exposure**: Unencrypted data, weak crypto
- **XXE**: XML external entity attacks
- **Broken Access Control**: Unauthorized access
- **Security Misconfiguration**: Default configs, verbose errors
- **XSS**: Cross-site scripting
- **Insecure Deserialization**: Untrusted data deserialization
- **Vulnerable Components**: Outdated dependencies
- **Insufficient Logging**: Missing audit trails

### 2. Hardcoded Secrets

Search patterns:
- API keys: `api[_-]?key|apikey`
- Passwords: `password|passwd|pwd`
- Tokens: `token|secret|bearer`
- AWS keys: `AKIA[0-9A-Z]{16}`
- Private keys: `-----BEGIN.*PRIVATE KEY-----`

### 3. Dependency Vulnerabilities

- npm audit (Node.js)
- pip audit / safety (Python)
- go mod verify (Go)

## Response Format

```
## Security Scan Report

### Critical Issues
- [Issue] - [File:Line] - [Description]

### High Risk
- [Issue] - [File:Line] - [Description]

### Medium Risk
- [Issue] - [File:Line] - [Description]

### Low Risk
- [Issue] - [File:Line] - [Description]

### Dependency Vulnerabilities
- [Package] - [Version] - [CVE/Advisory]

### Recommendations
1. [Prioritized fix suggestions]
```

## Workflow

1. Scan for hardcoded secrets
2. Check for injection vulnerabilities
3. Review authentication/authorization
4. Run dependency audit
5. Report findings by severity

## Common Fixes

- **Hardcoded secrets**: Use environment variables
- **SQL injection**: Use parameterized queries
- **XSS**: Sanitize output, use CSP
- **Outdated deps**: Update to patched versions
