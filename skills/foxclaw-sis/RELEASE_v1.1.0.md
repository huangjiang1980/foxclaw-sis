# FoxClaw SIS v1.1.0 Release Notes

## 🦊 龙虾狐超智系统 | FoxClaw Super Intelligence System

**版本:** v1.1.0  
**发布日期:** 2026-03-13  
**维护者:** 可乐 🦞  
**仓库:** https://github.com/huangjiang1980/foxclaw-sis

---

## ✨ 新增功能

### 1. 智能备份系统 v3.0
- 自动备份功能 (`sisback on/off`)
- 日期迭代命名 (`backup_YYYY-MM-DD_1`)
- 版本备份支持 (`sisback version vX.X.X`)
- 自动清理旧备份（保留10个）
- 本地存储，无远程推送

### 2. 跨平台支持
- Windows: `sisback.bat`
- Linux/Mac: `sisback.sh`

### 3. 双部署模式
- 本地部署检测
- 云端部署支持
- 自动模式切换

### 4. 安全加固
- 安全审计指南
- 加固配置建议
- 云电脑防休眠

---

## 📁 文件清单

| 文件 | 说明 |
|------|------|
| `SKILL.md` | 系统定义文档 (v1.1.0) |
| `CHANGELOG.md` | 版本历史 |
| `BACKUP_SYSTEM.md` | 备份系统文档 |
| `sisback.bat` | Windows 备份脚本 |
| `sisback.sh` | Linux/Mac 备份脚本 |
| `.gitignore` | Git 忽略配置 |

---

## 🚀 快速开始

```bash
# 查看备份状态
./sisback.sh status

# 启用自动备份
./sisback.sh on

# 创建版本备份
./sisback.sh version v1.1.0
```

---

## 🏗️ 系统架构

```
FoxClaw SIS (龙虾狐超智系统)
├─ 🧠 认知层 (2 skills)
├─ 💾 记忆层 (3 skills)
├─ 🔄 进化层 (2 skills)
├─ 🔌 插件生态层 (4 skills)
├─ 🛠️ 执行层 (2 skills)
└─ ❤️ 生命支持层 (1 skill)
```

---

## 📊 版本对比

| 版本 | 日期 | 主要更新 |
|------|------|----------|
| v1.1.0 | 2026-03-13 | 智能备份、跨平台、双部署 |
| v1.0.1 | 2026-03-12 | 激活关键词、状态模板 |
| v1.0.0 | 2026-03-11 | 初始发布、15核心技能 |

---

## 🔗 链接

- **仓库:** https://github.com/huangjiang1980/foxclaw-sis
- **标签:** v1.1.0
- **提交:** 174518d

---

*FoxClaw SIS - 持续进化，永不止步* 🦞
