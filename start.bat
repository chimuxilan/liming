@echo off
chcp 65001 >nul 2>&1
echo.
echo ╔══════════════════════════════════════════╗
echo ║     智学通 - 教务培训管理平台            ║
echo ╚══════════════════════════════════════════╝
echo.
echo 正在启动服务...
start http://localhost:8080
python -m http.server 8080
pause
