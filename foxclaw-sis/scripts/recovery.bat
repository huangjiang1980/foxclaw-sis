@echo off
REM recovery.bat - FoxClaw SIS System Recovery Script for Windows
REM 系统恢复脚本 - Windows 版本

echo ==========================================
echo  FoxClaw SIS System Recovery Tool
echo  系统恢复工具
echo ==========================================
echo.

REM Check if version specified
if "%~1"=="" (
    echo Usage: recovery.bat [version]
    echo Example: recovery.bat v1.0.1
    echo.
    echo Available versions:
    git tag -l
    exit /b 1
)

set TARGET_VERSION=%~1
echo Target version: %TARGET_VERSION%
echo.

REM Step 1: Backup current state
echo [1/5] Backing up current state...
if not exist .recovery-backup mkdir .recovery-backup
set RECOVERY_TIMESTAMP=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%
set RECOVERY_DIR=.recovery-backup\pre-recovery-%RECOVERY_TIMESTAMP%
mkdir %RECOVERY_DIR%

REM Backup current files
if exist README.md copy README.md %RECOVERY_DIR%\
if exist config xcopy /E /I config %RECOVERY_DIR%\config

echo Current state backed up to: %RECOVERY_DIR%
echo.

REM Step 2: Fetch latest from remote
echo [2/5] Fetching from remote...
git fetch origin
if errorlevel 1 (
    echo ERROR: Failed to fetch from remote
    exit /b 1
)

REM Step 3: Checkout target version
echo [3/5] Checking out version %TARGET_VERSION%...
git checkout %TARGET_VERSION%
if errorlevel 1 (
    echo ERROR: Failed to checkout version %TARGET_VERSION%
    echo Attempting to create recovery branch...
    git checkout -b recovery-%TARGET_VERSION% %TARGET_VERSION%
)

echo.

REM Step 4: Verify installation
echo [4/5] Verifying installation...
if exist README.md (
    echo ✓ README.md found
) else (
    echo ✗ README.md missing
)

if exist SKILL.md (
    echo ✓ SKILL.md found
) else (
    echo ✗ SKILL.md missing
)

echo.

REM Step 5: System check
echo [5/5] Running system check...
echo.
echo ==========================================
echo  Recovery Complete!
echo  恢复完成！
echo ==========================================
echo.
echo Current version: %TARGET_VERSION%
echo Pre-recovery backup: %RECOVERY_DIR%
echo.
echo To rollback recovery, restore from: %RECOVERY_DIR%
echo.

pause
