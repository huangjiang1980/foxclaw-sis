@echo off
REM auto-backup.bat - FoxClaw SIS Automatic Backup Script for Windows
REM 自动备份脚本 - Windows 版本

setlocal enabledelayedexpansion

REM Get current timestamp
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
set TIMESTAMP=%mydate%_%mytime%

REM Set backup directory
set BACKUP_DIR=.backup\%TIMESTAMP%
set LOG_FILE=.backup\backup.log

REM Create backup directory
if not exist .backup mkdir .backup
mkdir %BACKUP_DIR%

echo [%date% %time%] Starting backup... >> %LOG_FILE%

REM Backup critical files
echo Backing up critical files...
if exist README.md copy README.md %BACKUP_DIR%\ >> %LOG_FILE% 2>&1
if exist README.zh-CN.md copy README.zh-CN.md %BACKUP_DIR%\ >> %LOG_FILE% 2>&1
if exist CHANGELOG.md copy CHANGELOG.md %BACKUP_DIR%\ >> %LOG_FILE% 2>&1
if exist STATUS_REPORT_TEMPLATE.md copy STATUS_REPORT_TEMPLATE.md %BACKUP_DIR%\ >> %LOG_FILE% 2>&1
if exist VERSION_MANAGEMENT.md copy VERSION_MANAGEMENT.md %BACKUP_DIR%\ >> %LOG_FILE% 2>&1
if exist SKILL.md copy SKILL.md %BACKUP_DIR%\ >> %LOG_FILE% 2>&1

REM Backup config directory
if exist config (
    echo Backing up config directory...
    xcopy /E /I config %BACKUP_DIR%\config >> %LOG_FILE% 2>&1
)

REM Git operations
echo Checking for git changes...
git status --porcelain > .backup\git-status.txt

REM Check if there are changes
for %%I in (.backup\git-status.txt) do set FILESIZE=%%~zI

if %FILESIZE% GTR 0 (
    echo Changes detected, committing...
    git add . >> %LOG_FILE% 2>&1
    git commit -m "auto-backup: %date% %time%" >> %LOG_FILE% 2>&1
    git push >> %LOG_FILE% 2>&1
    echo [%date% %time%] Backup committed and pushed >> %LOG_FILE%
) else (
    echo [%date% %time%] No changes to commit >> %LOG_FILE%
)

echo [%date% %time%] Backup completed: %BACKUP_DIR% >> %LOG_FILE%
echo Backup completed: %BACKUP_DIR%

REM Cleanup old backups (keep last 10)
echo Cleaning up old backups...
for /f "skip=10 delims=" %%a in ('dir /B /O-D .backup') do (
    if exist ".backup\%%a" rmdir /S /Q ".backup\%%a" >> %LOG_FILE% 2>&1
)

endlocal
