#!/usr/bin/env python3
"""智学通 - 本地服务器"""
import http.server
import socketserver
import webbrowser
import os
import sys

PORT = 8080
os.chdir(os.path.dirname(os.path.abspath(__file__)))

print(f"""
╔══════════════════════════════════════════╗
║     智学通 - 教务培训管理平台            ║
║                                          ║
║  服务已启动: http://localhost:{PORT}       ║
║  按 Ctrl+C 停止服务                      ║
╚══════════════════════════════════════════╝
""")

try:
    webbrowser.open(f'http://localhost:{PORT}')
except:
    pass

with socketserver.TCPServer(("", PORT), http.server.SimpleHTTPRequestHandler) as httpd:
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n服务已停止。")
        sys.exit(0)
