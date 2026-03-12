# Cloud PC Anti-Sleep & Management | 云电脑防休眠与管理

## Overview | 概述

FoxClaw SIS includes anti-sleep and management features for cloud PC deployments.

---

## Anti-Sleep Configuration | 防休眠配置

### Windows Power Settings | Windows 电源设置

**Disable sleep/hibernate:**
```powershell
# Run as Administrator
powercfg /change standby-timeout-ac 0
powercfg /change hibernate-timeout-ac 0
powercfg /change monitor-timeout-ac 0
```

**Verify settings:**
```powershell
powercfg /query SCHEME_CURRENT SUB_SLEEP STANDBYIDLE
```

### Keep-Alive Script | 保活脚本

**Windows:**
```powershell
# keep-alive.ps1
while ($true) {
    # Send heartbeat every 5 minutes
    Write-Host "$(Get-Date) - Heartbeat"
    
    # Prevent idle timeout
    $wsh = New-Object -ComObject WScript.Shell
    $wsh.SendKeys("{F15}")  # Invisible keypress
    
    Start-Sleep -Seconds 300
}
```

**Alternative - Mouse Jiggle:**
```powershell
# mouse-keepalive.ps1
Add-Type -AssemblyName System.Windows.Forms

while ($true) {
    $pos = [System.Windows.Forms.Cursor]::Position
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($pos.X + 1, $pos.Y)
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.Cursor]::Position = $pos
    Start-Sleep -Seconds 300
}
```

---

## Cloud PC Management | 云电脑管理

### Health Monitoring | 健康监控

```json
{
  "cloud_pc": {
    "anti_sleep": {
      "enabled": true,
      "method": "powercfg",
      "heartbeat_interval": 300
    },
    "monitoring": {
      "cpu_threshold": 80,
      "memory_threshold": 80,
      "disk_threshold": 90,
      "alert_on_high_usage": true
    },
    "auto_recovery": {
      "enabled": true,
      "restart_on_crash": true,
      "max_restarts": 3
    }
  }
}
```

### Resource Management | 资源管理

```python
# cloud_pc_manager.py
import psutil
import time
import logging

class CloudPCManager:
    def __init__(self):
        self.logger = logging.getLogger('cloud_pc')
        self.anti_sleep_enabled = True
    
    def prevent_sleep(self):
        """Prevent system sleep"""
        if os.name == 'nt':  # Windows
            import ctypes
            ctypes.windll.kernel32.SetThreadExecutionState(0x80000002)
            self.logger.info("Sleep prevention enabled")
    
    def monitor_resources(self):
        """Monitor system resources"""
        cpu = psutil.cpu_percent()
        memory = psutil.virtual_memory().percent
        disk = psutil.disk_usage('/').percent
        
        return {
            'cpu': cpu,
            'memory': memory,
            'disk': disk,
            'timestamp': time.time()
        }
    
    def check_health(self):
        """Check system health"""
        resources = self.monitor_resources()
        
        alerts = []
        if resources['cpu'] > 80:
            alerts.append(f"High CPU: {resources['cpu']}%")
        if resources['memory'] > 80:
            alerts.append(f"High Memory: {resources['memory']}%")
        if resources['disk'] > 90:
            alerts.append(f"High Disk: {resources['disk']}%")
        
        return {
            'healthy': len(alerts) == 0,
            'alerts': alerts,
            'resources': resources
        }
    
    def run(self):
        """Main management loop"""
        self.prevent_sleep()
        
        while True:
            health = self.check_health()
            
            if not health['healthy']:
                self.logger.warning(f"Health issues: {health['alerts']}")
            
            # Prevent sleep periodically
            if self.anti_sleep_enabled:
                self.prevent_sleep()
            
            time.sleep(60)  # Check every minute
```

---

## Service Management | 服务管理

### Windows Service | Windows 服务

**Create FoxClaw SIS service:**
```powershell
# Create service
New-Service -Name "FoxClawSIS" `
    -DisplayName "FoxClaw SIS" `
    -Description "FoxClaw Super Intelligence System" `
    -BinaryPathName "C:\Path\To\foxclaw-sis.exe" `
    -StartupType Automatic

# Start service
Start-Service -Name "FoxClawSIS"

# Set to auto-restart
sc failure FoxClawSIS reset=0 actions=restart/5000/restart/5000/restart/5000
```

### Task Scheduler | 任务计划程序

**Create startup task:**
```powershell
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\foxclaw\start.ps1"
$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
Register-ScheduledTask -TaskName "FoxClaw SIS Startup" -Action $action -Trigger $trigger -Settings $settings -RunLevel Highest
```

---

## Cloud Provider Specific | 云厂商特定

### Alibaba Cloud ECS | 阿里云 ECS

```bash
# Install cloud monitor
wget https://cms-agent-cn-hangzhou.oss-cn-hangzhou.aliyuncs.com/release/cms-agent-linux.sh
bash cms-agent-linux.sh

# Disable sleep in cloud-init
sudo sed -i 's/ExecStop=.*/ExecStop=/' /etc/systemd/system/sleep.target
```

### Tencent Cloud CVM | 腾讯云 CVM

```bash
# Install cloud monitor
wget https://monitoring-prod-1258344701.cos.ap-guangzhou.myqcloud.com/barad/agent/baradAgent_install.sh
bash baradAgent_install.sh
```

### AWS EC2

```bash
# Install CloudWatch agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i amazon-cloudwatch-agent.deb
```

---

## Monitoring Dashboard | 监控面板

### System Metrics | 系统指标

```
┌─────────────────────────────────────────┐
│     🖥️ Cloud PC Health Dashboard       │
├─────────────────────────────────────────┤
│                                         │
│  Uptime:     15 days 3 hours           │
│  Status:     🟢 Healthy                │
│                                         │
│  CPU:        25%  ████░░░░░░           │
│  Memory:     40%  █████░░░░░           │
│  Disk:       60%  ██████░░░░           │
│  Network:    🟢 Connected              │
│                                         │
│  Anti-Sleep: ✅ Active                 │
│  Last Beat:  2 seconds ago             │
│                                         │
└─────────────────────────────────────────┘
```

---

## Troubleshooting | 故障排除

### Cloud PC Still Sleeps | 云电脑仍然休眠

**Checklist:**
- [ ] Power settings applied correctly
- [ ] Keep-alive script running
- [ ] No group policy overriding settings
- [ ] Cloud provider idle timeout configured

**Debug commands:**
```powershell
# Check current power settings
powercfg /list

# Check for sleep inhibitors
powercfg /requests

# Check last wake reason
powercfg /lastwake
```

### High Resource Usage | 高资源占用

**Optimization:**
```powershell
# Check top processes
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

# Clear memory cache
[System.GC]::Collect()
```

---

## Best Practices | 最佳实践

1. **Always enable anti-sleep** for 24/7 operation
2. **Monitor resource usage** to prevent throttling
3. **Set up alerts** for critical issues
4. **Regular health checks** via status command
5. **Backup configuration** before changes
6. **Test recovery procedures** periodically

---

*Cloud PC Management | FoxClaw SIS*
*Version: 1.0.1*
