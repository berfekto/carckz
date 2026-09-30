@echo off
title CRACKZ - áæÍÉ ÇáÅÏÇÑÉ æÇáãÊÇÈÚÉ
cd /d "D:\crackz"
powershell -Command "try { (Invoke-WebRequest -Uri 'http://localhost:3000' -UseBasicParsing -TimeoutSec 1).StatusCode } catch { exit 1 }" >nul 2>&1
if %errorlevel% neq 0 (
    echo Starting CRACKZ server...
    start "" /b npm run start
    timeout /t 2 /nobreak > nul
)
where msedge >nul 2>&1
if %errorlevel% equ 0 (
    start msedge --app=http://localhost:3000/dashboard --start-maximized
    exit /b
)
where chrome >nul 2>&1
if %errorlevel% equ 0 (
    start chrome --app=http://localhost:3000/dashboard --start-maximized
    exit /b
)
start http://localhost:3000/dashboard