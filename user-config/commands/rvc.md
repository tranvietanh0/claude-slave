---
description: Review code - đánh giá code và đề xuất cải thiện theo SOLID, maintainability, scalability
allowed-tools: Read, Glob, Grep
---

## Context

- Current directory: !`pwd`
- Project files: !`ls -la`
- Git status: !`git status --short 2>/dev/null`

## Task

Review code và đề xuất cải thiện. Nếu user chỉ định file/folder cụ thể qua $ARGUMENTS, focus vào đó. Nếu không, review toàn bộ codebase.

### Quy Trình Review

1. **Đọc và hiểu code** - Scan cấu trúc project, đọc các file chính
2. **Đánh giá theo tiêu chí** - Áp dụng checklist bên dưới
3. **Tổng hợp báo cáo** - Liệt kê vấn đề và đề xuất

### Tiêu Chí Đánh Giá

#### 1. SOLID Principles
- **S** - Single Responsibility: Mỗi class/function chỉ làm 1 việc?
- **O** - Open/Closed: Dễ mở rộng mà không sửa code cũ?
- **L** - Liskov Substitution: Subclass thay thế được parent?
- **I** - Interface Segregation: Interface nhỏ gọn, không thừa method?
- **D** - Dependency Inversion: Depend on abstractions, not concretions?

#### 2. Maintainability
- Code có dễ đọc, dễ hiểu?
- Naming conventions nhất quán?
- Comments/docs đầy đủ cho logic phức tạp?
- Không có magic numbers/strings?
- Error handling rõ ràng?
- Logging đầy đủ?

#### 3. Scalability
- Có bottlenecks về performance?
- Database queries có được tối ưu?
- Có caching strategy?
- Có thể horizontal scale?
- Async/concurrent handling đúng cách?

#### 4. Code Smells
- Duplicate code
- Long methods (>30 lines)
- Large classes (>300 lines)
- Deep nesting (>3 levels)
- God objects
- Feature envy
- Dead code

#### 5. Security (Basic)
- Input validation
- SQL injection risks
- XSS vulnerabilities
- Hardcoded secrets

### Output Format

```markdown
# Code Review Report

## Tổng Quan
- **Project**: [Tên project]
- **Files reviewed**: [Số file]
- **Overall score**: [A/B/C/D/F]

## Điểm Mạnh
- ✅ [Điểm tốt 1]
- ✅ [Điểm tốt 2]

## Vấn Đề Cần Cải Thiện

### 🔴 Critical (Cần fix ngay)
| File | Line | Vấn đề | Đề xuất |
|------|------|--------|---------|
| `path/file.ts` | 42 | Mô tả | Cách fix |

### 🟡 Warning (Nên fix)
| File | Line | Vấn đề | Đề xuất |
|------|------|--------|---------|
| `path/file.ts` | 100 | Mô tả | Cách fix |

### 🔵 Info (Có thể cải thiện)
| File | Line | Vấn đề | Đề xuất |
|------|------|--------|---------|
| `path/file.ts` | 55 | Mô tả | Cách fix |

## SOLID Analysis
- **S**: ✅/⚠️/❌ - [Nhận xét]
- **O**: ✅/⚠️/❌ - [Nhận xét]
- **L**: ✅/⚠️/❌ - [Nhận xét]
- **I**: ✅/⚠️/❌ - [Nhận xét]
- **D**: ✅/⚠️/❌ - [Nhận xét]

## Đề Xuất Refactor

### Ưu tiên cao
1. [Đề xuất 1] - Lý do, cách làm
2. [Đề xuất 2] - Lý do, cách làm

### Ưu tiên trung bình
1. [Đề xuất]

### Nice to have
1. [Đề xuất]

## Kết Luận
[Tóm tắt và next steps]
```

### Guidelines

- Đánh giá khách quan, không quá khắt khe
- Ưu tiên vấn đề ảnh hưởng lớn đến maintainability/scalability
- Đề xuất phải actionable (có thể thực hiện được)
- Nếu code tốt, ghi nhận điểm mạnh
- Trả lời bằng tiếng Việt
