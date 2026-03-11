# Huong Dan Cai Dat

## Yeu Cau

- [Claude Code](https://claude.com/claude-code) da cai dat va cau hinh
- Git da cai dat
- De dung script: Node.js (tuy chon, cho script da nen tang)

## Cac Cach Cai Dat

### Cach 1: Script Tu Dong (Khuyen Nghi)

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

#### Node.js (Da nen tang)
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
node scripts/install.js
```

Script se:
1. Backup config hien tai (neu co)
2. Copy skills va commands vao `~/.claude/`
3. Hien thi cac commands co san

### Cach 2: Cai Dat Thu Cong

1. Clone repository:
```bash
git clone https://github.com/yourusername/claude-slave.git
```

2. Copy user config vao thu muc Claude config:
```bash
# Linux/macOS
cp -r claude-slave/user-config/* ~/.claude/

# Windows (PowerShell)
Copy-Item -Recurse claude-slave\user-config\* $env:USERPROFILE\.claude\
```

3. Khoi dong lai Claude Code de ap dung thay doi.

## Cau Hinh Rieng Cho Project

De dung skills/commands rieng cho project:

1. Copy project config vao project cua ban:
```bash
cp -r claude-slave/project-config/* your-project/.claude/
```

2. Chinh sua `your-project/.claude/CLAUDE.md` voi huong dan rieng cho project.

## Kiem Tra

Sau khi cai dat, kiem tra bang cach chay Claude Code:

```bash
claude
```

Sau do go `/` de xem cac commands co san. Ban se thay:
- `/cp` - Commit va push
- `/fix` - Fix nhanh
- `/pr` - Tao PR
- `/test` - Chay tests
- `/refactor` - Refactor code
- `/explain` - Giai thich code
- `/deploy` - Deploy

## Tao Skill Moi

1. Copy template:
```bash
cp -r templates/skill-template ~/.claude/skills/my-skill
```

2. Chinh sua `~/.claude/skills/my-skill/SKILL.md`:
```markdown
---
name: my-skill
description: Skill nay lam gi
---

# My Skill

Huong dan cho Claude...
```

3. Khoi dong lai Claude Code.

## Tao Command Moi

1. Copy template:
```bash
cp templates/command-template.md ~/.claude/commands/my-command.md
```

2. Chinh sua `~/.claude/commands/my-command.md`:
```markdown
---
description: Command nay lam gi
allowed-tools: Read, Edit, Bash(npm:*)
---

## Task

Claude se lam gi khi `/my-command` duoc goi...
```

3. Khoi dong lai Claude Code.

## Cap Nhat

De cap nhat len phien ban moi nhat:

```bash
cd claude-slave
git pull
./scripts/install.sh  # hoac script phu hop voi nen tang cua ban
```

## Go Cai Dat

De xoa tat ca skills va commands:

```bash
rm -rf ~/.claude/skills
rm -rf ~/.claude/commands
```

## Xu Ly Loi

### Commands khong xuat hien

1. Dam bao files nam dung vi tri (`~/.claude/commands/`)
2. Kiem tra phan mo rong file la `.md`
3. Khoi dong lai Claude Code

### Skills khong hoat dong

1. Kiem tra truong `description` cua skill phu hop voi use case
2. Xac nhan skill nam tai `~/.claude/skills/<skill-name>/SKILL.md`
3. Khoi dong lai Claude Code

### Loi quyen truy cap

```bash
# Linux/macOS
chmod -R 755 ~/.claude/skills ~/.claude/commands
```

## Cau Hoi Thuong Gap

**H: Toi co the co ca skills cap user va cap project khong?**
D: Co! Skills cap user (`~/.claude/`) ap dung toan cuc. Skills cap project (`project/.claude/`) chi ap dung cho project do.

**H: Lam sao de tam tat skill?**
D: Doi ten thu muc skill (vd: `quick-debug` thanh `_quick-debug`).

**H: Skills co the goi external APIs khong?**
D: Skills co the dung cac tools duoc phep nhu `Bash` de thuc hien curl requests, nhung can than voi bao mat.
