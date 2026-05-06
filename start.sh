#!/bin/bash
echo ""
echo "╔══════════════════════════════════════════╗"
echo "║     智学通 - 教务培训管理平台            ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "正在启动服务..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if command -v python3 &>/dev/null; then
    (sleep 1 && open http://localhost:8080 2>/dev/null || xdg-open http://localhost:8080 2>/dev/null) &
    python3 -m http.server 8080
elif command -v python &>/dev/null; then
    (sleep 1 && open http://localhost:8080 2>/dev/null || xdg-open http://localhost:8080 2>/dev/null) &
    python -m http.server 8080
else
    echo "未找到 Python，请直接用浏览器打开 index.html"
    read -p "按回车退出..."
fi
