@echo OFF
title encrypt-miner-proxy_client window onekey setup
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo         ���ű���֧��encrypt-miner-proxy_client_windows_amd64.exe
echo   ���ʵ�ַ(����)-http://127.0.0.1:19999/client/index
echo   ���ʵ�ַ(����)-http://{����IP}:19999/client/index
echo **********************************************************************
echo       �������ʧ�ܣ������Ƿ�����UAC����δ�ù���Ȩ������
echo     =============================================================
echo �����������δ��ɣ���رձ��ű��������ȷ���������ݣ��밴���������
pause
mode con cols=130 lines=20
color 1E
:first
echo                    ����ת������ͻ��˿��ٰ�װ�ű�
echo             =====================================
echo                     ��1ѡ����������ͻ���
echo             -------------------------------------
echo                     ��2ѡ��鿴����ͻ���״̬
echo             -------------------------------------
echo                     ��3ѡ��ֹͣ����ͻ���
echo             -------------------------------------
echo                     ��qѡ���˳���װϵͳ
echo             =====================================
echo                  �ű���Ҫ�Թ���Ա�������
set /p choice=��������Ӧ�������س�ȷ��[1-3]
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,3%
if /i "%choice%"=="1" goto install
if /i "%choice%"=="2" goto status
if /i "%choice%"=="3" goto uninstall
if /i "%choice%"=="q" goto exit
echo ��Ч��ѡ��,������
goto first

:install
echo ������������ͻ���
cd ..
:�л�����һ��Ŀ¼
xcopy /y configs %systemroot%\syswow64\configs\
xcopy /y cert %systemroot%\syswow64\cert\
::�ӱ���Ŀ¼�н������ļ�����
if exist %systemroot%\syswow64\configs_bak\ (
	xcopy /y /s /e %systemroot%\syswow64\configs_bak\client_proxy_config.yaml %systemroot%\syswow64\configs\
	xcopy /y /s /e %systemroot%\syswow64\configs_bak\client_sync_proxy_config.yaml %systemroot%\syswow64\configs\
)
copy encrypt-miner-proxy_client_windows_amd64.exe %systemroot%\syswow64\encrypt-miner-proxy_client_windows_amd64.exe
cd script
encrypt-miner-proxy_client_windows_amd64_service.exe install
encrypt-miner-proxy_client_windows_amd64_service.exe start
echo ���ڴ򿪴��������ҳ...
for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set SoftWareRoot=%%a %%b)
ping -n 2 127.0.0.1 > nul
start "" % SoftWareRoot % "http://127.0.0.1:19999/client/index"
echo ���δ�Զ�����ҳ��ַ�����ֶ������ַhttp://127.0.0.1:19999/client/index��
echo ����ֶ����뻹δ�򿪣��밴3�������Ƿ����������δ��������ȱ��΢�����п�
pause
cls
goto first


:status
echo ���ڼ��״̬
encrypt-miner-proxy_client_windows_amd64_service.exe status
pause
cls
goto first


:uninstall
echo ����ж�ش���ͻ���
encrypt-miner-proxy_client_windows_amd64_service.exe stop
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_client_windows_amd64_service.exe uninstall
::���������ļ�
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