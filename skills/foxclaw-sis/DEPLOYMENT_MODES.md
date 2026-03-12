# Deployment Modes | 部署模式

## Overview | 概述

FoxClaw SIS supports two deployment modes with adaptive detection:

| Mode | 模式 | Environment | 环境 | Detection Focus | 检测重点 |
|------|------|-------------|------|-----------------|----------|
| **Cloud** | 云端 | Cloud PC / VPS | 云电脑/云服务器 | System health, resources | 系统健康、资源监控 |
| **Local** | 本地 | Local machine / On-premise | 本地机器/自建 | System + Network + Gateway | 系统+网络+网关 |

---

## Auto-Detection | 自动检测

### Detection Logic | 检测逻辑

```python
# deploy_mode_detector.py
import os
import platform

class DeploymentModeDetector:
    CLOUD_INDICATORS = [
        'AWS_EC2', 'GCP_VM', 'AZURE_VM',  # Major clouds
        'CLOUD_PROVIDER', 'VPS',           # Generic
        'CONTAINER', 'KUBERNETES',         # Container
    ]
    
    @staticmethod
    def detect() -> str:
        """Auto-detect deployment mode"""
        # Check environment variables
        for indicator in DeploymentModeDetector.CLOUD_INDICATORS:
            if os.getenv(indicator):
                return 'cloud'
        
        # Check for cloud-specific files
        cloud_files = [
            '/sys/class/dmi/id/product_name',  # AWS/Azure/GCP
            '/var/lib/cloud',                   # cloud-init
        ]
        for f in cloud_files:
            if os.path.exists(f):
                return 'cloud'
        
        # Check for container environment
        if os.path.exists('/.dockerenv'):
            return 'cloud'
        
        # Default to local
        return 'local'
    
    @staticmethod
    def is_cloud() -> bool:
        return DeploymentModeDetector.detect() == 'cloud'
    
    @staticmethod
    def is_local() -> bool:
        return DeploymentModeDetector.detect() == 'local'
```

### Detection Script | 检测脚本

**Windows:**
```powershell
# detect-deploy-mode.ps1
$cloudIndicators = @(
    'AWS_EC2', 'GCP_VM', 'AZURE_VM',
    'CLOUD_PROVIDER', 'VPS', 'CONTAINER'
)

$isCloud = $false
foreach ($indicator in $cloudIndicators) {
    if (Test-Path "Env:$indicator") {
        $isCloud = $true
        break
    }
}

# Check for cloud metadata service
try {
    $response = Invoke-WebRequest -Uri "http://169.254.169.254/metadata" -TimeoutSec 2
    if ($response.StatusCode -eq 200) {
        $isCloud = $true
    }
} catch {}

if ($isCloud) {
    Write-Output "cloud"
} else {
    Write-Output "local"
}
```

**Linux/Mac:**
```bash
#!/bin/bash
# detect-deploy-mode.sh

# Check environment variables
CLOUD_VARS=("AWS_EC2" "GCP_VM" "AZURE_VM" "CLOUD_PROVIDER" "VPS" "CONTAINER" "KUBERNETES")
for var in "${CLOUD_VARS[@]}"; do
    if [ -n "${!var}" ]; then
        echo "cloud"
        exit 0
    fi
done

# Check for cloud metadata service
if curl -s --max-time 2 http://169.254.169.254/metadata >/dev/null 2>&1; then
    echo "cloud"
    exit 0
fi

# Check for cloud-init
if [ -d "/var/lib/cloud" ]; then
    echo "cloud"
    exit 0
fi

# Check for docker
if [ -f "/.dockerenv" ]; then
    echo "cloud"
    exit 0
fi

# Default to local
echo "local"
```

---

## Mode-Specific Configuration | 模式特定配置

### Cloud Mode | 云端模式

```json
{
  "deployment": {
    "mode": "cloud",
    "detected_at": "2026-03-13T00:00:00Z",
    "features": {
      "network_check": false,
      "gateway_check": false,
      "heartbeat_check": true,
      "resource_monitoring": true,
      "auto_scaling": true
    },
    "monitoring": {
      "focus": ["cpu", "memory", "disk", "application"],
      "skip": ["network_connectivity", "gateway_status"]
    }
  }
}
```

