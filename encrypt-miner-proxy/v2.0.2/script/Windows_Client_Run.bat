@echo OFF
title encrypt-miner-proxy window client onekey setup
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo  ��������ת��������https://github.com/ryu0007/EncryptMinerProxy
echo              ���ű���֧��encrypt-miner-proxy_windows_amd64.exe

echo   ���ű�����Ͽͻ��˴������������У��뽫�ű������������ͬһ�ļ�����
echo   ��¼��ַ(����)-http://127.0.0.1:19999/proxy/client/login
echo   ��¼��ַ(����)-http://{����IP}:19999/proxy/client/login
echo   �û���-ryu
echo   ����-https://github.com/ryu0007/EncryptMinerProxy
echo **********************************************************************
echo       �������ʧ�ܣ������Ƿ�����UAC����δ�ù���Ȩ������
echo     =============================================================
echo �����������δ��ɣ���رձ��ű��������ȷ���������ݣ��밴���������
pause
mode con cols=130 lines=20
color 1E
:first
echo              �۹޼���ת������----�ͻ��˴�����ٰ�װ�ű�
echo             =====================================
echo                     ��1ѡ��װ�������۹޴���ͻ���
echo             -------------------------------------
echo                     ��2ѡ�������۹޴���ͻ���
echo             -------------------------------------
echo                     ��3ѡ�������۹޴���ͻ���
echo             -------------------------------------
echo                     ��4ѡ��ͣ���۹޴���ͻ���
echo             -------------------------------------
echo                     ��5ѡ��鿴�۹޴���ͻ���״̬
echo             -------------------------------------
echo                     ��6ѡ��ж���۹޴���ͻ���
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
echo ���ڰ�װ�۹޴���ͻ���
cd ..
setx /M miner_proxy_home %cd%
cd script

encrypt-miner-proxy_windows_amd64_client_service.exe install
encrypt-miner-proxy_windows_amd64_client_service.exe start
echo �۹޴���ͻ���������
pause
goto exit

:start
echo ���������۹޴���ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe start
pause
cls
goto first

:restart
echo ���������۹޴���ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe restart
pause
cls
goto first

:stop
echo ����ͣ���۹޴���ͻ���
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
echo ����ж���۹޴���ͻ���
encrypt-miner-proxy_windows_amd64_client_service.exe stop
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_windows_amd64_client_service.exe uninstall
ping -n 2 127.0.0.1 > nul
wmic ENVIRONMENT where "name='miner_proxy_home'" delete
echo ��������˳���װ����
pause
goto exit

:exit
exit