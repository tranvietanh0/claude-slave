# AI Coding Assistant - Skills & Commands

Bộ sưu tập skills, commands và cấu hình cho **Claude Code** và **OpenCode**.

## Công Cụ Hỗ Trợ

| Công Cụ | Thư Mục Config |
|---------|----------------|
| Claude Code | `~/.claude/` |
| OpenCode | `~/.opencode/` |

## Tính Năng

- **Skills**: Các hành vi theo ngữ cảnh giúp nâng cao khả năng của AI
- **Commands**: Lệnh slash nhanh cho các tác vụ thường dùng
- **Templates**: Mẫu để tạo skill/command mới
- **Scripts cài đặt đa nền tảng**: Hoạt động trên Windows, Linux và macOS

## Bắt Đầu Nhanh

### Dùng script cài đặt

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

Script sẽ hỏi bạn chọn:
1. Chỉ Claude Code
2. Chỉ OpenCode
3. Cả hai

### Cài đặt thủ công

```bash
# Cho Claude Code
cp -r claude/* ~/.claude/

# Cho OpenCode
cp -r opencode/* ~/.opencode/
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
| `/go` | Implement plan - triển khai code theo plan.md |
| `/cp` | Add, commit và push (git add + commit + push) |
| `/fix` | Fix nhanh lỗi |
| `/pr` | Tạo pull request |
| `/test` | Chạy tests và fix lỗi |
| `/refactor` | Refactor code |
| `/rvc` | Review code - đánh giá SOLID, maintainability, scalability |
| `/explain` | Giải thích code |
| `/deploy` | Deploy lên production/staging |

## Cấu Trúc Thư Mục

```
claude-slave/
├── claude/                 # Config cho Claude Code
│   ├── skills/
│   ├── commands/
│   ├── settings.json       # Bypass mode
│   └── settings.safe.json  # Safe mode
├── opencode/               # Config cho OpenCode
│   ├── skills/
│   ├── commands/
│   ├── settings.json
│   └── settings.safe.json
├── project-config/         # Templates cho project
├── templates/              # Mẫu tạo mới
└── scripts/                # Scripts cài đặt
```

## Tài Liệu

- [Hướng Dẫn Cài Đặt](SETUP.vi.md) - Hướng dẫn chi tiết
- [English Guide](README.md) - Tài liệu tiếng Anh

## Chế Độ Permission

### Bypass Mode (mặc định)
Toàn quyền - không cần xác nhận:
```json
{
  "permissions": {
    "allow": ["Bash(*)", "Read(*)", "Write(*)", "Edit(*)", "..."]
  }
}
```

### Safe Mode
Chỉ đọc:
```bash
cp ~/.claude/settings.safe.json ~/.claude/settings.json
```

## Giấy Phép

MIT
