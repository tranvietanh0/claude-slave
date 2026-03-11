#!/usr/bin/env node

/**
 * Claude Code Skills & Commands Installer
 * Cross-platform Node.js script
 */

const fs = require('fs');
const path = require('path');
const os = require('os');

// Colors for console output
const colors = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  cyan: '\x1b[36m',
};

function log(message, color = 'reset') {
  console.log(`${colors[color]}${message}${colors.reset}`);
}

function copyRecursive(src, dest) {
  const stats = fs.statSync(src);

  if (stats.isDirectory()) {
    if (!fs.existsSync(dest)) {
      fs.mkdirSync(dest, { recursive: true });
    }

    const entries = fs.readdirSync(src);
    for (const entry of entries) {
      copyRecursive(path.join(src, entry), path.join(dest, entry));
    }
  } else {
    fs.copyFileSync(src, dest);
  }
}

function main() {
  log('==================================', 'cyan');
  log(' Claude Code Skills Installer', 'cyan');
  log('==================================', 'cyan');
  console.log('');

  // Paths
  const scriptDir = __dirname;
  const repoDir = path.dirname(scriptDir);
  const homeDir = os.homedir();
  const claudeDir = path.join(homeDir, '.claude');

  // Create Claude config directory if needed
  if (!fs.existsSync(claudeDir)) {
    log('Creating Claude config directory...', 'yellow');
    fs.mkdirSync(claudeDir, { recursive: true });
  }

  const skillsDir = path.join(claudeDir, 'skills');
  const commandsDir = path.join(claudeDir, 'commands');

  // Backup existing config
  if (fs.existsSync(skillsDir) || fs.existsSync(commandsDir)) {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, 19);
    const backupDir = path.join(claudeDir, 'backups', `backup-${timestamp}`);

    log(`Backing up existing config to ${backupDir}`, 'yellow');
    fs.mkdirSync(backupDir, { recursive: true });

    if (fs.existsSync(skillsDir)) {
      copyRecursive(skillsDir, path.join(backupDir, 'skills'));
    }

    if (fs.existsSync(commandsDir)) {
      copyRecursive(commandsDir, path.join(backupDir, 'commands'));
    }
  }

  // Copy skills
  log('Installing skills...', 'green');
  const sourceSkills = path.join(repoDir, 'user-config', 'skills');
  if (!fs.existsSync(skillsDir)) {
    fs.mkdirSync(skillsDir, { recursive: true });
  }
  copyRecursive(sourceSkills, skillsDir);

  // Copy commands
  log('Installing commands...', 'green');
  const sourceCommands = path.join(repoDir, 'user-config', 'commands');
  if (!fs.existsSync(commandsDir)) {
    fs.mkdirSync(commandsDir, { recursive: true });
  }
  copyRecursive(sourceCommands, commandsDir);

  // List installed items
  console.log('');
  log('Installation complete!', 'green');
  console.log('');

  log('Installed skills:');
  const skills = fs.readdirSync(skillsDir).filter(f =>
    fs.statSync(path.join(skillsDir, f)).isDirectory()
  );
  skills.forEach(skill => console.log(`  - ${skill}`));

  console.log('');
  log('Installed commands:');
  const commands = fs.readdirSync(commandsDir).filter(f => f.endsWith('.md'));
  commands.forEach(cmd => console.log(`  - /${cmd.replace('.md', '')}`));

  console.log('');
  log('Please restart Claude Code to apply changes.', 'yellow');
  console.log('');
}

main();
