#!/bin/bash
echo "服务端代理开启的是29999端口，记得开放服务器安全组"
echo "WEB地址，外网-http://{公网IP}:29999/proxy/server/login"
echo "WEB地址，内网-http://127.0.0.1:29999/proxy/server/login"
echo "用户名：ryu"
echo "密码：https://github.com/ryu0007/EncryptMinerProxy"
echo "请及时修改您的用户名和密码，防止别人登入"

chmod 777 encrypt-miner-proxy_linux_amd64
./encrypt-miner-proxy_linux_amd64
