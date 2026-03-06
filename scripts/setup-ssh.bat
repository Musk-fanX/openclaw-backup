@echo off
echo 设置SSH环境用于GitHub

REM 设置SSH agent
set SSH_AGENT="C:\Program Files\Git\usr\bin\ssh-agent.exe"
set SSH_ADD="C:\Program Files\Git\usr\bin\ssh-add.exe"

REM 启动SSH agent
%SSH_AGENT% -s

REM 添加SSH密钥
%SSH_ADD% %USERPROFILE%\.ssh\id_ed25519

echo.
echo SSH环境设置完成
echo 测试连接: ssh -T git@github.com
pause