# Claude Code Skills & Commands

Bo suu tap skills, commands va cau hinh cho [Claude Code](https://claude.com/claude-code).

## Tinh Nang

- **Skills**: Cac hanh vi theo ngu canh giup nang cao kha nang cua Claude
- **Commands**: Lenh slash nhanh cho cac tac vu thuong dung
- **Templates**: Mau de tao skill/command moi
- **Scripts cai dat da nen tang**: Hoat dong tren Windows, Linux va macOS

## Bat Dau Nhanh

### Cach 1: Dung script cai dat

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

**Node.js (moi nen tang):**
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
node scripts/install.js
```

### Cach 2: Cai dat thu cong

Copy noi dung `user-config/` vao `~/.claude/`:
```bash
cp -r user-config/* ~/.claude/
```

## Cac Skills Co San

| Skill | Mo Ta |
|-------|-------|
| `quick-debug` | Debug nhanh - phan tich loi, de xuat fix |
| `vietnamese-coder` | Ho tro tieng Viet cho developer |
| `code-review` | Review chat luong code va de xuat cai thien |
| `doc-gen` | Tao documentation (JSDoc, README, etc.) |
| `security-check` | Kiem tra lo hong bao mat |

## Cac Commands Co San

| Command | Mo Ta |
|---------|-------|
| `/brainstorm` | Brainstorm & len ke hoach du an voi Q&A |
| `/cp` | Add, commit va push (git add + commit + push) |
| `/fix` | Fix nhanh loi |
| `/pr` | Tao pull request |
| `/test` | Chay tests va fix loi |
| `/refactor` | Refactor code |
| `/explain` | Giai thich code |
| `/deploy` | Deploy len production/staging |

## Tai Lieu

- [Huong Dan Cai Dat](SETUP.vi.md) - Huong dan chi tiet
- [English Guide](README.md) - Tai lieu tieng Anh

## Tao Skill/Command Moi

Xem thu muc `templates/` de co cac mau san:

- `templates/skill-template/SKILL.md` - Mau tao skill moi
- `templates/command-template.md` - Mau tao command moi
- `templates/agent-template.md` - Mau tao subagent moi

## Cau Truc Thu Muc

```
claude-slave/
├── user-config/        # Copy vao ~/.claude/
│   ├── skills/         # Skills cap user
│   └── commands/       # Commands cap user
├── project-config/     # Copy vao project/.claude/
│   ├── skills/         # Skills rieng cho project
│   └── agents/         # Custom subagents
├── templates/          # Mau tao moi
└── scripts/            # Scripts cai dat
```

## Giay Phep

MIT
