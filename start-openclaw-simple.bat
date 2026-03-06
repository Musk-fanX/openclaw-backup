@echo off
echo Starting OpenClaw service...
cd /d "C:\Users\WH\.openclaw"
start "OpenClaw Gateway" /B "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\bin\node.exe" "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\node_modules\openclaw-cn\openclaw.mjs" gateway start
echo OpenClaw started in background. You can close this window.
ping -n 3 127.0.0.1 > nul