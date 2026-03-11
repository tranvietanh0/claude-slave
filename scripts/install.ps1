# Claude Code Skills & Commands Installer
# For Windows PowerShell

$ErrorActionPreference = "Stop"

Write-Host "==================================" -ForegroundColor Cyan
Write-Host " Claude Code Skills Installer" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoDir = Split-Path -Parent $ScriptDir
$ClaudeDir = Join-Path $env:USERPROFILE ".claude"

# Check if Claude config directory exists
if (-not (Test-Path $ClaudeDir)) {
    Write-Host "Creating Claude config directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $ClaudeDir -Force | Out-Null
}

# Backup existing config
$SkillsDir = Join-Path $ClaudeDir "skills"
$CommandsDir = Join-Path $ClaudeDir "commands"

if ((Test-Path $SkillsDir) -or (Test-Path $CommandsDir)) {
    $BackupDir = Join-Path $ClaudeDir "backups\backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Write-Host "Backing up existing config to $BackupDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null

    if (Test-Path $SkillsDir) {
        Copy-Item -Path $SkillsDir -Destination $BackupDir -Recurse
    }

    if (Test-Path $CommandsDir) {
        Copy-Item -Path $CommandsDir -Destination $BackupDir -Recurse
    }
}

# Copy skills
Write-Host "Installing skills..." -ForegroundColor Green
$SourceSkills = Join-Path $RepoDir "user-config\skills"
if (-not (Test-Path $SkillsDir)) {
    New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null
}
Copy-Item -Path "$SourceSkills\*" -Destination $SkillsDir -Recurse -Force

# Copy commands
Write-Host "Installing commands..." -ForegroundColor Green
$SourceCommands = Join-Path $RepoDir "user-config\commands"
if (-not (Test-Path $CommandsDir)) {
    New-Item -ItemType Directory -Path $CommandsDir -Force | Out-Null
}
Copy-Item -Path "$SourceCommands\*" -Destination $CommandsDir -Recurse -Force

# List installed items
Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""

Write-Host "Installed skills:"
Get-ChildItem -Path $SkillsDir -Directory | ForEach-Object {
    Write-Host "  - $($_.Name)"
}

Write-Host ""
Write-Host "Installed commands:"
Get-ChildItem -Path $CommandsDir -Filter "*.md" | ForEach-Object {
    Write-Host "  - /$($_.BaseName)"
}

Write-Host ""
Write-Host "Please restart Claude Code to apply changes." -ForegroundColor Yellow
Write-Host ""
