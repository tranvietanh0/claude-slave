#!/bin/bash

# Claude Code Skills & Commands Installer
# For Linux and macOS

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=================================="
echo " Claude Code Skills Installer"
echo "=================================="
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_DIR="$HOME/.claude"

# Check if Claude config directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
    echo -e "${YELLOW}Creating Claude config directory...${NC}"
    mkdir -p "$CLAUDE_DIR"
fi

# Backup existing config
if [ -d "$CLAUDE_DIR/skills" ] || [ -d "$CLAUDE_DIR/commands" ]; then
    BACKUP_DIR="$CLAUDE_DIR/backups/backup-$(date +%Y%m%d-%H%M%S)"
    echo -e "${YELLOW}Backing up existing config to $BACKUP_DIR${NC}"
    mkdir -p "$BACKUP_DIR"

    if [ -d "$CLAUDE_DIR/skills" ]; then
        cp -r "$CLAUDE_DIR/skills" "$BACKUP_DIR/"
    fi

    if [ -d "$CLAUDE_DIR/commands" ]; then
        cp -r "$CLAUDE_DIR/commands" "$BACKUP_DIR/"
    fi
fi

# Copy skills
echo -e "${GREEN}Installing skills...${NC}"
mkdir -p "$CLAUDE_DIR/skills"
cp -r "$REPO_DIR/user-config/skills/"* "$CLAUDE_DIR/skills/"

# Copy commands
echo -e "${GREEN}Installing commands...${NC}"
mkdir -p "$CLAUDE_DIR/commands"
cp -r "$REPO_DIR/user-config/commands/"* "$CLAUDE_DIR/commands/"

# List installed items
echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Installed skills:"
for skill in "$CLAUDE_DIR/skills"/*/; do
    if [ -d "$skill" ]; then
        echo "  - $(basename "$skill")"
    fi
done

echo ""
echo "Installed commands:"
for cmd in "$CLAUDE_DIR/commands"/*.md; do
    if [ -f "$cmd" ]; then
        echo "  - /$(basename "$cmd" .md)"
    fi
done

echo ""
echo -e "${YELLOW}Please restart Claude Code to apply changes.${NC}"
echo ""
