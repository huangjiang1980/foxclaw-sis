# Watchdog Local Deployment Detection | 看门狗本地部署检测

## Overview | 概述

`watchdog-keepalive` skill includes local deployment detection for non-cloud environments.

## Detection Items | 检测项

| Item | 检测项 | Description | 说明 |
|------|--------|-------------|------|
| 🌐 Network | 网络连接 | External connectivity | 外网连通性 |
| 🔗 Gateway | 网关状态 | OpenClaw Gateway status | Gateway 运行状态 |
| 📡 Heartbeat | 心跳同步 | Cloud sync status | 与云端同步状态 |
| 🔒 Security | 安全连接 | TLS/SSL certificate | 证书有效性 |

## Detection Logic | 检测逻辑

```
watchdog-keepalive 循环:
  ├─ 标准检测 (所有环境)
  │   ├─ FoxClaw SIS 进程状态
  │   ├─ 内存使用率
  │   └─ 磁盘空间
  │
  └─ 本地部署额外检测
      ├─ 网络连接检测
      │   └─ IF 异常 → 告警 + 尝试重连
      ├─ 网关状态检测
      │   └─ IF 异常 → 尝试重启 Gateway
      ├─ 心跳同步检测
      │   └─ IF 异常 → 尝试重新同步
      └─ 安全证书检测
          └─ IF 即将过期 → 提前告警
```

## Configuration | 配置

```json
{
  "watchdog_keepalive": {
    "enabled": true,
    "check_interval_seconds": 30,
    "local_deployment": {
      "enabled": true,
      "network_check": {
        "enabled": true,
        "target_hosts": ["8.8.8.8", "github.com"],
        "timeout_seconds": 5
      },
      "gateway_check": {
        "enabled": true,
        "endpoint": "http://localhost:8080/health",
        "auto_restart": true
      },
      "heartbeat_check": {
        "enabled": true,
        "sync_interval_minutes": 5
      },
      "security_check": {
        "enabled": true,
        "cert_expiry_warning_days": 30
      }
    }
  }
}
```

## Scripts | 脚本

### Windows
```powershell
# watchdog-local-check.ps1
$networkOk = Test-Connection -ComputerName 8.8.8.8 -Count 1 -Quiet
$gatewayOk = (Invoke-WebRequest -Uri "http://localhost:8080/health" -TimeoutSec 5).StatusCode -eq 200

if (-not $networkOk) { Write-Host "⚠️ Network issue detected" -ForegroundColor Red }
if (-not $gatewayOk) { Write-Host "⚠️ Gateway not responding" -ForegroundColor Red }
```

### Linux/Mac
```bash
#!/bin/bash
# watchdog-local-check.sh

NETWORK_OK=$(ping -c 1 8.8.8.8 >/dev/null 2>&1 && echo "true" || echo "false")
GATEWAY_OK=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/health | grep -q "200" && echo "true" || echo "false")

[ "$NETWORK_OK" = "false" ] && echo "⚠️ Network issue detected"
[ "$GATEWAY_OK" = "false" ] && echo "⚠️ Gateway not responding"
```

## Integration with Status Report | 状态报告集成

Local deployment checks appear in system status reports:

```
## 本地部署检测 (Local Deployment)

| 检测项 | 状态 | 详情 |
|--------|------|------|
| 🌐 网络连接 | 🟢 正常 | 延迟 15ms |
| 🔗 网关状态 | 🟢 正常 | Gateway 运行中 |
| 📡 心跳同步 | 🟢 正常 | 上次同步 2分钟前 |
| 🔒 安全证书 | 🟡 警告 | 30天后过期 |
```

## Alert Levels | 告警级别

| Level | 级别 | Trigger | 触发条件 | Action | 动作 |
|-------|------|---------|----------|--------|------|
| 🟢 Info | 信息 | Minor issue | 轻微问题 | Log only | 仅记录 |
| 🟡 Warning | 警告 | Degraded service | 服务降级 | Notify | 通知 |
| 🔴 Critical | 严重 | Service down | 服务中断 | Auto-repair | 自动修复 |

---

*Part of watchdog-keepalive skill | watchdog-keepalive 技能组成部分*
