@echo OFF
title encrypt-miner-proxy window client onekey setup
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo         ���ű���֧��encrypt-miner-proxy_windows_client_amd64.exe
echo   ���ʵ�ַ(����)-http://127.0.0.1:19999/proxy/client/index
echo   ���ʵ�ַ(����)-http://{����IP}:19999/proxy/client/index
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
echo                     ��1ѡ��װ����������ͻ���
echo             -------------------------------------
echo                     ��2ѡ����������ͻ���
echo             -------------------------------------
echo                     ��3ѡ����������ͻ���
echo             -------------------------------------
echo                     ��4ѡ��ͣ�ô���ͻ���
echo             -------------------------------------
echo                     ��5ѡ��鿴����ͻ���״̬
echo             -------------------------------------
echo                     ��6ѡ��ж�ش���ͻ���
echo             -------------------------------------
echo                     ��qѡ���˳���װϵͳ
echo             =====================================
echo                  �ű���Ҫ�Թ���Ա�������
set /p choice=��������Ӧ�������س�ȷ��[1-6]
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,6%
if /i "%choice%"=="1" goto install
if /i "%choice%"=="2" goto start
if /i "%choice%"=="3" goto restart
if /i "%choice%"=="4" goto stop
if /i "%choice%"=="5" goto status
if /i "%choice%"=="6" goto uninstall
if /i "%choice%"=="q" goto exit
echo ��Ч��ѡ��,������
goto first

:install
echo ���ڰ�װ����ͻ���
cd ..
ping -n 3 127.0.0.1 > nul
echo ��� MINER_PROXY_HOME ��������
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=MINER_PROXY_HOME
set proxypath=%cd%
reg add "%regpath%" /v %evname% /d %proxypath% /f

cd script
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_windows_amd64_client_service.exe install
encrypt-miner-proxy_windows_amd64_client_service.exe start
echo �밴5�������Ƿ������ɹ������δ�����ɹ�����ȱ��΢�����п�
pause
cls
goto first

:start
echo �������ô���ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe START
echo �밴5�������Ƿ������ɹ������δ�����ɹ�����ȱ��΢�����п�
pause
cls
goto first

:restart
echo ������������ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe restart
echo �밴5�������Ƿ������ɹ������δ�����ɹ�����ȱ��΢�����п�
pause
cls
goto first

:stop
echo ����ͣ�ô���ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe stop
pause
cls
goto first

:status
echo ���ڼ��״̬
encrypt-miner-proxy_windows_amd64_client_service.exe status
pause
cls
goto first

:uninstall
echo ����ж�ش���ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe stop
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_windows_amd64_client_service.exe uninstall
ping -n 2 127.0.0.1 > nul
echo ɾ�� MINER_PROXY_HOME ��������
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=MINER_PROXY_HOME
reg delete "%regpath%" /v "%evname%"  /f

echo ��������˳���װ����
pause
goto exit

:exit
exit