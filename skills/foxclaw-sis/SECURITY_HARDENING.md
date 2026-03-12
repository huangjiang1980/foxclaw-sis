# Security Hardening Guide | 安全加固指南

## Overview | 概述

This guide provides step-by-step instructions to secure FoxClaw SIS deployments.

---

## 1. Data Encryption | 数据加密

### 1.1 Encryption at Rest | 静态加密

**For Local Deployment:**
```bash
# Install encryption tools
# Windows
choco install gpg4win

# Linux
apt-get install gnupg

# Mac
brew install gnupg
```

**Encrypt sensitive files:**
```bash
# Create encrypted backup
gpg --symmetric --cipher-algo AES256 config/system.json

# Decrypt when needed
gpg --decrypt config/system.json.gpg > config/system.json
```

**Configuration:**
```json
{
  "security": {
    "encryption": {
      "enabled": true,
      "algorithm": "AES-256-GCM",
      "key_derivation": "PBKDF2",
      "iterations": 100000
    }
  }
}
```

### 1.2 Encryption in Transit | 传输加密

**Enable TLS for all connections:**
```json
{
  "security": {
    "tls": {
      "enabled": true,
      "min_version": "1.3",
      "certificate": "/path/to/cert.pem",
      "private_key": "/path/to/key.pem"
    }
  }
}
```

**Generate self-signed certificate (development only):**
```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
```

---

## 2. Authentication & Access Control | 认证与访问控制

### 2.1 Basic Authentication | 基础认证

**Enable API key authentication:**
```json
{
  "security": {
    "authentication": {
      "enabled": true,
      "type": "api_key",
      "key_header": "X-API-Key",
      "keys": [
        {
          "id": "master-key",
          "key": "${MASTER_API_KEY}",
          "permissions": ["*"]
        }
      ]
    }
  }
}
```

**Generate secure API key:**
```bash
openssl rand -base64 32
```

### 2.2 Role-Based Access Control (RBAC) | 基于角色的访问控制

```json
{
  "security": {
    "rbac": {
      "enabled": true,
      "roles": [
        {
          "name": "admin",
          "permissions": ["*"]
        },
        {
          "name": "operator",
          "permissions": [
            "system:read",
            "status:check",
            "backup:create"
          ]
        },
        {
          "name": "viewer",
          "permissions": [
            "system:read",
            "status:check"
          ]
        }
      ]
    }
  }
}
```

---

## 3. Secrets Management | 密钥管理

### 3.1 Environment Variables | 环境变量

**Never commit secrets to Git:**
```bash
# .env file (add to .gitignore!)
MASTER_API_KEY=your-secret-key-here
GITHUB_TOKEN=your-github-token
ENCRYPTION_KEY=your-encryption-key
```

**Load in application:**
```python
import os
from dotenv import load_dotenv

load_dotenv()

api_key = os.getenv('MASTER_API_KEY')
```

### 3.2 Secret Rotation | 密钥轮换

**Automated rotation script:**
```bash
#!/bin/bash
# rotate-secrets.sh

# Generate new key
NEW_KEY=$(openssl rand -base64 32)

# Update environment
sed -i "s/MASTER_API_KEY=.*/MASTER_API_KEY=$NEW_KEY/" .env

# Restart services
systemctl restart foxclaw-sis

# Log rotation
echo "$(date): Secrets rotated" >> logs/security.log
```

---

## 4. Input Validation | 输入验证

### 4.1 Validation Framework | 验证框架

```python
# validation.py
import re
from typing import Any

class InputValidator:
    @staticmethod
    def validate_api_key(key: str) -> bool:
        """Validate API key format"""
        pattern = r'^[A-Za-z0-9+/]{32,}={0,2}$'
        return bool(re.match(pattern, key))
    
    @staticmethod
    def sanitize_input(data: str) -> str:
        """Sanitize user input"""
        # Remove control characters
        sanitized = ''.join(char for char in data if ord(char) >= 32)
        # Escape HTML
        sanitized = sanitized.replace('<', '&lt;').replace('>', '&gt;')
        return sanitized
    
    @staticmethod
    def validate_command(command: str) -> bool:
        """Validate system command"""
        allowed_commands = ['status', 'backup', 'restore']
        return command in allowed_commands
```

### 4.2 Configuration | 配置

```json
{
  "security": {
    "input_validation": {
      "enabled": true,
      "max_input_length": 10000,
      "allowed_characters": "alphanumeric",
      "sanitize_html": true,
      "block_sql_injection": true
    }
  }
}
```

---

## 5. Network Security | 网络安全

### 5.1 Firewall Rules | 防火墙规则

