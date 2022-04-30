@echo OFF
title encrypt-miner-proxy_client window onekey setup
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo         本脚本仅支持encrypt-miner-proxy_client_windows_amd64.exe
echo   访问地址(本地)-http://127.0.0.1:19999/client/index
echo   访问地址(外网)-http://{公网IP}:19999/client/index
echo **********************************************************************
echo       如果运行失败，请检查是否开启了UAC或者未用管理权限运行
echo     =============================================================
echo 上述操作如果未完成，请关闭本脚本。如果已确认上述内容，请按任意键继续
pause
mode con cols=130 lines=20
color 1E
:first
echo                    加密转发代理客户端快速安装脚本
echo             =====================================
echo                     按1选择启动代理客户端
echo             -------------------------------------
echo                     按2选择查看代理客户端状态
echo             -------------------------------------
echo                     按3选择停止代理客户端
echo             -------------------------------------
echo                     按q选择退出安装系统
echo             =====================================
echo                  脚本需要以管理员身份运行
set /p choice=请输入相应按键按回车确认[1-3]
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,3%
if /i "%choice%"=="1" goto install
if /i "%choice%"=="2" goto status
if /i "%choice%"=="3" goto uninstall
if /i "%choice%"=="q" goto exit
echo 无效的选择,请重试
goto first

:install
echo 正在启动代理客户端
cd ..
:切换到上一级目录
xcopy /y configs %systemroot%\syswow64\configs\
xcopy /y cert %systemroot%\syswow64\cert\
::从备份目录中将配置文件覆盖
if exist %systemroot%\syswow64\configs_bak\ (
	xcopy /y /s /e %systemroot%\syswow64\configs_bak\client_proxy_config.yaml %systemroot%\syswow64\configs\
	xcopy /y /s /e %systemroot%\syswow64\configs_bak\client_sync_proxy_config.yaml %systemroot%\syswow64\configs\
)
copy encrypt-miner-proxy_client_windows_amd64.exe %systemroot%\syswow64\encrypt-miner-proxy_client_windows_amd64.exe
cd script
encrypt-miner-proxy_client_windows_amd64_service.exe install
encrypt-miner-proxy_client_windows_amd64_service.exe start
echo 正在打开代理程序网页...
for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set SoftWareRoot=%%a %%b)
ping -n 2 127.0.0.1 > nul
start "" % SoftWareRoot % "http://127.0.0.1:19999/client/index"
echo 如果未自动打开网页地址，请手动输入地址http://127.0.0.1:19999/client/index打开
echo 如果手动输入还未打开，请按3检查程序是否启动，如果未启动可能缺少微软运行库
pause
cls
goto first


:status
echo 正在检查状态
encrypt-miner-proxy_client_windows_amd64_service.exe status
pause
cls
goto first


:uninstall
echo 正在卸载代理客户端
encrypt-miner-proxy_client_windows_amd64_service.exe stop
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_client_windows_amd64_service.exe uninstall
::备份配置文件
xcopy /y /s /e %systemroot%\syswow64\configs\client_proxy_config.yaml %systemroot%\syswow64\configs_bak\
xcopy /y /s /e %systemroot%\syswow64\configs\client_sync_proxy_config.yaml %systemroot%\syswow64\configs_bak\
del /f %systemroot%\syswow64\configs\client_proxy_config.yaml
del /f %systemroot%\syswow64\configs\client_sync_proxy_config.yaml
rmdir /s/q %systemroot%\syswow64\cert\
del /f %systemroot%\syswow64\encrypt-miner-proxy_client_windows_amd64.exe
pause
cls
goto first


:exit
exit