# Claude Code Skills & Commands

A collection of reusable skills, commands, and configurations for [Claude Code](https://claude.com/claude-code).

## Features

- **Skills**: Contextual behaviors that enhance Claude's capabilities
- **Commands**: Quick slash commands for common tasks
- **Templates**: Starter templates for creating your own skills/commands
- **Cross-platform install scripts**: Works on Windows, Linux, and macOS

## Quick Start

### Option 1: Using install script

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

### Option 2: Manual installation

Copy the contents of `user-config/` to `~/.claude/`:
```bash
cp -r user-config/* ~/.claude/
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

## Documentation

- [Setup Guide](SETUP.md) - Detailed installation instructions
- [Vietnamese Guide](README.vi.md) - Documentation in Vietnamese

## Creating Custom Skills/Commands

See the `templates/` directory for starter templates:

- `templates/skill-template/SKILL.md` - Template for new skills
- `templates/command-template.md` - Template for new commands
- `templates/agent-template.md` - Template for custom subagents

## Project Structure

```
claude-slave/
├── user-config/        # Copy to ~/.claude/
│   ├── skills/         # User-level skills
│   └── commands/       # User-level commands
├── project-config/     # Copy to project/.claude/
│   ├── skills/         # Project-specific skills
│   └── agents/         # Custom subagents
├── templates/          # Templates for creating new items
└── scripts/            # Installation scripts
```

## License

MIT
