# Claude Code Skills & Commands

Bộ sưu tập skills, commands và cấu hình cho [Claude Code](https://claude.com/claude-code).

## Tính Năng

- **Skills**: Các hành vi theo ngữ cảnh giúp nâng cao khả năng của Claude
- **Commands**: Lệnh slash nhanh cho các tác vụ thường dùng
- **Templates**: Mẫu để tạo skill/command mới
- **Scripts cài đặt đa nền tảng**: Hoạt động trên Windows, Linux và macOS

## Bắt Đầu Nhanh

### Cách 1: Dùng script cài đặt

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

**Node.js (mọi nền tảng):**
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
node scripts/install.js
```

### Cách 2: Cài đặt thủ công

Copy nội dung `user-config/` vào `~/.claude/`:
```bash
cp -r user-config/* ~/.claude/
```

## Các Skills Có Sẵn

| Skill | Mô Tả |
|-------|-------|
| `quick-debug` | Debug nhanh - phân tích lỗi, đề xuất fix |
| `vietnamese-coder` | Hỗ trợ tiếng Việt cho developer |
| `code-review` | Review chất lượng code và đề xuất cải thiện |
| `doc-gen` | Tạo documentation (JSDoc, README, etc.) |
| `security-check` | Kiểm tra lỗ hổng bảo mật |

## Các Commands Có Sẵn

| Command | Mô Tả |
|---------|-------|
| `/brainstorm` | Brainstorm & lên kế hoạch dự án với Q&A |
| `/cp` | Add, commit và push (git add + commit + push) |
| `/fix` | Fix nhanh lỗi |
| `/pr` | Tạo pull request |
| `/test` | Chạy tests và fix lỗi |
| `/refactor` | Refactor code |
| `/explain` | Giải thích code |
| `/deploy` | Deploy lên production/staging |

## Tài Liệu

- [Hướng Dẫn Cài Đặt](SETUP.vi.md) - Hướng dẫn chi tiết
- [English Guide](README.md) - Tài liệu tiếng Anh

## Tạo Skill/Command Mới

Xem thư mục `templates/` để có các mẫu sẵn:

- `templates/skill-template/SKILL.md` - Mẫu tạo skill mới
- `templates/command-template.md` - Mẫu tạo command mới
- `templates/agent-template.md` - Mẫu tạo subagent mới

## Cấu Trúc Thư Mục

```
claude-slave/
├── user-config/        # Copy vào ~/.claude/
│   ├── skills/         # Skills cấp user
│   └── commands/       # Commands cấp user
├── project-config/     # Copy vào project/.claude/
│   ├── skills/         # Skills riêng cho project
│   └── agents/         # Custom subagents
├── templates/          # Mẫu tạo mới
└── scripts/            # Scripts cài đặt
```

## Giấy Phép

MIT
