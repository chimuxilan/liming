curl -s https://raw.githubusercontent.com/chimuxilan/liming/main/start.bat > /dev/null && \
git clone https://github.com/chimuxilan/liming.git /tmp/liming && \
cat > /tmp/liming/start.bat << 'BATFILE'
@echo off
chcp 65001 >nul 2>&1
echo.
echo ╔══════════════════════════════════════════╗
echo ║     智学通 - 教务培训管理平台            ║
echo ╚══════════════════════════════════════════╝
echo.

:: 检查 Python 是否可用
where python >nul 2>&1
if %errorlevel% neq 0 (
    where python3 >nul 2>&1
    if %errorlevel% neq 0 (
        where py >nul 2>&1
        if %errorlevel% neq 0 (
            echo [错误] 未找到 Python，请先安装 Python 3
            echo 下载地址: https://www.python.org/downloads/
            pause
            exit /b 1
        )
        set PYTHON_CMD=py
    ) else (
        set PYTHON_CMD=python3
    )
) else (
    set PYTHON_CMD=python
)

echo 正在启动服务...

:: 后台启动服务器，等 2 秒让它就绪，再打开浏览器
start /b %PYTHON_CMD% -m http.server 8080
timeout /t 2 /nobreak >nul
start http://localhost:8080

echo 服务已启动: http://localhost:8080
echo 按 Ctrl+C 停止服务，或关闭此窗口。
echo.

:: 保持窗口打开，让服务器继续运行
%PYTHON_CMD% -m http.server 8080
pause
BATFILE
cd /tmp/liming && git add start.bat && git commit -m "fix: 修复start.bat启动问题 - 先启动服务器再打开浏览器，自动检测Python命令" && git push
