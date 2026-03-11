---
description: Implement plan - đọc plan.md và bắt đầu triển khai code theo kế hoạch
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(npm:*), Bash(yarn:*), Bash(pnpm:*), Bash(git:*), Bash(mkdir:*), Bash(touch:*)
---

## Context

- Current directory: !`pwd`
- Plan file: !`cat plan.md 2>/dev/null | head -100`
- Project files: !`ls -la`

## Task

User đã accept plan. Bắt đầu triển khai code theo plan.md.

### Workflow

1. **Đọc plan.md** - Hiểu toàn bộ kế hoạch
2. **Xác định module đầu tiên** - Bắt đầu từ module foundation
3. **Triển khai từng module:**
   - Tạo folder structure
   - Tạo files theo plan
   - Viết code cho từng file
   - Test cơ bản (nếu có)
4. **Báo cáo tiến độ** sau mỗi module

### Output Format

Sau mỗi module hoàn thành:

```
✅ Module [Tên] - DONE

Files đã tạo:
- path/to/file1.ts
- path/to/file2.ts

Tiếp theo: Module [Tên tiếp theo]
Tiếp tục? (Enter để tiếp tục, hoặc feedback)
```

### Guidelines

- Triển khai đúng theo plan.md
- Không thay đổi plan trừ khi user yêu cầu
- Code phải chạy được, không để placeholder
- Tạo đủ imports, types, interfaces
- Follow best practices của tech stack
- Commit sau mỗi module nếu user muốn
- Hỏi user trước khi chuyển sang module tiếp theo

### Nếu không có plan.md

Thông báo: "Chưa có plan.md. Hãy chạy `/brainstorm [yêu cầu]` trước để tạo kế hoạch."
