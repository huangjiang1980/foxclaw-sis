# Gateway Watchdog - Auto monitor and restart
$logFile = "$env:USERPROFILE\.openclaw\logs\watchdog.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

function Write-Log {
    param([string]$msg)
    $line = "[$timestamp] $msg"
    Add-Content -Path $logFile -Value $line
    Write-Host $line
}

# Check Gateway status
$status = & openclaw gateway status 2>&1
$probeOk = $status | Select-String "RPC probe: ok"

if (-not $probeOk) {
    Write-Log "ALERT: Gateway abnormal, restarting..."
    & openclaw gateway restart 2>&1 | ForEach-Object { Write-Log $_ }
    Start-Sleep -Seconds 3
    $newStatus = & openclaw gateway status 2>&1
    $newProbe = $newStatus | Select-String "RPC probe: ok"
    if ($newProbe) {
        Write-Log "SUCCESS: Gateway restarted successfully"
    } else {
        Write-Log "FAILURE: Gateway restart failed, manual check required"
    }
} else {
    Write-Log "OK: Gateway running normally"
}
