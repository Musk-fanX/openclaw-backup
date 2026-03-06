@echo off
echo 正在启动OpenClaw服务（后台运行）...
cd /d "C:\Users\WH\.openclaw"
start "OpenClaw Gateway" /B "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\bin\node.exe" "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\node_modules\openclaw-cn\openclaw.mjs" gateway start
echo OpenClaw已在后台启动，可以关闭此窗口。
timeout /t 3