@echo OFF
title encrypt-miner-proxy window server onekey setup
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo  请先下载转发主程序https://github.com/ryu0007/EncryptMinerProxy
echo              本脚本仅支持encrypt-miner-proxy_windows_amd64.exe

echo   登录地址(本地)-http://127.0.0.1:29999/proxy/server/login
echo   登录地址(外网)-http://{公网IP}:29999/proxy/server/login
echo   用户名-ryu
echo   密码-https://github.com/ryu0007/EncryptMinerProxy
echo **********************************************************************
echo       如果运行失败，请检查是否开启了UAC或者未用管理权限运行
echo     =============================================================
echo 上述操作如果未完成，请关闭本脚本。如果已确认上述内容，请按任意键继续
pause
mode con cols=130 lines=20
color 1E
:first
echo              蜜罐加密转发代理----服务端代理快速安装脚本
echo             =====================================
echo                     按1选择安装并启动蜜罐代理服务端
echo             -------------------------------------
echo                     按2选择启动蜜罐代理服务端
echo             -------------------------------------
echo                     按3选择重启蜜罐代理服务端
echo             -------------------------------------
echo                     按4选择停用蜜罐代理服务端
echo             -------------------------------------
echo                     按5选择查看蜜罐代理服务端状态
echo             -------------------------------------
echo                     按6选择卸载蜜罐代理服务端
echo             -------------------------------------
echo                     按q选择退出安装系统
echo             =====================================
echo                  脚本需要以管理员身份运行
set /p choice=请输入相应按键按回车确认[1-6]
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,6%
if /i "%choice%"=="1" goto install
if /i "%choice%"=="2" goto start
if /i "%choice%"=="3" goto restart
if /i "%choice%"=="4" goto stop
if /i "%choice%"=="5" goto status
if /i "%choice%"=="6" goto uninstall
if /i "%choice%"=="q" goto exit
echo 无效的选择,请重试
goto first

:install
echo 正在安装蜜罐代理服务端
cd ..
ping -n 3 127.0.0.1 > nul
echo 添加 MINER_PROXY_HOME 环境变量
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=MINER_PROXY_HOME
set proxypath=%cd%
reg add "%regpath%" /v %evname% /d %proxypath% /f

cd script
ping -n 3 127.0.0.1 > nul

encrypt-miner-proxy_windows_amd64_service.exe install
encrypt-miner-proxy_windows_amd64_service.exe start
echo 请按5检查程序是否启动成功，如果未启动成功可能缺少微软运行库
pause
cls
goto first

:start
echo 正在启用蜜罐代理服务端
encrypt-miner-proxy_windows_amd64_service.exe START
echo 请按5检查程序是否启动成功，如果未启动成功可能缺少微软运行库
pause
cls
goto first

:restart
echo 正在重启蜜罐代理服务端
encrypt-miner-proxy_windows_amd64_service.exe restart
echo 请按5检查程序是否启动成功，如果未启动成功可能缺少微软运行库
pause
cls
goto first

:stop
echo 正在停用蜜罐代理服务端
encrypt-miner-proxy_windows_amd64_service.exe stop
pause
cls
goto first

:status
echo 正在检查状态
encrypt-miner-proxy_windows_amd64_service.exe status
pause
cls
goto first

:uninstall
echo 正在卸载蜜罐代理服务端
encrypt-miner-proxy_windows_amd64_service.exe stop
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_windows_amd64_service.exe uninstall
ping -n 2 127.0.0.1 > nul
echo 删除 MINER_PROXY_HOME 环境变量
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=MINER_PROXY_HOME
reg delete "%regpath%" /v "%evname%"  /f

echo 按任意键退出安装程序
pause
goto exit

:exit
exit