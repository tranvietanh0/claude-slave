# Setup Guide

## Prerequisites

- [Claude Code](https://claude.com/claude-code) installed and configured
- Git installed
- For script installation: Node.js (optional, for cross-platform script)

## Installation Methods

### Method 1: Automated Script (Recommended)

#### Linux/macOS
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
chmod +x scripts/install.sh
./scripts/install.sh
```

#### Windows PowerShell
```powershell
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
.\scripts\install.ps1
```

#### Node.js (Cross-platform)
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
node scripts/install.js
```

The script will:
1. Backup your existing config (if any)
2. Copy skills and commands to `~/.claude/`
3. Display available commands

### Method 2: Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/claude-slave.git
```

2. Copy user config to Claude config directory:
```bash
# Linux/macOS
cp -r claude-slave/user-config/* ~/.claude/

# Windows (PowerShell)
Copy-Item -Recurse claude-slave\user-config\* $env:USERPROFILE\.claude\
```

3. Restart Claude Code to apply changes.

## Project-Specific Configuration

To use project-specific skills/commands:

1. Copy project config to your project:
```bash
cp -r claude-slave/project-config/* your-project/.claude/
```

2. Edit `your-project/.claude/CLAUDE.md` with project-specific instructions.

## Verification

After installation, verify by running Claude Code:

```bash
claude
```

Then type `/` to see available commands. You should see:
- `/brainstorm` - Brainstorm & plan projects with Q&A
- `/go` - Implement plan (after brainstorm)
- `/cp` - Add, commit and push
- `/fix` - Quick fix
- `/pr` - Create PR
- `/test` - Run tests
- `/refactor` - Refactor code
- `/rvc` - Review code (SOLID, maintainability, scalability)
- `/explain` - Explain code
- `/deploy` - Deploy

## Creating Custom Skills

1. Copy the template:
```bash
cp -r templates/skill-template ~/.claude/skills/my-skill
```

2. Edit `~/.claude/skills/my-skill/SKILL.md`:
```markdown
---
name: my-skill
description: What this skill does
---

# My Skill

Instructions for Claude...
```

3. Restart Claude Code.

## Creating Custom Commands

1. Copy the template:
```bash
cp templates/command-template.md ~/.claude/commands/my-command.md
```

2. Edit `~/.claude/commands/my-command.md`:
```markdown
---
description: What this command does
allowed-tools: Read, Edit, Bash(npm:*)
---

## Task

What Claude should do when `/my-command` is invoked...
```

3. Restart Claude Code.

## Updating

To update to the latest version:

```bash
cd claude-slave
git pull
./scripts/install.sh  # or appropriate script for your platform
```

## Uninstalling

To remove all skills and commands:

```bash
rm -rf ~/.claude/skills
rm -rf ~/.claude/commands
```

## Troubleshooting

### Commands not appearing

1. Ensure files are in correct location (`~/.claude/commands/`)
2. Check file extension is `.md`
3. Restart Claude Code

### Skills not triggering

1. Check the skill's `description` field matches use case
2. Verify skill is in `~/.claude/skills/<skill-name>/SKILL.md`
3. Restart Claude Code

### Permission errors

```bash
# Linux/macOS
chmod -R 755 ~/.claude/skills ~/.claude/commands
```

## FAQ

**Q: Can I have both user-level and project-level skills?**
A: Yes! User-level skills (`~/.claude/`) apply globally. Project-level skills (`project/.claude/`) only apply to that project.

**Q: How do I disable a skill temporarily?**
A: Rename the skill folder (e.g., `quick-debug` to `_quick-debug`).

**Q: Can skills call external APIs?**
A: Skills can use allowed tools like `Bash` to make curl requests, but be careful with security.
