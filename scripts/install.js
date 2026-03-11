#!/usr/bin/env node

/**
 * Claude Code & OpenCode Skills Installer
 * Cross-platform Node.js script
 */

const fs = require('fs');
const path = require('path');
const os = require('os');
const readline = require('readline');

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

function installClaude(repoDir) {
  const claudeDir = path.join(os.homedir(), '.claude');
  log('Installing Claude Code config...', 'green');

  // Create directories
  fs.mkdirSync(path.join(claudeDir, 'skills'), { recursive: true });
  fs.mkdirSync(path.join(claudeDir, 'commands'), { recursive: true });
  fs.mkdirSync(path.join(claudeDir, 'backups'), { recursive: true });

  // Copy
  copyRecursive(path.join(repoDir, 'claude', 'skills'), path.join(claudeDir, 'skills'));
  copyRecursive(path.join(repoDir, 'claude', 'commands'), path.join(claudeDir, 'commands'));
  fs.copyFileSync(path.join(repoDir, 'claude', 'settings.json'), path.join(claudeDir, 'settings.json'));

  log('✅ Claude Code installed!', 'green');
}

function installOpenCode(repoDir) {
  const openCodeDir = path.join(os.homedir(), '.opencode');
  log('Installing OpenCode config...', 'green');

  // Create directories
  fs.mkdirSync(path.join(openCodeDir, 'skills'), { recursive: true });
  fs.mkdirSync(path.join(openCodeDir, 'commands'), { recursive: true });
  fs.mkdirSync(path.join(openCodeDir, 'backups'), { recursive: true });

  // Copy
  copyRecursive(path.join(repoDir, 'opencode', 'skills'), path.join(openCodeDir, 'skills'));
  copyRecursive(path.join(repoDir, 'opencode', 'commands'), path.join(openCodeDir, 'commands'));
  fs.copyFileSync(path.join(repoDir, 'opencode', 'settings.json'), path.join(openCodeDir, 'settings.json'));

  log('✅ OpenCode installed!', 'green');
}

async function main() {
  log('==================================', 'cyan');
  log(' Skills & Commands Installer', 'cyan');
  log('==================================', 'cyan');
  console.log('');

  const scriptDir = __dirname;
  const repoDir = path.dirname(scriptDir);

  console.log('Chọn công cụ để cài đặt:');
  console.log('  1) Claude Code');
  console.log('  2) OpenCode');
  console.log('  3) Cả hai');
  console.log('');

  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  rl.question('Lựa chọn [1-3]: ', (choice) => {
    rl.close();

    switch (choice.trim()) {
      case '1':
        installClaude(repoDir);
        break;
      case '2':
        installOpenCode(repoDir);
        break;
      case '3':
        installClaude(repoDir);
        installOpenCode(repoDir);
        break;
      default:
        log('Invalid choice', 'red');
        process.exit(1);
    }

    console.log('');
    log('Restart your tool to apply changes.', 'yellow');
  });
}

main();
