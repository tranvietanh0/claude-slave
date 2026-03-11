# Hướng Dẫn Cài Đặt

## Yêu Cầu

- [Claude Code](https://claude.com/claude-code) đã cài đặt và cấu hình
- Git đã cài đặt
- Để dùng script: Node.js (tùy chọn, cho script đa nền tảng)

## Các Cách Cài Đặt

### Cách 1: Script Tự Động (Khuyên Dùng)

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

#### Node.js (Đa nền tảng)
```bash
git clone https://github.com/yourusername/claude-slave.git
cd claude-slave
node scripts/install.js
```

Script sẽ:
1. Backup config hiện tại (nếu có)
2. Copy skills và commands vào `~/.claude/`
3. Hiển thị các commands có sẵn

### Cách 2: Cài Đặt Thủ Công

1. Clone repository:
```bash
git clone https://github.com/yourusername/claude-slave.git
```

2. Copy user config vào thư mục Claude config:
```bash
# Linux/macOS
cp -r claude-slave/user-config/* ~/.claude/

# Windows (PowerShell)
Copy-Item -Recurse claude-slave\user-config\* $env:USERPROFILE\.claude\
```

3. Khởi động lại Claude Code để áp dụng thay đổi.

## Cấu Hình Riêng Cho Project

Để dùng skills/commands riêng cho project:

1. Copy project config vào project của bạn:
```bash
cp -r claude-slave/project-config/* your-project/.claude/
```

2. Chỉnh sửa `your-project/.claude/CLAUDE.md` với hướng dẫn riêng cho project.

## Kiểm Tra

Sau khi cài đặt, kiểm tra bằng cách chạy Claude Code:

```bash
claude
```

Sau đó gõ `/` để xem các commands có sẵn. Bạn sẽ thấy:
- `/brainstorm` - Brainstorm & lên kế hoạch dự án với Q&A
- `/go` - Implement plan (sau khi brainstorm)
- `/cp` - Add, commit và push
- `/fix` - Fix nhanh
- `/pr` - Tạo PR
- `/test` - Chạy tests
- `/refactor` - Refactor code
- `/rvc` - Review code (SOLID, maintainability, scalability)
- `/explain` - Giải thích code
- `/deploy` - Deploy

## Tạo Skill Mới

1. Copy template:
```bash
cp -r templates/skill-template ~/.claude/skills/my-skill
```

2. Chỉnh sửa `~/.claude/skills/my-skill/SKILL.md`:
```markdown
---
name: my-skill
description: Skill này làm gì
---

# My Skill

Hướng dẫn cho Claude...
```

3. Khởi động lại Claude Code.

## Tạo Command Mới

1. Copy template:
```bash
cp templates/command-template.md ~/.claude/commands/my-command.md
```

2. Chỉnh sửa `~/.claude/commands/my-command.md`:
```markdown
---
description: Command này làm gì
allowed-tools: Read, Edit, Bash(npm:*)
---

## Task

Claude sẽ làm gì khi `/my-command` được gọi...
```

3. Khởi động lại Claude Code.

## Cập Nhật

Để cập nhật lên phiên bản mới nhất:

```bash
cd claude-slave
git pull
./scripts/install.sh  # hoặc script phù hợp với nền tảng của bạn
```

## Gỡ Cài Đặt

Để xóa tất cả skills và commands:

```bash
rm -rf ~/.claude/skills
rm -rf ~/.claude/commands
```

## Xử Lý Lỗi

### Commands không xuất hiện

1. Đảm bảo files nằm đúng vị trí (`~/.claude/commands/`)
2. Kiểm tra phần mở rộng file là `.md`
3. Khởi động lại Claude Code

### Skills không hoạt động

1. Kiểm tra trường `description` của skill phù hợp với use case
2. Xác nhận skill nằm tại `~/.claude/skills/<skill-name>/SKILL.md`
3. Khởi động lại Claude Code

### Lỗi quyền truy cập

```bash
# Linux/macOS
chmod -R 755 ~/.claude/skills ~/.claude/commands
```

## Câu Hỏi Thường Gặp

**H: Tôi có thể có cả skills cấp user và cấp project không?**
Đ: Có! Skills cấp user (`~/.claude/`) áp dụng toàn cục. Skills cấp project (`project/.claude/`) chỉ áp dụng cho project đó.

**H: Làm sao để tạm tắt skill?**
Đ: Đổi tên thư mục skill (vd: `quick-debug` thành `_quick-debug`).

**H: Skills có thể gọi external APIs không?**
Đ: Skills có thể dùng các tools được phép như `Bash` để thực hiện curl requests, nhưng cẩn thận với bảo mật.
