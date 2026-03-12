@echo off
REM detect-deploy-mode.bat - FoxClaw SIS Deployment Mode Detector for Windows
REM 部署模式检测脚本 - Windows 版本

echo Detecting deployment mode...

set IS_CLOUD=false

REM Check environment variables
if defined AWS_EC2 set IS_CLOUD=true
if defined GCP_VM set IS_CLOUD=true
if defined AZURE_VM set IS_CLOUD=true
if defined CLOUD_PROVIDER set IS_CLOUD=true
if defined VPS set IS_CLOUD=true
if defined CONTAINER set IS_CLOUD=true
if defined KUBERNETES set IS_CLOUD=true

REM Check for cloud metadata service (timeout 2 seconds)
powershell -Command "try { $r = Invoke-WebRequest -Uri 'http://169.254.169.254/metadata' -TimeoutSec 2; if ($r.StatusCode -eq 200) { exit 0 } } catch { exit 1 }"
if %errorlevel% == 0 set IS_CLOUD=true

REM Check for forced override
if defined FOXCLAW_DEPLOY_MODE (
    if "%FOXCLAW_DEPLOY_MODE%"=="cloud" (
        echo cloud
        exit /b 0
    )
    if "%FOXCLAW_DEPLOY_MODE%"=="local" (
        echo local
        exit /b 0
    )
)

REM Output result
if "%IS_CLOUD%"=="true" (
    echo cloud
) else (
    echo local
)
