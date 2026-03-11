# Claude Code & OpenCode Skills Installer
# For Windows PowerShell

$ErrorActionPreference = "Stop"

Write-Host "==================================" -ForegroundColor Cyan
Write-Host " Skills & Commands Installer" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoDir = Split-Path -Parent $ScriptDir

Write-Host "Chon cong cu de cai dat:"
Write-Host "  1) Claude Code"
Write-Host "  2) OpenCode"
Write-Host "  3) Ca hai"
Write-Host ""
$choice = Read-Host "Lua chon [1-3]"

function Install-Claude {
    $ClaudeDir = Join-Path $env:USERPROFILE ".claude"
    Write-Host "Installing Claude Code config..." -ForegroundColor Green

    # Create directories
    New-Item -ItemType Directory -Path "$ClaudeDir\skills" -Force | Out-Null
    New-Item -ItemType Directory -Path "$ClaudeDir\commands" -Force | Out-Null
    New-Item -ItemType Directory -Path "$ClaudeDir\backups" -Force | Out-Null

    # Backup
    $SkillsExist = Test-Path "$ClaudeDir\skills\*"
    if ($SkillsExist) {
        $BackupDir = "$ClaudeDir\backups\backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
        Copy-Item -Path "$ClaudeDir\skills" -Destination $BackupDir -Recurse -ErrorAction SilentlyContinue
        Copy-Item -Path "$ClaudeDir\commands" -Destination $BackupDir -Recurse -ErrorAction SilentlyContinue
        Write-Host "Backed up to $BackupDir" -ForegroundColor Yellow
    }

    # Copy
    Copy-Item -Path "$RepoDir\claude\skills\*" -Destination "$ClaudeDir\skills\" -Recurse -Force
    Copy-Item -Path "$RepoDir\claude\commands\*" -Destination "$ClaudeDir\commands\" -Recurse -Force
    Copy-Item -Path "$RepoDir\claude\settings.json" -Destination "$ClaudeDir\" -Force

    Write-Host "Claude Code installed!" -ForegroundColor Green
}

function Install-OpenCode {
    $OpenCodeDir = Join-Path $env:USERPROFILE ".opencode"
    Write-Host "Installing OpenCode config..." -ForegroundColor Green

    # Create directories
    New-Item -ItemType Directory -Path "$OpenCodeDir\skills" -Force | Out-Null
    New-Item -ItemType Directory -Path "$OpenCodeDir\commands" -Force | Out-Null
    New-Item -ItemType Directory -Path "$OpenCodeDir\backups" -Force | Out-Null

    # Backup
    $SkillsExist = Test-Path "$OpenCodeDir\skills\*"
    if ($SkillsExist) {
        $BackupDir = "$OpenCodeDir\backups\backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
        Copy-Item -Path "$OpenCodeDir\skills" -Destination $BackupDir -Recurse -ErrorAction SilentlyContinue
        Copy-Item -Path "$OpenCodeDir\commands" -Destination $BackupDir -Recurse -ErrorAction SilentlyContinue
        Write-Host "Backed up to $BackupDir" -ForegroundColor Yellow
    }

    # Copy
    Copy-Item -Path "$RepoDir\opencode\skills\*" -Destination "$OpenCodeDir\skills\" -Recurse -Force
    Copy-Item -Path "$RepoDir\opencode\commands\*" -Destination "$OpenCodeDir\commands\" -Recurse -Force
    Copy-Item -Path "$RepoDir\opencode\settings.json" -Destination "$OpenCodeDir\" -Force

    Write-Host "OpenCode installed!" -ForegroundColor Green
}

switch ($choice) {
    "1" { Install-Claude }
    "2" { Install-OpenCode }
    "3" { Install-Claude; Install-OpenCode }
    default { Write-Host "Invalid choice" -ForegroundColor Red; exit 1 }
}

Write-Host ""
Write-Host "Restart your tool to apply changes." -ForegroundColor Yellow
