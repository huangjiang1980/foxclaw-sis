# FoxClaw SIS 版本管理系统

## 📋 版本规范

### 命名规则
| 类型 | 格式 | 示例 |
|------|------|------|
| 英文全称 | FoxClaw Super Intelligence System | - |
| 英文代号 | FoxClaw SIS | SIS |
| 中文名称 | 龙虾狐超智系统 | - |
| 简称 | SIS | - |
| 版本号 | MAJOR.MINOR.PATCH | v1.1.0 |

### 版本号规则 (语义化版本)
| 级别 | 说明 | 何时更新 | 示例 |
|------|------|----------|------|
| MAJOR | 主版本 | 破坏性变更 | 1.0.0 → 2.0.0 |
| MINOR | 次版本 | 新增功能 | 1.0.0 → 1.1.0 |
| PATCH | 补丁 | 修复优化 | 1.0.0 → 1.0.1 |

---

## 📁 版本管理文件

```
foxclaw-sis/
├── VERSION.md              # 当前版本信息（主文件）
├── VERSION_HISTORY.md      # 完整版本历史
├── RELEASE_v1.1.0.md       # v1.1.0 发布说明
├── CHANGELOG.md            # 变更日志
└── .version/               # 版本元数据
    ├── current             # 当前版本号
    ├── build-number        # 构建序号
    └── release-date        # 发布日期
```

---

## 🔖 版本标签管理

### Git 标签规范
```bash
# 创建版本标签
git tag -a v1.1.0 -m "FoxClaw SIS v1.1.0 Release"

# 推送标签到远程
git push origin v1.1.0

# 查看所有标签
git tag -l

# 删除本地标签
git tag -d v1.1.0

# 删除远程标签
git push origin --delete v1.1.0
```

### 标签列表
| 标签 | 版本 | 日期 | 状态 |
|------|------|------|------|
| v1.1.0 | v1.1.0 | 2026-03-13 | ✅ 当前 |

---

## 🔄 版本发布流程

### 1. 准备阶段
- [ ] 更新版本号 (VERSION.md, SKILL.md)
- [ ] 更新 CHANGELOG.md
- [ ] 创建 RELEASE_vX.X.X.md
- [ ] 测试所有功能

### 2. 提交阶段
```bash
git add .
git commit -m "release: FoxClaw SIS v1.1.0"
git push origin main
```

### 3. 标签阶段
```bash
git tag -a v1.1.0 -m "FoxClaw SIS v1.1.0 Release"
git push origin v1.1.0
```

### 4. 验证阶段
- [ ] 检查远程仓库版本号
- [ ] 验证标签存在
- [ ] 测试备份功能

---

## 📊 版本对比

| 版本 | 发布日期 | 主要特性 | 状态 |
|------|----------|----------|------|
| v1.1.0 | 2026-03-13 | 智能备份、跨平台、双部署 | ✅ 当前 |
| v1.0.1 | 2026-03-12 | 激活关键词、状态模板 | ✅ 稳定 |
| v1.0.0 | 2026-03-11 | 初始发布、15核心技能 | ✅ 稳定 |

---

## 🚀 快速命令

```bash
# 查看当前版本
./sisback version

# 创建版本备份
./sisback version v1.2.0

# 查看版本历史
cat VERSION_HISTORY.md

# 检查远程版本
git ls-remote --tags origin
```

---

## 📝 版本记录模板

### 新版本发布模板
```markdown
## vX.X.X (YYYY-MM-DD)

### 新增功能
- ✅ 功能1
- ✅ 功能2

### 优化改进
- 🔧 优化1
- 🔧 优化2

### 修复问题
- 🐛 修复1
- 🐛 修复2

### 破坏性变更
- ⚠️ 变更1 (如适用)
```

---

## 🔐 版本安全

- 所有版本标签不可变
- 发布前必须代码审查
- 关键版本需要备份
- 版本历史永久保留

---

*维护者: 可乐 🦞*  
*最后更新: 2026-03-13*  
*版本: v1.1.0*
