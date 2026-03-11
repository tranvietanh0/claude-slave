---
description: Deploy to production or staging environment
allowed-tools: Bash(npm:*), Bash(yarn:*), Bash(pnpm:*), Bash(git:*), Bash(docker:*), Bash(kubectl:*), Read, Glob
---

## Context

- Current branch: !`git branch --show-current 2>/dev/null`
- Git status: !`git status --short 2>/dev/null`
- Package.json scripts: !`cat package.json 2>/dev/null | grep -A 20 '"scripts"' || echo "No package.json"`
- Docker files: !`ls Dockerfile docker-compose.yml 2>/dev/null || echo "No Docker files"`

## Task

Deploy the application to the specified environment.

### Pre-deployment Checklist

1. Ensure all changes are committed
2. Run tests to verify build is stable
3. Build the application
4. Tag the release (if production)

### Deployment Steps

**For npm/yarn projects:**
```bash
# Build
npm run build

# Deploy (if deploy script exists)
npm run deploy
```

**For Docker projects:**
```bash
# Build image
docker build -t app:latest .

# Push to registry
docker push app:latest
```

**For production deployments:**
```bash
# Create git tag
git tag -a v$(date +%Y%m%d.%H%M) -m "Release $(date +%Y-%m-%d)"
git push --tags
```

### Environment Options

If $ARGUMENTS contains:
- `staging` or `stg`: Deploy to staging
- `production` or `prod`: Deploy to production (with confirmation)
- No argument: Default to staging

### Safety

- Always run tests before deploying
- For production, require explicit confirmation
- Create a git tag for production releases
- Log deployment details
