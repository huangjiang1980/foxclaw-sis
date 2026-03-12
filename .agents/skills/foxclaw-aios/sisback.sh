#!/bin/bash

# ============================================
# FoxClaw SIS Backup System v3.0 - Bash Version
# ============================================

BACKUP_ROOT=".backup"
MAX_BACKUPS=10
AUTO_FLAG="$BACKUP_ROOT/.auto_enabled"

TODAY=$(date +%Y-%m-%d)
NOW=$(date +%H:%M:%S)

# Parse args
ACTION="${1:-auto}"
ARG2="$2"

# Route
case "$ACTION" in
    on) enable_auto ;;
    off) disable_auto ;;
    status) show_status ;;
    list) list_backups ;;
    clean) clean_backups ;;
    restore) restore_backup ;;
    now) create_backup ;;
    version) version_backup ;;
    auto) auto_check ;;
    help|*) show_help ;;
esac

# ============================================
# Enable Auto Backup
# ============================================
enable_auto() {
    mkdir -p "$BACKUP_ROOT"
    echo "enabled" > "$AUTO_FLAG"
    echo "[OK] Auto backup enabled"
    echo "[INFO] Max $MAX_BACKUPS backups kept"
}

# ============================================
# Disable Auto Backup
# ============================================
disable_auto() {
    [ -f "$AUTO_FLAG" ] && rm "$AUTO_FLAG"
    echo "[OK] Auto backup disabled"
}

