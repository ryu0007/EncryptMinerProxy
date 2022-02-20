#!/bin/bash
chmod 777 encrypt-miner-proxy_linux_amd64
./encrypt-miner-proxy_linux_amd64

echo "encrypt-miner-proxy服务端代理已经安装完成并且启动了"
echo "服务端代理开启的是29999端口，记得开放服务器安全组"
echo "请登入WEB，外网地址-http://{公网IP}:29999/proxy/server/login"
echo "请登入WEB，内外网地址-http://127.0.0.1:29999/proxy/server/login"
echo "用户名：ryu"
echo "密码：https://github.com/ryu0007/EncryptMinerProxy"
echo "请您及时修改用户名和密码，防止别人登入"
