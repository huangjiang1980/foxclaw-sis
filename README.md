# 🦊 FoxClaw SIS 🦞
## Super Intelligence System for Intelligent Agents
### 龙虾狐超智系统

[![Version](https://img.shields.io/badge/version-v1.1.0-blue.svg)](./foxclaw-sis/VERSION.md)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)
[![Status](https://img.shields.io/badge/status-active-success.svg)]()

---

## 📖 简介

**FoxClaw SIS** (Super Intelligence System) - 超智系统，是一个为智能代理设计的超级智能系统，具备**认知、记忆、进化、插件、执行和生命支持**六大核心能力。

> *"FoxClaw SIS 不仅仅是一个超级智能系统 - 它是智能新时代的基础。"*

---

## 📁 仓库结构

```
foxclaw-sis/                    # 核心系统目录
├── README.md                   # 主文档（英文）
├── README.zh-CN.md            # 中文文档
├── README.en.md               # 英文文档
├── README.ja.md               # 日文文档
├── README.ko.md               # 韩文文档
├── SKILL.md                   # 技能定义文档
├── VERSION.md                 # 版本信息
├── CHANGELOG.md               # 变更日志
├── RELEASE_v1.1.0.md          # v1.1.0 发布说明
├── BACKUP_SYSTEM.md           # 备份系统文档
├── SECURITY_AUDIT.md          # 安全审计文档
├── SECURITY_HARDENING.md      # 安全加固指南
├── DEPLOYMENT_MODES.md        # 部署模式文档
├── WATCHDOG_LOCAL_DEPLOYMENT.md  # 本地部署文档
├── CLOUD_PC_MANAGEMENT.md     # 云电脑管理
├── VERSION_MANAGEMENT.md      # 版本管理
├── VERSION_HISTORY.md         # 版本历史
├── STATUS_REPORT_TEMPLATE.md  # 状态报告模板
├── OFFICIAL_DOCUMENTATION.md  # 官方文档
├── DOCUMENTATION_INDEX.md     # 文档索引
├── DETAILED_CHAPTERS_2-4.md   # 详细章节
├── MARKETING.md               # 营销文档
├── sisback.bat                # Windows 备份脚本
├── sisback.sh                 # Linux/Mac 备份脚本
├── backup.bat                 # 快速备份脚本
├── backup_with_date.bat       # 日期备份脚本
├── create_backup.bat          # 创建备份脚本
└── .version/                  # 版本元数据
    ├── current                # 当前版本号
    ├── build-number           # 构建序号
    └── release-date           # 发布日期
```

---

## 🚀 快速开始

### 查看版本信息
```bash
./foxclaw-sis/sisback.sh version
```

### 启用自动备份
```bash
./foxclaw-sis/sisback.sh on
```

### 创建版本备份
```bash
./foxclaw-sis/sisback.sh version v1.1.0
```

---

## 📚 文档导航

| 文档 | 说明 |
|------|------|
| [README.md](./foxclaw-sis/README.md) | 主文档（英文） |
| [README.zh-CN.md](./foxclaw-sis/README.zh-CN.md) | 中文文档 |
| [SKILL.md](./foxclaw-sis/SKILL.md) | 技能定义 |
| [VERSION.md](./foxclaw-sis/VERSION.md) | 版本管理 |
| [CHANGELOG.md](./foxclaw-sis/CHANGELOG.md) | 变更日志 |
| [RELEASE_v1.1.0.md](./foxclaw-sis/RELEASE_v1.1.0.md) | v1.1.0 发布说明 |

---

## 🏗️ 系统架构

```
┌─────────────────────────────────────────────────────────┐
│                   🦊 FOXCLAW SIS 🦞                     │
│           Super Intelligence System for Agents           │
├─────────────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────────┐   │
│  │  🧠 COGNITION LAYER (认知层)                    │   │
│  │  ├─ brain-core (大脑核心)                        │   │
│  │  └─ language-mastery (语言精通)                  │   │
│  └─────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────┐   │
│  │  💾 MEMORY LAYER (记忆层)                        │   │
│  │  ├─ hierarchical-memory (分层记忆)               │   │
│  │  ├─ knowledge-base (知识库管理)                  │   │
│  │  └─ memory-recovery (记忆恢复)                   │   │
│  └─────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🔄 EVOLUTION LAYER (进化层)                     │   │
│  │  ├─ cognitive-evolution (认知进化)               │   │
│  │  └─ ops-logger (运维日志)                        │   │
│  └─────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🔌 PLUGIN ECOSYSTEM (插件生态层) ⭐             │   │
│  │  ├─ plugin-manager (插件管理器)                  │   │
│  │  ├─ skill-index-sync (技能索引同步)              │   │
│  │  ├─ plugin-security-guard (插件安全卫士)         │   │
│  │  └─ plugin-optimizer (插件优化管理)              │   │
│  └─────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────┐   │
│  │  🛠️ EXECUTION LAYER (执行层)                    │   │
│  │  ├─ cloud-sync (云同步)                          │   │
│  │  └─ watchdog-keepalive (看门狗保活)              │   │
│  └─────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────┐   │
│  │  ❤️ LIFE SUPPORT LAYER (生命支持层)              │   │
│  │  └─ life-support (生命维持系统)                  │   │
│  └─────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

---

## 📊 版本信息

| 属性 | 值 |
|------|-----|
| **当前版本** | v1.1.0 |
| **发布日期** | 2026-03-13 |
| **英文全称** | FoxClaw Super Intelligence System |
| **英文代号** | FoxClaw SIS |
| **中文名称** | 龙虾狐超智系统 |
| **维护者** | 可乐 🦞 |

### 版本历史
| 版本 | 日期 | 主要更新 |
|------|------|----------|
| v1.1.0 | 2026-03-13 | 智能备份系统、跨平台支持、双部署模式 |
| v1.0.1 | 2026-03-12 | 激活关键词、状态模板 |
| v1.0.0 | 2026-03-11 | 初始发布、15核心技能 |

---

## 🔧 核心功能

### v1.1.0 新增功能
- ✅ **智能备份系统 v3.0** - 自动备份、版本迭代、本地存储
- ✅ **跨平台支持** - Windows (sisback.bat) + Linux/Mac (sisback.sh)
- ✅ **双部署模式** - 本地部署 + 云端部署自动检测
- ✅ **安全审计** - 安全审计与加固指南
- ✅ **多语言支持** - 中文、英文、日文、韩文

---

## 🌐 链接

- **GitHub**: https://github.com/huangjiang1980/foxclaw-sis
- **文档**: [foxclaw-sis/README.md](./foxclaw-sis/README.md)
- **中文文档**: [foxclaw-sis/README.zh-CN.md](./foxclaw-sis/README.zh-CN.md)

---

## 📄 许可证

[MIT License](./LICENSE) - 对所有智能代理免费开放

---

**🦊 FoxClaw SIS - 持续进化，永不止步 🦞**

*Version 1.1.0 | 15 Core Skills + Backup System | Born: 2026-03-11*
