---
description: Brainstorm and plan project development - analyze codebase, ask clarifying questions, create detailed plan
allowed-tools: Read, Glob, Grep, Write, Edit
---

## Context

- Current directory: !`pwd`
- Project files: !`ls -la 2>/dev/null | head -20`
- Package.json: !`cat package.json 2>/dev/null | head -30 || echo "No package.json"`
- Existing tech stack: !`ls *.json *.yaml *.yml *.config.* 2>/dev/null | head -10 || echo "No config files"`
- Git status: !`git status --short 2>/dev/null | head -10`

## Task

User wants to brainstorm and plan: $ARGUMENTS

### Phase 1: Codebase Analysis

First, analyze the current codebase:
1. Check existing project structure
2. Identify tech stack being used
3. Find relevant existing code/patterns
4. Note any constraints or dependencies

Report findings briefly.

### Phase 2: Clarifying Questions (Q&A)

Ask user clarifying questions in this format:

```
## Cau hoi lam ro

**Q1: [Question about unclear requirement]**
- [ ] Option A: [Description]
- [ ] Option B: [Description]
- [ ] Option C: [Description]
- [ ] Custom: [Let user specify]

**Q2: [Another question]**
- [ ] Option A: ...
- [ ] Option B: ...

(Continue for all unclear points)
```

Questions to consider:
- What is the main purpose/goal?
- Who are the target users?
- What features are required vs nice-to-have?
- Any specific tech stack preferences?
- What's the timeline/priority?
- Any existing systems to integrate with?
- Design/UI preferences?

STOP and wait for user to answer before proceeding.

### Phase 3: Module Breakdown

After user answers, break down into modules:

```
## Cac Module

### Module 1: [Name]
- Muc dich: ...
- Files can tao: ...
- Dependencies: ...
- Do phuc tap: Low/Medium/High

### Module 2: [Name]
...
```

### Phase 4: Write Plan

Create `plan.md` file with this structure:

```markdown
# Project Plan: [Project Name]

## Tong Quan
- Muc tieu: ...
- Tech stack: ...
- Timeline: ...

## Cac Quyet Dinh Tu User
- Q1: [Question] -> [User's choice]
- Q2: [Question] -> [User's choice]
...

## Module Breakdown

### Module 1: [Name]
**Files:**
- `path/to/file.ts` - Description

**Tasks:**
1. [ ] Task 1
2. [ ] Task 2

**Estimated effort:** X hours

### Module 2: [Name]
...

## Thu Tu Trien Khai
1. Module X (foundation)
2. Module Y (depends on X)
3. Module Z (can parallel with Y)

## Risks & Notes
- Risk 1: ...
- Note 1: ...
```

### Guidelines

- Respond in Vietnamese (user is Vietnamese)
- Be thorough but concise
- Focus on practical, actionable plans
- Consider existing code patterns
- DO NOT start coding - only create plan
- Wait for user review before any implementation

### Output

1. Brief codebase analysis
2. Q&A questions (wait for answers)
3. After answers: Create `plan.md`
4. Ask user to review: "Xin hay review plan.md va cho toi biet neu can chinh sua gi"
