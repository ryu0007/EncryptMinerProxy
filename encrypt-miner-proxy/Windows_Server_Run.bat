@echo off
title encrypt-miner-proxy window server
mode con cols=70 lines=12
color 70
echo **********************************************************************
echo   请先下载转发主程序https://github.com/ryu0007/EncryptMinerProxy
echo   本脚本仅支持encrypt-miner-proxy_windows_amd64.exe
echo   本脚本需配合服务端代理主程序运行，请将脚本与主程序放在同一文件夹下
echo   登录地址(本地)-http://127.0.0.1:29999/proxy/server/login
echo   登录地址(外网)-http://{公网IP}:29999/proxy/server/login
echo   用户名-ryu
echo   密码-https://github.com/ryu0007/EncryptMinerProxy
echo   服务端代理开启的是29999端口，记得开放服务器安全组
echo **********************************************************************
echo       如果运行失败，请检查是否开启了UAC或者未用管理权限运行
echo     =============================================================
echo 上述操作如果未完成，请关闭本脚本。如果已确认上述内容，请按任意键继续
pause
mode con cols=80 lines=20
color A4
:first
echo             =====================================
echo                     按1选择启用服务端代理
echo             -------------------------------------
echo                     按q选择退出
echo             =====================================
echo                  脚本需要以管理员身份运行
set /p choice=请输入相应按键按回车确认[1]
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,1%
if /i "%choice%"=="1" goto start
if /i "%choice%"=="q" goto EXIT

echo 无效的选择,请重试
goto first

:start
echo 服务端代理开启的是29999端口，记得开放服务器安全组
echo WEB地址，外网-http://{公网IP}:29999/proxy/server/login
echo WEB地址，内网-http://127.0.0.1:29999/proxy/server/login
echo 用户名：ryu
echo 密码：https://github.com/ryu0007/EncryptMinerProxy
echo 请您及时修改用户名和密码，防止别人登入
echo 正在启动服务端代理
encrypt-miner-proxy_windows_amd64.exe

:exit
exit