@echo OFF
title encrypt-miner-proxy window server onekey setup
mode con cols=70 lines=12
color fc
echo **********************************************************************
echo  ��������ת��������https://github.com/ryu0007/EncryptMinerProxy
echo              ���ű���֧��encrypt-miner-proxy_windows_amd64.exe

echo   ���ű�����Ϸ���˴������������У��뽫�ű������������ͬһ�ļ�����
echo   ��¼��ַ(����)-http://127.0.0.1:29999/proxy/server/login
echo   ��¼��ַ(����)-http://{����IP}:29999/proxy/server/login
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
echo              �۹޼���ת������----����˴�����ٰ�װ�ű�
echo             =====================================
echo                     ��1ѡ��װ�������۹޴�������
echo             -------------------------------------
echo                     ��2ѡ�������۹޴�������
echo             -------------------------------------
echo                     ��3ѡ�������۹޴�������
echo             -------------------------------------
echo                     ��4ѡ��ͣ���۹޴�������
echo             -------------------------------------
echo                     ��5ѡ��鿴�۹޴�������״̬
echo             -------------------------------------
echo                     ��6ѡ��ж���۹޴�������
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
echo ���ڰ�װ�۹޴�������
cd ..
:�л�����һ��Ŀ¼
xcopy /y configs %systemroot%\syswow64\configs\
xcopy /y cert %systemroot%\syswow64\cert\
copy encrypt-miner-proxy_windows_amd64.exe %systemroot%\syswow64\
cd script
encrypt-miner-proxy_windows_amd64_service.exe install
encrypt-miner-proxy_windows_amd64_service.exe start
echo �۹޴�������������
pause
goto exit

:start
echo ���������۹޴�������
encrypt-miner-proxy_windows_amd64_service.exe start
pause
cls
goto first

:restart
echo ���������۹޴�������
encrypt-miner-proxy_windows_amd64_service.exe restart
pause
cls
goto first

:stop
echo ����ͣ���۹޴�������
encrypt-miner-proxy_windows_amd64_service.exe stop
pause
cls
goto first

:status
echo ���ڼ��״̬
encrypt-miner-proxy_windows_amd64_service.exe status
pause
cls
goto first

:uninstall
echo ����ж���۹޴�������
encrypt-miner-proxy_windows_amd64_service.exe stop
ping -n 3 127.0.0.1 > nul
encrypt-miner-proxy_windows_amd64_service.exe uninstall
del /f %systemroot%\syswow64\configs\server_proxy_config.yaml
::rmdir /s/q %systemroot%\syswow64\cert\
del /f %systemroot%\syswow64\encrypt-miner-proxy_windows_amd64.exe
echo ��������˳���װ����
pause
goto exit

:exit
exit