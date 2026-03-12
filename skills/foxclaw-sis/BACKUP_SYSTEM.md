# FoxClaw SIS 备份系统维护日志

## 系统版本
- **当前版本**: v3.0
- **最后维护**: 2026-03-13
- **维护者**: 可乐 🦞

## 系统组件

### 1. Windows 备份脚本
- **文件**: `sisback.bat`
- **功能**: 完整的备份管理系统
- **位置**: `skills/foxclaw-sis/`

### 2. Linux/Mac 备份脚本
- **文件**: `sisback.sh`
- **功能**: Bash 版本备份系统
- **位置**: `skills/foxclaw-sis/`

## 功能特性

### 自动备份
- ✅ 启用/禁用自动备份
- ✅ 每次运行自动检测并备份
- ✅ 智能日期命名（backup_YYYY-MM-DD）
- ✅ 同天迭代（_1, _2, _3...）

### 版本备份
- ✅ 项目迭代版本管理
- ✅ 版本号命名（version_vX.X.X_YYYY-MM-DD）
- ✅ 永久保留，不自动清理

### 备份管理
- ✅ 查看备份状态
- ✅ 列出所有备份
- ✅ 清理旧备份（保留最近10个）
- ✅ 恢复到指定版本

### 安全特性
- ✅ 仅本地存储
- ✅ 无远程推送
- ✅ 元数据记录（meta.json）

## 使用命令

```bash
# Windows
sisback on              # 启用自动备份
sisback off             # 禁用自动备份
sisback status          # 查看状态
sisback now             # 立即备份
sisback list            # 列出备份
sisback clean           # 清理旧备份
sisback restore [名]     # 恢复备份
sisback version [号]     # 版本备份

# Linux/Mac
chmod +x sisback.sh
./sisback.sh [命令]
```

## 备份位置
```
skills/foxclaw-sis/.backup/
├── backup_2026-03-13          # 自动备份
├── backup_2026-03-13_1        # 同天迭代
├── backup_2026-03-13_2
├── version_v2.0_2026-03-13    # 版本备份
└── ...
```

## 维护记录

### 2026-03-13
- ✅ 创建 sisback.bat (Windows)
- ✅ 创建 sisback.sh (Linux/Mac)
- ✅ 启用自动备份
- ✅ 测试状态显示
- ✅ 双平台支持

## 待办事项
- [ ] 添加备份压缩功能
- [ ] 添加备份加密功能
- [ ] 添加定时任务支持
- [ ] 添加备份验证功能

## 注意事项
1. 自动备份默认保留10个
2. 版本备份永久保留
3. 恢复操作会覆盖当前文件
4. 备份仅本地存储，无云端同步
