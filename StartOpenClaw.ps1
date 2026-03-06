# OpenClaw启动脚本 - 英文版本避免编码问题
Write-Host "Starting OpenClaw service..." -ForegroundColor Green

# 设置工作目录
Set-Location "C:\Users\WH\.openclaw"

# Node.js路径
$nodePath = "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\node.exe"
$openclawScript = "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\node_modules\openclaw-cn\dist\entry.js"

# 检查Node.js是否存在
if (-not (Test-Path $nodePath)) {
    Write-Host "Error: Node.js not found" -ForegroundColor Red
    exit 1
}

# 检查OpenClaw脚本是否存在
if (-not (Test-Path $openclawScript)) {
    Write-Host "Error: OpenClaw script not found" -ForegroundColor Red
    exit 1
}

# 启动OpenClaw（使用Start-Process在后台运行）
$process = Start-Process -FilePath $nodePath -ArgumentList "`"$openclawScript`" gateway start" -WorkingDirectory "C:\Users\WH\.openclaw" -WindowStyle Hidden -PassThru

Write-Host "OpenClaw started in background (Process ID: $($process.Id))" -ForegroundColor Green
Write-Host "You can close this window, OpenClaw will continue running." -ForegroundColor Yellow

# 等待2秒让用户看到信息
Start-Sleep -Seconds 2