# OpenClaw启动脚本 - PowerShell版本
Write-Host "正在启动OpenClaw服务..." -ForegroundColor Green

# 设置工作目录
Set-Location "C:\Users\WH\.openclaw"

# Node.js路径
$nodePath = "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\bin\node.exe"
$openclawScript = "C:\Users\WH\AppData\Roaming\fnm\node-versions\v24.13.1\installation\node_modules\openclaw-cn\openclaw.mjs"

# 检查Node.js是否存在
if (-not (Test-Path $nodePath)) {
    Write-Host "错误: 找不到Node.js" -ForegroundColor Red
    exit 1
}

# 检查OpenClaw脚本是否存在
if (-not (Test-Path $openclawScript)) {
    Write-Host "错误: 找不到OpenClaw脚本" -ForegroundColor Red
    exit 1
}

# 启动OpenClaw（使用Start-Process在后台运行）
$process = Start-Process -FilePath $nodePath -ArgumentList "`"$openclawScript`" gateway start" -WorkingDirectory "C:\Users\WH\.openclaw" -WindowStyle Hidden -PassThru

Write-Host "OpenClaw已在后台启动 (进程ID: $($process.Id))" -ForegroundColor Green
Write-Host "你可以关闭此窗口，OpenClaw会继续运行。" -ForegroundColor Yellow

# 等待2秒让用户看到信息
Start-Sleep -Seconds 2