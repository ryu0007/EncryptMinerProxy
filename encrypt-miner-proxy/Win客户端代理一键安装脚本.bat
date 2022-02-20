@echo off
title encrypt-miner-proxy Windows Client
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo   请先下载转发主程序https://github.com/ryu0007/EncryptMinerProxy
echo   本脚本仅支持encrypt-miner-proxy_windows_amd64.exe
echo   本脚本需配合服务端代理主程序运行，请将脚本与主程序放在同一文件夹下
echo   登录地址(本地)-http://127.0.0.1:19999/proxy/server/login
echo   登录地址(外网)-http://{公网IP}:19999/proxy/server/login
echo   用户名-ryu
echo   密码-https://github.com/ryu0007/EncryptMinerProxy
echo   服务端代理开启的是19999端口，记得开放服务器安全组
echo **********************************************************************
echo       如果运行失败，请检查是否开启了UAC或者未用管理权限运行
echo     =============================================================
echo 上述操作如果未完成，请关闭本脚本。如果已确认上述内容，请按任意键继续
pause
mode con cols=80 lines=20
color 1E
:first
echo              登录地址(本地)-http://127.0.0.1:19999/proxy/server/login
echo              登录地址(外网)-http://{公网IP}:19999/proxy/server/login
echo              用户名-ryu
echo              密码-https://github.com/ryu0007/EncryptMinerProxy
echo             =====================================
echo                     按1选择启动客户端代理
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
echo 正在启动代理
:设定运行目录为当前文件所在的文件夹
encrypt-miner-proxy_windows_amd64.exe -client
echo 执行结束，请登录输入地址，登入WEB：http://{公网IP}:19999/proxy/server/login
pause
goto EXIT

echo 按任意键退出安装程序
pause
goto EXIT

:exit
exit