#!/bin/bash
# detect-deploy-mode.sh - FoxClaw SIS Deployment Mode Detector
# 部署模式检测脚本 - Linux/Mac 版本

# Check for forced override
if [ -n "$FOXCLAW_DEPLOY_MODE" ]; then
    if [ "$FOXCLAW_DEPLOY_MODE" = "cloud" ]; then
        echo "cloud"
        exit 0
    elif [ "$FOXCLAW_DEPLOY_MODE" = "local" ]; then
        echo "local"
        exit 0
    fi
fi

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

# Check for container environment
if [ -f "/proc/1/cgroup" ] && grep -q "docker\|kubepods" /proc/1/cgroup 2>/dev/null; then
    echo "cloud"
    exit 0
fi

# Default to local
echo "local"