# ============================================
# Show Status
# ============================================
show_status() {
    echo "============================================"
    echo " FoxClaw SIS Backup Status"
    echo "============================================"
    if [ -f "$AUTO_FLAG" ]; then
        echo "Auto Backup: ENABLED"
    else
        echo "Auto Backup: DISABLED"
    fi
    echo "Max Keep: $MAX_BACKUPS backups"
    echo "Location: $BACKUP_ROOT/"
    echo
    COUNT=$(ls -d "$BACKUP_ROOT"/*/ 2>/dev/null | wc -l)
    echo "Total Backups: $COUNT"
    echo
    echo "Recent:"
    ls -dt "$BACKUP_ROOT"/*/ 2>/dev/null | head -3 | nl
}

# ============================================
# Auto Check
# ============================================
auto_check() {
    if [ ! -f "$AUTO_FLAG" ]; then
        echo "[INFO] Auto backup is OFF. Use 'sisback on' to enable."
        return
    fi
    create_backup
}

# ============================================
# Create Backup
# ============================================
create_backup() {
    mkdir -p "$BACKUP_ROOT"
    
    NAME="backup_$TODAY"
    N=0
    
    while true; do
        if [ $N -eq 0 ]; then
            TEST="$NAME"
        else
            TEST="${NAME}_$N"
        fi
        if [ ! -d "$BACKUP_ROOT/$TEST" ]; then
            break
        fi
        N=$((N + 1))
    done
    
    FINAL="$TEST"
    PATH_BACKUP="$BACKUP_ROOT/$FINAL"
    
    echo "============================================"
    echo " FoxClaw SIS Backup"
    echo "============================================"
    echo "Creating: $FINAL"
    echo
    
    mkdir -p "$PATH_BACKUP"
    cp -r SKILL.md "$PATH_BACKUP/" 2>/dev/null
    cp *.md "$PATH_BACKUP/" 2>/dev/null
    [ -d "scripts" ] && cp -r scripts "$PATH_BACKUP/" 2>/dev/null
    
    cat > "$PATH_BACKUP/meta.json" << EOF
{
  "name": "$FINAL",
  "date": "$TODAY",
  "time": "$NOW",
  "type": "auto"
}
EOF
    
    echo "[OK] Backup created: $FINAL"
    
    do_clean
}

# ============================================
# Version Backup
# ============================================
version_backup() {
    if [ -z "$ARG2" ]; then
        echo "[ERROR] Version required"
        echo "Usage: sisback version [version]"
        return
    fi
    
    mkdir -p "$BACKUP_ROOT"
    VER="$ARG2"
    PATH_BACKUP="$BACKUP_ROOT/version_${VER}_$TODAY"
    
    if [ -d "$PATH_BACKUP" ]; then
        echo "[WARN] Version backup exists: $PATH_BACKUP"
        read -p "Overwrite? (yes/no): " CONFIRM
        [ "$CONFIRM" != "yes" ] && return
    fi
    
    echo "============================================"
    echo " FoxClaw SIS Version Backup"
    echo "============================================"
    echo "Version: $VER"
    echo
    
    mkdir -p "$PATH_BACKUP"
    cp -r SKILL.md "$PATH_BACKUP/" 2>/dev/null
    cp *.md "$PATH_BACKUP/" 2>/dev/null
    [ -d "scripts" ] && cp -r scripts "$PATH_BACKUP/" 2>/dev/null
    [ -d ".backup" ] && cp -r .backup "$PATH_BACKUP/" 2>/dev/null
    
    cat > "$PATH_BACKUP/meta.json" << EOF
{
  "name": "version_$VER",
  "version": "$VER",
  "date": "$TODAY",
  "type": "version"
}
EOF
    
    echo "[OK] Version backup: $VER"
}

# ============================================
# List Backups
# ============================================
list_backups() {
    echo "============================================"
    echo " FoxClaw SIS Backups"
    echo "============================================"
    COUNT=0
    for dir in "$BACKUP_ROOT"/*/; do
        [ -d "$dir" ] || continue
        COUNT=$((COUNT + 1))
        name=$(basename "$dir")
        echo "[$COUNT] $name"
    done
    [ $COUNT -eq 0 ] && echo "No backups found"
    echo
    echo "Total: $COUNT"
}

# ============================================
# Clean Backups
# ============================================
clean_backups() {
    echo "============================================"
    echo " FoxClaw SIS Cleanup"
    echo "============================================"
    echo "Keeping max $MAX_BACKUPS auto backups"
    echo
    
    do_clean
    echo "[OK] Done"
}

do_clean() {
    DEL=0
    ls -dt "$BACKUP_ROOT"/backup_* 2>/dev/null | tail -n +$((MAX_BACKUPS + 1)) | while read dir; do
        [ -d "$dir" ] && rm -rf "$dir" && DEL=$((DEL + 1))
    done
    [ $DEL -gt 0 ] && echo "Cleaned $DEL old backups"
}

# ============================================
# Restore Backup
# ============================================
restore_backup() {
    if [ -z "$ARG2" ]; then
        echo "[ERROR] Backup name required"
        echo "Usage: sisback restore [name]"
        echo
        echo "Available:"
        ls -d "$BACKUP_ROOT"/*/ 2>/dev/null | xargs -n1 basename
        return
    fi
    
    TARGET="$ARG2"
    if [ ! -d "$BACKUP_ROOT/$TARGET" ]; then
        echo "[ERROR] Backup not found: $TARGET"
        return
    fi
    
    echo "============================================"
    echo " FoxClaw SIS Restore"
    echo "============================================"
    echo "Restore from: $TARGET"
    echo "WARNING: Current files will be overwritten!"
    echo
    read -p "Confirm? (yes/no): " CONFIRM
    [ "$CONFIRM" != "yes" ] && echo "Cancelled" && return
    
    echo "Restoring..."
    cp -r "$BACKUP_ROOT/$TARGET"/* . 2>/dev/null
    echo "[OK] Restored!"
}

# ============================================
# Show Help
# ============================================
show_help() {
    echo "FoxClaw SIS Backup System v3.0"
    echo
    echo "Usage: sisback [command] [arg]"
    echo
    echo "Commands:"
    echo "  on        Enable auto backup"
    echo "  off       Disable auto backup"
    echo "  status    Show status"
    echo "  now       Backup now"
    echo "  list      List backups"
    echo "  clean     Clean old backups"
    echo "  restore   Restore backup"
    echo "  version   Create version backup"
    echo "  help      Show this help"
    echo
    echo "Examples:"
    echo "  sisback on"
    echo "  sisback now"
    echo "  sisback version v2.1.0"
    echo "  sisback restore backup_2026-03-13"
}
