@echo off
title encrypt-miner-proxy window server
mode con cols=70 lines=12
color 70
echo **********************************************************************
echo   ��������ת��������https://github.com/ryu0007/EncryptMinerProxy
echo   ���ű���֧��encrypt-miner-proxy_windows_amd64.exe
echo   ���ű�����Ϸ���˴������������У��뽫�ű������������ͬһ�ļ�����
echo   ��¼��ַ(����)-http://127.0.0.1:29999/proxy/server/login
echo   ��¼��ַ(����)-http://{����IP}:29999/proxy/server/login
echo   �û���-ryu
echo   ����-https://github.com/ryu0007/EncryptMinerProxy
echo   ����˴���������29999�˿ڣ��ǵÿ��ŷ�������ȫ��
echo **********************************************************************
echo       �������ʧ�ܣ������Ƿ�����UAC����δ�ù���Ȩ������
echo     =============================================================
echo �����������δ��ɣ���رձ��ű��������ȷ���������ݣ��밴���������
pause
mode con cols=80 lines=20
color A4
:first
echo             =====================================
echo                     ��1ѡ�����÷���˴���
echo             -------------------------------------
echo                     ��qѡ���˳�
echo             =====================================
echo                  �ű���Ҫ�Թ���Ա�������
set /p choice=��������Ӧ�������س�ȷ��[1]
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,1%
if /i "%choice%"=="1" goto start
if /i "%choice%"=="q" goto EXIT

echo ��Ч��ѡ��,������
goto first

:start
echo ����˴���������29999�˿ڣ��ǵÿ��ŷ�������ȫ��
echo WEB��ַ������-http://{����IP}:29999/proxy/server/login
echo WEB��ַ������-http://127.0.0.1:29999/proxy/server/login
echo �û�����ryu
echo ���룺https://github.com/ryu0007/EncryptMinerProxy
echo ������ʱ�޸��û��������룬��ֹ���˵���
echo ������������˴���
encrypt-miner-proxy_windows_amd64.exe

:exit
exit