# github-push.ps1 - GitHub自动推送脚本
# 使用前需要配置GitHub认证

param(
    [string]$CommitMessage,
    [switch]$DryRun
)

# 默认提交信息
if (-not $CommitMessage) {
    $CommitMessage = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
}

Write-Host "=== GitHub推送脚本 ===" -ForegroundColor Cyan
Write-Host "工作目录: $(Get-Location)" -ForegroundColor Yellow
Write-Host "提交信息: $CommitMessage" -ForegroundColor Yellow

if ($DryRun) {
    Write-Host "模拟运行模式，不会实际推送" -ForegroundColor Magenta
}

# 检查git状态
Write-Host "`n1. 检查Git状态..." -ForegroundColor Green
$status = git status --porcelain
if (-not $status) {
    Write-Host "没有需要提交的更改" -ForegroundColor Yellow
    exit 0
}

Write-Host "检测到更改:" -ForegroundColor Green
$status | ForEach-Object { Write-Host "  $_" }

# 添加更改
Write-Host "`n2. 添加更改到暂存区..." -ForegroundColor Green
if (-not $DryRun) {
    git add .
    Write-Host "✓ 更改已添加" -ForegroundColor Green
} else {
    Write-Host "[模拟] git add ." -ForegroundColor Gray
}

# 提交
Write-Host "`n3. 提交更改..." -ForegroundColor Green
if (-not $DryRun) {
    git commit -m $CommitMessage
    Write-Host "✓ 提交完成" -ForegroundColor Green
} else {
    Write-Host "[模拟] git commit -m `"$CommitMessage`"" -ForegroundColor Gray
}

# 推送
Write-Host "`n4. 推送到GitHub..." -ForegroundColor Green
if (-not $DryRun) {
    try {
        git push origin master
        Write-Host "✓ 推送成功!" -ForegroundColor Green
    } catch {
        Write-Host "✗ 推送失败: $_" -ForegroundColor Red
        Write-Host "可能需要配置GitHub认证" -ForegroundColor Yellow
        Write-Host "请参考 GITHUB_SETUP.md 文件" -ForegroundColor Yellow
    }
} else {
    Write-Host "[模拟] git push origin master" -ForegroundColor Gray
}

# 显示总结
Write-Host "`n=== 完成 ===" -ForegroundColor Cyan
if (-not $DryRun) {
    Write-Host "更改已提交并推送" -ForegroundColor Green
} else {
    Write-Host "模拟运行完成，实际命令如上" -ForegroundColor Magenta
}

# 显示当前分支状态
Write-Host "`n当前分支状态:" -ForegroundColor Cyan
git log --oneline -3