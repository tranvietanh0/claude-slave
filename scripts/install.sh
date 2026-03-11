#!/bin/bash

# Claude Code & OpenCode Skills Installer
# For Linux and macOS

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}==================================${NC}"
echo -e "${CYAN} Skills & Commands Installer${NC}"
echo -e "${CYAN}==================================${NC}"
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Menu
echo "Chọn công cụ để cài đặt:"
echo "  1) Claude Code"
echo "  2) OpenCode"
echo "  3) Cả hai"
echo ""
read -p "Lựa chọn [1-3]: " choice

install_claude() {
    CLAUDE_DIR="$HOME/.claude"
    echo -e "${GREEN}Installing Claude Code config...${NC}"

    mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/commands" "$CLAUDE_DIR/backups"

    # Backup
    if [ -d "$CLAUDE_DIR/skills" ] && [ "$(ls -A $CLAUDE_DIR/skills 2>/dev/null)" ]; then
        BACKUP_DIR="$CLAUDE_DIR/backups/backup-$(date +%Y%m%d-%H%M%S)"
        mkdir -p "$BACKUP_DIR"
        cp -r "$CLAUDE_DIR/skills" "$BACKUP_DIR/" 2>/dev/null || true
        cp -r "$CLAUDE_DIR/commands" "$BACKUP_DIR/" 2>/dev/null || true
        echo -e "${YELLOW}Backed up to $BACKUP_DIR${NC}"
    fi

    # Copy
    cp -r "$REPO_DIR/claude/skills/"* "$CLAUDE_DIR/skills/"
    cp -r "$REPO_DIR/claude/commands/"* "$CLAUDE_DIR/commands/"
    cp "$REPO_DIR/claude/settings.json" "$CLAUDE_DIR/"

    echo -e "${GREEN}✅ Claude Code installed!${NC}"
}

install_opencode() {
    OPENCODE_DIR="$HOME/.opencode"
    echo -e "${GREEN}Installing OpenCode config...${NC}"

    mkdir -p "$OPENCODE_DIR/skills" "$OPENCODE_DIR/commands" "$OPENCODE_DIR/backups"

    # Backup
    if [ -d "$OPENCODE_DIR/skills" ] && [ "$(ls -A $OPENCODE_DIR/skills 2>/dev/null)" ]; then
        BACKUP_DIR="$OPENCODE_DIR/backups/backup-$(date +%Y%m%d-%H%M%S)"
        mkdir -p "$BACKUP_DIR"
        cp -r "$OPENCODE_DIR/skills" "$BACKUP_DIR/" 2>/dev/null || true
        cp -r "$OPENCODE_DIR/commands" "$BACKUP_DIR/" 2>/dev/null || true
        echo -e "${YELLOW}Backed up to $BACKUP_DIR${NC}"
    fi

    # Copy
    cp -r "$REPO_DIR/opencode/skills/"* "$OPENCODE_DIR/skills/"
    cp -r "$REPO_DIR/opencode/commands/"* "$OPENCODE_DIR/commands/"
    cp "$REPO_DIR/opencode/settings.json" "$OPENCODE_DIR/"

    echo -e "${GREEN}✅ OpenCode installed!${NC}"
}

case $choice in
    1) install_claude ;;
    2) install_opencode ;;
    3) install_claude; install_opencode ;;
    *) echo -e "${RED}Invalid choice${NC}"; exit 1 ;;
esac

echo ""
echo -e "${YELLOW}Restart your tool to apply changes.${NC}"
