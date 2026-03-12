@echo off
setlocal

REM FoxClaw SIS Backup System v3.0

set BACKUP_ROOT=.backup
set MAX_BACKUPS=10
set AUTO_FLAG=%BACKUP_ROOT%\.auto_enabled

set TODAY=%date:~0,4%-%date:~5,2%-%date:~8,2%
set NOW=%time:~0,2%:%time:~3,2%:%time:~6,2%
set NOW=%NOW: =0%

REM Parse args
set ACTION=%~1
if "%ACTION%"=="" set ACTION=auto
set ARG2=%~2

REM Route
if "%ACTION%"=="on" goto enable_auto
if "%ACTION%"=="off" goto disable_auto
if "%ACTION%"=="status" goto show_status
if "%ACTION%"=="list" goto list_backups
if "%ACTION%"=="clean" goto clean_backups
if "%ACTION%"=="restore" goto restore_backup
if "%ACTION%"=="now" goto create_backup
if "%ACTION%"=="version" goto version_backup
if "%ACTION%"=="auto" goto auto_check
if "%ACTION%"=="help" goto show_help
goto show_help

REM ============================================
REM Enable Auto Backup
REM ============================================
:enable_auto
if not exist "%BACKUP_ROOT%" mkdir "%BACKUP_ROOT%"
echo enabled > "%AUTO_FLAG%"
echo [OK] Auto backup enabled
echo [INFO] Max %MAX_BACKUPS% backups kept
goto end

REM ============================================
REM Disable Auto Backup
REM ============================================
:disable_auto
if exist "%AUTO_FLAG%" del "%AUTO_FLAG%"
echo [OK] Auto backup disabled
goto end

REM ============================================
REM Show Status
REM ============================================
:show_status
echo ============================================
echo  FoxClaw SIS Backup Status
echo ============================================
if exist "%AUTO_FLAG%" (
    echo Auto Backup: ENABLED
) else (
    echo Auto Backup: DISABLED
)
echo Max Keep: %MAX_BACKUPS% backups
echo Location: %BACKUP_ROOT%\
echo.
set COUNT=0
for /f "delims=" %%D in ('dir /b /ad "%BACKUP_ROOT%\*" 2^>nul') do set /a COUNT+=1
echo Total Backups: %COUNT%
echo.
echo Recent:
dir /b /ad /o-d "%BACKUP_ROOT%\*" 2^>nul | findstr /n "^" | findstr "^1:\|^2:\|^3:"
goto end

REM ============================================
REM Auto Check
REM ============================================
:auto_check
if not exist "%AUTO_FLAG%" (
    echo [INFO] Auto backup is OFF. Use 'sisback on' to enable.
    goto end
)
goto create_backup

REM ============================================
REM Create Backup
REM ============================================
:create_backup
if not exist "%BACKUP_ROOT%" mkdir "%BACKUP_ROOT%"

set NAME=backup_%TODAY%
set N=0

:find_name_loop
if %N%==0 (
    set TEST=%NAME%
) else (
    set TEST=%NAME%_%N%
)
if exist "%BACKUP_ROOT%\%TEST%" (
    set /a N+=1
    goto find_name_loop
)
set FINAL=%TEST%
set PATH_BACKUP=%BACKUP_ROOT%\%FINAL%

echo ============================================
echo  FoxClaw SIS Backup
echo ============================================
echo Creating: %FINAL%
echo.

mkdir "%PATH_BACKUP%"
xcopy /E /I /Y "SKILL.md" "%PATH_BACKUP%\" >nul
xcopy /E /I /Y "*.md" "%PATH_BACKUP%\" >nul
if exist "scripts" xcopy /E /I /Y "scripts" "%PATH_BACKUP%\scripts\" >nul

echo { > "%PATH_BACKUP%\meta.json"
echo   "name": "%FINAL%", >> "%PATH_BACKUP%\meta.json"
echo   "date": "%TODAY%", >> "%PATH_BACKUP%\meta.json"
echo   "time": "%NOW%", >> "%PATH_BACKUP%\meta.json"
echo   "type": "auto" >> "%PATH_BACKUP%\meta.json"
echo } >> "%PATH_BACKUP%\meta.json"

echo [OK] Backup created: %FINAL%

goto do_clean

