# Version Management & Recovery | 版本管理与恢复

## Overview | 概述

FoxClaw SIS version management system ensures safe iteration and quick recovery.

---

## Version Numbering | 版本号规则

**Format:** `MAJOR.MINOR.PATCH`

| Type | 类型 | When to Bump | 何时更新 | Example |
|------|------|--------------|----------|---------|
| MAJOR | 主版本 | Breaking changes | 破坏性变更 | 1.0.0 → 2.0.0 |
| MINOR | 次版本 | New features | 新增功能 | 1.0.0 → 1.1.0 |
| PATCH | 补丁 | Bug fixes | 修复优化 | 1.0.0 → 1.0.1 |

---

## Backup Strategy | 备份策略

### 1. Git Version Control | Git 版本控制

**Repository:** https://github.com/huangjiang1980/foxclaw-sis

**Backup Commands:**
```bash
# Create version tag
git tag -a v1.0.1 -m "Release version 1.0.1"

# Push tag to remote
git push origin v1.0.1

# View all versions
git tag -l
```

### 2. Configuration Backup | 配置备份

**Backup Locations:**
- Primary: GitHub repository
- Secondary: Local `.backup/` directory
- Tertiary: Cloud storage (if configured)

**Critical Files to Backup:**
```
foxclaw-sis/
├── README.md              # Main documentation
├── README.zh-CN.md        # Chinese documentation
├── CHANGELOG.md           # Version history
├── STATUS_REPORT_TEMPLATE.md  # Status templates
├── SKILL.md               # Skill definition
└── config/
    ├── system.json        # System configuration
    └── identity.json      # Identity settings
```

### 3. Auto-Backup Script | 自动备份脚本

**File:** `scripts/auto-backup.sh` (Linux/Mac) / `scripts/auto-backup.bat` (Windows)

```bash
#!/bin/bash
# auto-backup.sh - Automatic backup script

BACKUP_DIR=".backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup critical files
cp README.md "$BACKUP_DIR/"
cp README.zh-CN.md "$BACKUP_DIR/"
cp CHANGELOG.md "$BACKUP_DIR/"
cp STATUS_REPORT_TEMPLATE.md "$BACKUP_DIR/"
cp -r config "$BACKUP_DIR/"

# Git commit if changes exist
if [[ -n $(git status -s) ]]; then
    git add .
    git commit -m "auto-backup: $(date +%Y-%m-%d_%H:%M:%S)"
    git push
fi

echo "Backup completed: $BACKUP_DIR"
```

**Schedule:** Run every 4 hours via cron
```cron
0 */4 * * * /path/to/foxclaw-sis/scripts/auto-backup.sh
```

---

## Rollback Procedures | 回滚流程

### Scenario 1: Rollback to Previous Version | 回滚到上一版本

```bash
# Check current version
git log --oneline -5

# Soft rollback (keep changes)
git revert HEAD

# Hard rollback (discard changes)
git reset --hard HEAD~1

# Push rollback
git push origin main --force
```

### Scenario 2: Rollback to Specific Version | 回滚到指定版本

```bash
# List all versions
git tag -l

# Checkout specific version
git checkout v1.0.0

# Create recovery branch
git checkout -b recovery-v1.0.0

# Or reset main to specific version
git reset --hard v1.0.0
git push origin main --force
```

### Scenario 3: Complete System Recovery | 完整系统恢复

```bash
# 1. Clone fresh repository
git clone https://github.com/huangjiang1980/foxclaw-sis.git

# 2. Checkout desired version
cd foxclaw-sis
git checkout v1.0.1

# 3. Restore configuration
cp /path/to/backup/config/* config/

# 4. Verify installation
./scripts/verify-installation.sh

# 5. Activate system
./scripts/activate.sh
```

---

## Recovery Checklist | 恢复检查清单

**Before Recovery:**
- [ ] Identify target version
- [ ] Backup current state
- [ ] Notify stakeholders
- [ ] Document reason for rollback

**During Recovery:**
- [ ] Execute rollback procedure
- [ ] Verify system integrity
- [ ] Test critical functions
- [ ] Check logs for errors

**After Recovery:**
- [ ] Confirm system operational
- [ ] Update documentation
- [ ] Monitor for 24 hours
- [ ] Post-incident review

---

## Version History | 版本历史

| Version | Date | Changes | Status |
|---------|------|---------|--------|
| v1.0.1 | 2026-03-12 | Activation keywords, status templates, architecture docs | ✅ Current |
| v1.0.0 | 2026-03-11 | Initial release with 15 core skills | ✅ Stable |

---

## Emergency Contacts | 紧急联系

**System Maintainer:** 江哥
**Technical Lead:** 可乐/KeLe
**Repository:** https://github.com/huangjiang1980/foxclaw-sis

---

*Part of FoxClaw SIS | FoxClaw 超智系统组成部分*
*Last Updated: 2026-03-13*
