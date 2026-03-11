# AI Coding Assistant - Skills & Commands

A collection of reusable skills, commands, and configurations for **Claude Code** and **OpenCode**.

## Supported Tools

| Tool | Config Directory |
|------|------------------|
| Claude Code | `~/.claude/` |
| OpenCode | `~/.opencode/` |

## Features

- **Skills**: Contextual behaviors that enhance AI capabilities
- **Commands**: Quick slash commands for common tasks
- **Templates**: Starter templates for creating your own skills/commands
- **Cross-platform install scripts**: Works on Windows, Linux, and macOS

## Quick Start

### Using install script

**Linux/macOS:**
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
./scripts/install.sh
```

**Windows PowerShell:**
```powershell
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
.\scripts\install.ps1
```

**Node.js (any platform):**
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
node scripts/install.js
```

The script will ask you to choose:
1. Claude Code only
2. OpenCode only
3. Both

### Manual installation

```bash
# For Claude Code
cp -r claude/* ~/.claude/

# For OpenCode
cp -r opencode/* ~/.opencode/
```

## Available Skills

| Skill | Description |
|-------|-------------|
| `quick-debug` | Fast debugging - analyze errors, suggest fixes |
| `vietnamese-coder` | Vietnamese language support for developers |
| `code-review` | Code quality review and suggestions |
| `doc-gen` | Generate documentation (JSDoc, README, etc.) |
| `security-check` | Check for security vulnerabilities |

## Available Commands

| Command | Description |
|---------|-------------|
| `/brainstorm` | Brainstorm & plan projects with Q&A |
| `/go` | Implement plan - triển khai code theo plan.md |
| `/cp` | Add, commit and push (git add + commit + push) |
| `/fix` | Quick fix for errors |
| `/pr` | Create a pull request |
| `/test` | Run tests and fix failures |
| `/refactor` | Refactor code |
| `/rvc` | Review code - SOLID, maintainability, scalability |
| `/explain` | Explain code |
| `/deploy` | Deploy to production/staging |

## Project Structure

```
claude-slave/
├── claude/                 # Claude Code config
│   ├── skills/
│   ├── commands/
│   ├── settings.json       # Bypass mode
│   └── settings.safe.json  # Safe mode
├── opencode/               # OpenCode config
│   ├── skills/
│   ├── commands/
│   ├── settings.json
│   └── settings.safe.json
├── project-config/         # Project-specific templates
├── templates/              # Templates for creating new items
└── scripts/                # Installation scripts
```

## Documentation

- [Setup Guide](SETUP.md) - Detailed installation instructions
- [Hướng dẫn tiếng Việt](README.vi.md) - Vietnamese documentation

## Permission Modes

### Bypass Mode (default)
Full permissions - no confirmation needed:
```json
{
  "permissions": {
    "allow": ["Bash(*)", "Read(*)", "Write(*)", "Edit(*)", "..."]
  }
}
```

### Safe Mode
Read-only permissions:
```bash
cp ~/.claude/settings.safe.json ~/.claude/settings.json
```

## License

MIT
