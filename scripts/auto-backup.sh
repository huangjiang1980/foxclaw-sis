#!/bin/bash
# auto-backup.sh - FoxClaw SIS Automatic Backup Script
# 自动备份脚本 - Linux/Mac 版本

# Configuration
BACKUP_ROOT=".backup"
LOG_FILE="$BACKUP_ROOT/backup.log"
MAX_BACKUPS=10

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting backup..." >> "$LOG_FILE"

# Backup critical files
echo "Backing up critical files..."
for file in README.md README.zh-CN.md CHANGELOG.md STATUS_REPORT_TEMPLATE.md VERSION_MANAGEMENT.md SKILL.md; do
    if [ -f "$file" ]; then
        cp "$file" "$BACKUP_DIR/" 2>> "$LOG_FILE"
        echo "  ✓ $file"
    fi
done

# Backup config directory
if [ -d "config" ]; then
    echo "Backing up config directory..."
    cp -r config "$BACKUP_DIR/" 2>> "$LOG_FILE"
    echo "  ✓ config/"
fi

# Git operations
echo "Checking for git changes..."
if [ -d ".git" ]; then
    # Check if there are changes
    if [[ -n $(git status --porcelain) ]]; then
        echo "Changes detected, committing..."
        git add . >> "$LOG_FILE" 2>&1
        git commit -m "auto-backup: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE" 2>&1
        
        # Push if remote exists
        if git remote > /dev/null 2>&1; then
            git push >> "$LOG_FILE" 2>&1
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup committed and pushed" >> "$LOG_FILE"
        else
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup committed (no remote)" >> "$LOG_FILE"
        fi
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] No changes to commit" >> "$LOG_FILE"
    fi
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup completed: $BACKUP_DIR" >> "$LOG_FILE"
echo "Backup completed: $BACKUP_DIR"

# Cleanup old backups (keep last N)
echo "Cleaning up old backups..."
cd "$BACKUP_ROOT"
ls -t | tail -n +$((MAX_BACKUPS + 1)) | xargs -r rm -rf
cd -

echo "Backup process finished."