REM ============================================
REM Version Backup
REM ============================================
:version_backup
if "%ARG2%"=="" (
    echo [ERROR] Version required
    echo Usage: sisback version [version]
    goto end
)

if not exist "%BACKUP_ROOT%" mkdir "%BACKUP_ROOT%"
set VER=%ARG2%
set PATH_BACKUP=%BACKUP_ROOT%\version_%VER%_%TODAY%

if exist "%PATH_BACKUP%" (
    echo [WARN] Version backup exists: %PATH_BACKUP%
    set /p CONFIRM="Overwrite? (yes/no): "
    if /i not "%CONFIRM%"=="yes" goto end
)

echo ============================================
echo  FoxClaw SIS Version Backup
echo ============================================
echo Version: %VER%
echo.

mkdir "%PATH_BACKUP%"
xcopy /E /I /Y "SKILL.md" "%PATH_BACKUP%\" >nul
xcopy /E /I /Y "*.md" "%PATH_BACKUP%\" >nul
if exist "scripts" xcopy /E /I /Y "scripts" "%PATH_BACKUP%\scripts\" >nul
if exist ".backup" xcopy /E /I /Y ".backup" "%PATH_BACKUP%\.backup\" >nul

echo { > "%PATH_BACKUP%\meta.json"
echo   "name": "version_%VER%", >> "%PATH_BACKUP%\meta.json"
echo   "version": "%VER%", >> "%PATH_BACKUP%\meta.json"
echo   "date": "%TODAY%", >> "%PATH_BACKUP%\meta.json"
echo   "type": "version" >> "%PATH_BACKUP%\meta.json"
echo } >> "%PATH_BACKUP%\meta.json"

echo [OK] Version backup: %VER%
goto end

REM ============================================
REM List Backups
REM ============================================
:list_backups
echo ============================================
echo  FoxClaw SIS Backups
echo ============================================
set COUNT=0
for /f "delims=" %%D in ('dir /b /ad /o-d "%BACKUP_ROOT%\*" 2^>nul') do (
    set /a COUNT+=1
    echo [!COUNT!] %%D
)
if %COUNT%==0 echo No backups found
echo.
echo Total: %COUNT%
goto end

REM ============================================
REM Clean Backups
REM ============================================
:clean_backups
echo ============================================
echo  FoxClaw SIS Cleanup
echo ============================================
echo Keeping max %MAX_BACKUPS% auto backups
echo.

:do_clean
set DEL=0
for /f "skip=%MAX_BACKUPS% delims=" %%D in ('dir /b /ad /o-d "%BACKUP_ROOT%\backup_*" 2^>nul') do (
    rd /s /q "%BACKUP_ROOT%\%%D"
    if not errorlevel 1 set /a DEL+=1
)
if %DEL% gtr 0 echo Cleaned %DEL% old backups
echo [OK] Done
goto end

REM ============================================
REM Restore Backup
REM ============================================
:restore_backup
if "%ARG2%"=="" (
    echo [ERROR] Backup name required
    echo Usage: sisback restore [name]
    echo.
    echo Available:
    dir /b /ad "%BACKUP_ROOT%\*" 2^>nul
    goto end
)

set TARGET=%ARG2%
if not exist "%BACKUP_ROOT%\%TARGET%" (
    echo [ERROR] Backup not found: %TARGET%
    goto end
)

echo ============================================
echo  FoxClaw SIS Restore
echo ============================================
echo Restore from: %TARGET%
echo WARNING: Current files will be overwritten!
echo.
set /p CONFIRM="Confirm? (yes/no): "
if /i not "%CONFIRM%"=="yes" (
    echo Cancelled
    goto end
)

echo Restoring...
xcopy /E /I /Y "%BACKUP_ROOT%\%TARGET%\*" ".\" >nul
echo [OK] Restored!
goto end

REM ============================================
REM Show Help
REM ============================================
:show_help
echo FoxClaw SIS Backup System v3.0
echo.
echo Usage: sisback [command] [arg]
echo.
echo Commands:
echo   on        Enable auto backup
echo   off       Disable auto backup
echo   status    Show status
echo   now       Backup now
echo   list      List backups
echo   clean     Clean old backups
echo   restore   Restore backup
echo   version   Create version backup
echo   help      Show this help
echo.
echo Examples:
echo   sisback on
echo   sisback now
echo   sisback version v2.1.0
echo   sisback restore backup_2026-03-13
goto end

:end