### Local Mode | 本地模式

```json
{
  "deployment": {
    "mode": "local",
    "detected_at": "2026-03-13T00:00:00Z",
    "features": {
      "network_check": true,
      "gateway_check": true,
      "heartbeat_check": true,
      "resource_monitoring": true,
      "auto_scaling": false
    },
    "monitoring": {
      "focus": ["cpu", "memory", "disk", "application", 
                "network", "gateway", "sync", "security"],
      "skip": []
    }
  }
}
```

---

## Adaptive Status Report | 自适应状态报告

### Cloud Deployment Report | 云端部署报告

```
🦊 FoxClaw SIS 状态检测报告 [云端部署模式]
*检测时间: 2026-03-13 00:23*

## 部署信息
| 项目 | 值 |
|------|-----|
| 部署模式 | ☁️ 云端 (Cloud) |
| 检测方式 | 自动识别 |
| 跳过的检测 | 网络连接、网关状态 |

## 六层架构健康度
[标准六层检测...]

## 资源监控
| 资源 | 使用率 | 状态 |
|------|--------|------|
| CPU | 25% | 🟢 正常 |
| 内存 | 40% | 🟢 正常 |
| 磁盘 | 60% | 🟢 正常 |
```

### Local Deployment Report | 本地部署报告

```
🦊 FoxClaw SIS 状态检测报告 [本地部署模式]
*检测时间: 2026-03-13 00:23*

## 部署信息
| 项目 | 值 |
|------|-----|
| 部署模式 | 🖥️ 本地 (Local) |
| 检测方式 | 自动识别 |
| 额外检测 | 网络、网关、同步、安全 |

## 六层架构健康度
[标准六层检测...]

## 本地部署检测
| 检测项 | 状态 | 详情 |
|--------|------|------|
| 🌐 网络连接 | 🟢 正常 | 延迟 15ms |
| 🔗 网关状态 | 🟢 正常 | Gateway 运行中 |
| 📡 心跳同步 | 🟢 正常 | 上次同步 2分钟前 |
| 🔒 安全证书 | 🟡 警告 | 30天后过期 |
```

---

## Deployment Scripts | 部署脚本

### Cloud Deployment | 云端部署

```bash
#!/bin/bash
# deploy-cloud.sh

echo "🚀 Deploying FoxClaw SIS to Cloud..."

# Set cloud environment
export CLOUD_PROVIDER=true
export DEPLOYMENT_MODE=cloud

# Install
npx skills add foxclaw/foxclaw-sis

# Configure for cloud
foxclaw-sis config set deployment.mode=cloud
foxclaw-sis config set monitoring.network_check=false
foxclaw-sis config set monitoring.gateway_check=false

# Start
echo "☁️ Starting in Cloud mode..."
foxclaw-sis start
```

### Local Deployment | 本地部署

```bash
#!/bin/bash
# deploy-local.sh

echo "🖥️ Deploying FoxClaw SIS to Local..."

# Set local environment
export DEPLOYMENT_MODE=local

# Install
npx skills add foxclaw/foxclaw-sis

# Configure for local
foxclaw-sis config set deployment.mode=local
foxclaw-sis config set monitoring.network_check=true
foxclaw-sis config set monitoring.gateway_check=true

# Start
echo "🖥️ Starting in Local mode..."
foxclaw-sis start
```

---

## Manual Override | 手动覆盖

Force specific mode:

```bash
# Force cloud mode
export FOXCLAW_DEPLOY_MODE=cloud
foxclaw-sis start

# Force local mode
export FOXCLAW_DEPLOY_MODE=local
foxclaw-sis start
```

---

## Best Practices | 最佳实践

### Cloud Deployment | 云端部署
- ✅ 依赖云提供商的网络稳定性
- ✅ 关注资源使用率和成本
- ✅ 启用自动扩展（如支持）
- ✅ 配置云监控集成

### Local Deployment | 本地部署
- ✅ 定期检查网络连接
- ✅ 监控网关健康状态
- ✅ 确保证书不过期
- ✅ 配置本地备份策略

---

*Deployment Modes Documentation | FoxClaw SIS*
*Version: 1.0.1*