**iptables (Linux):**
```bash
# Allow only necessary ports
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -j DROP

# Save rules
iptables-save > /etc/iptables/rules.v4
```

**Windows Firewall:**
```powershell
# Allow specific port
New-NetFirewallRule -DisplayName "FoxClaw SIS" -Direction Inbound -Protocol TCP -LocalPort 8080 -Action Allow
```

### 5.2 Network Segmentation | 网络分段

```yaml
# docker-compose.yml for isolated deployment
version: '3.8'
services:
  foxclaw-sis:
    image: foxclaw/sis:latest
    networks:
      - sis-internal
      - sis-external
    environment:
      - NETWORK_MODE=segmented
    
networks:
  sis-internal:
    internal: true
  sis-external:
    driver: bridge
```

---

## 6. Monitoring & Alerting | 监控与告警

### 6.1 Security Monitoring | 安全监控

```python
# security_monitor.py
import logging
from datetime import datetime

class SecurityMonitor:
    def __init__(self):
        self.logger = logging.getLogger('security')
    
    def log_auth_attempt(self, user: str, success: bool, ip: str):
        """Log authentication attempts"""
        status = "SUCCESS" if success else "FAILED"
        self.logger.warning(f"Auth {status}: user={user}, ip={ip}")
    
    def detect_anomaly(self, metric: str, value: float):
        """Detect anomalous behavior"""
        threshold = self.get_threshold(metric)
        if value > threshold:
            self.alert(f"Anomaly detected: {metric}={value}")
    
    def alert(self, message: str):
        """Send security alert"""
        # Send to monitoring system
        print(f"[SECURITY ALERT] {datetime.now()}: {message}")
```

### 6.2 Alert Configuration | 告警配置

```json
{
  "security": {
    "alerting": {
      "enabled": true,
      "channels": [
        {
          "type": "telegram",
          "bot_token": "${TELEGRAM_BOT_TOKEN}",
          "chat_id": "${TELEGRAM_CHAT_ID}"
        },
        {
          "type": "email",
          "smtp_server": "smtp.gmail.com",
          "to": "admin@example.com"
        }
      ],
      "triggers": [
        {
          "event": "auth_failure",
          "threshold": 3,
          "window": "5m"
        },
        {
          "event": "system_error",
          "threshold": 1,
          "severity": "critical"
        }
      ]
    }
  }
}
```

---

## 7. Incident Response | 事件响应

### 7.1 Response Playbook | 响应手册

**Step 1: Detection**
```bash
# Check logs for suspicious activity
grep "FAILED" logs/security.log | tail -20
```

**Step 2: Containment**
```bash
# Disable compromised account
foxclaw-sis admin disable-user <username>

# Block IP address
iptables -A INPUT -s <suspicious_ip> -j DROP
```

**Step 3: Investigation**
```bash
# Collect evidence
tar -czf incident-$(date +%Y%m%d).tar.gz logs/

# Review access logs
foxclaw-sis audit export --start <timestamp> --end <timestamp>
```

**Step 4: Recovery**
```bash
# Rotate all secrets
./scripts/rotate-secrets.sh

# Restore from clean backup
./scripts/recovery.bat v1.0.0
```

---

## 8. Security Checklist | 安全检查清单

### Pre-Deployment | 部署前
- [ ] Encryption enabled for all sensitive data
- [ ] Authentication configured
- [ ] Secrets stored in environment variables
- [ ] Input validation active
- [ ] Firewall rules configured
- [ ] TLS certificates installed
- [ ] Monitoring and alerting enabled
- [ ] Backup and recovery tested

### Post-Deployment | 部署后
- [ ] Security audit completed
- [ ] Penetration testing performed
- [ ] Incident response plan tested
- [ ] Team trained on security procedures
- [ ] Documentation updated

### Periodic | 定期检查
- [ ] Weekly: Review security logs
- [ ] Monthly: Rotate secrets
- [ ] Quarterly: Security audit
- [ ] Annually: Penetration test

---

## 9. Quick Start Security Setup | 快速安全配置

```bash
# 1. Clone repository
git clone https://github.com/huangjiang1980/foxclaw-sis.git
cd foxclaw-sis

# 2. Create environment file
cp .env.example .env
# Edit .env with your secrets

# 3. Generate encryption key
openssl rand -base64 32 > .encryption_key

# 4. Enable security features
foxclaw-sis config set security.encryption.enabled=true
foxclaw-sis config set security.authentication.enabled=true
foxclaw-sis config set security.tls.enabled=true

# 5. Run security check
foxclaw-sis security audit

# 6. Start with security
foxclaw-sis start --secure
```

---

*Security Hardening Guide | FoxClaw SIS*
*Version: 1.0.1 | Last Updated: 2026-03-13*
