#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi

install() {
    if [ -d "/root/encrypt_miner_proxy" ]; then
        echo -e "您已安装了该软件, 如果确定没有安装,请输入rm -rf /root/encrypt_miner_proxy" && exit 1
    fi
    if screen -list | grep -q "encrypt-miner-proxy"; then
        echo -e "检测到您已启动了encrypt-miner-proxy, 请关闭后再安装" && exit 1
    fi

    $cmd update -y
    $cmd install curl wget screen -y
    
    mkdir /root/encrypt_miner_proxy
    mkdir /root/encrypt_miner_proxy/configs
    mkdir /root/encrypt_miner_proxy/cert

    echo "请选择版本"
    echo "  1、v2.0.0"
    echo "  2、v2.0.1"
    echo "  3、v2.0.2"
    echo "  4、v2.0.3"
    read -p "$(echo -e "请输入[1-4]：")" choose
    case $choose in
    1)
        wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.0/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/configs/client_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem	
        ;;
    2)
    	wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.1/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/configs/client_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem
        ;;
    3)
    	wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.2/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/configs/client_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem
        ;;
    4)
    	wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.3/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/configs/client_sync_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_sync_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem
        ;;
    *)
        echo "请输入正确的数字"
        ;;
    esac
    
    chmod 777 /root/encrypt_miner_proxy/encrypt-miner-proxy
    wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/script/Linux/LinuxOneKey/Server_Run.sh -O /root/encrypt_miner_proxy/Server_Run.sh
    chmod 777 /root/encrypt_miner_proxy/Server_Run.sh
    
    echo "如果没有报错则安装成功"
    echo "正在启动..."
    screen -dmS encrypt-miner-proxy
    sleep 0.2s
    screen -r encrypt-miner-proxy -p 0 -X stuff "cd /root/encrypt_miner_proxy"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'
    screen -r encrypt-miner-proxy -p 0 -X stuff "./Server_Run.sh"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'
    sleep 1s

    echo "服务端代理开启的是29999端口，记得开放服务器安全组"
	echo "WEB地址，外网-http://{公网IP}:29999/proxy/server/login"
	echo "WEB地址，内网-http://127.0.0.1:29999/proxy/server/login"
	echo "用户名：ryu"
	echo "密码：https://github.com/ryu0007/EncryptMinerProxy"
	echo "请及时修改您的用户名和密码，防止别人登入"
    echo "已启动web后台"
}

uninstall() {
    read -p "是否确认删除encrypt_miner_proxy[yes/no]：" flag
    if [ -z $flag ]; then
        echo "输入错误" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ]; then
            screen -X -S encrypt-miner-proxy quit
            rm -rf /root/encrypt_miner_proxy
            echo "卸载encrypt-miner-proxy成功"
        fi
    fi
}

update() {
	if screen -list | grep -q "encrypt-miner-proxy"; then
        screen -X -S encrypt-miner-proxy quit
    fi
    
    rm -rf /root/encrypt_miner_proxy/encrypt-miner-proxy
    
    echo "请选择版本"
    echo "  1、v2.0.0"
    echo "  2、v2.0.1"
    echo "  3、v2.0.2"
    echo "  4、v2.0.3"
    read -p "$(echo -e "请输入[1-4]：")" choose
    case $choose in
    1)
        wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.0/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/configs/client_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.0/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem	
        ;;
    2)
    	wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.1/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/configs/client_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.1/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem
        ;;
    3)
    	wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.2/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/configs/client_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.2/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem
        ;;
    4)
    	wget https://github.com/ryu0007/EncryptMinerProxy/blob/main/encrypt-miner-proxy/v2.0.3/encrypt-miner-proxy_linux_amd64?raw=true -O /root/encrypt_miner_proxy/encrypt-miner-proxy
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/configs/server_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/server_proxy_config.yaml
        wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/configs/client_sync_proxy_config.yaml -O /root/encrypt_miner_proxy/configs/client_sync_proxy_config.yaml		
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/cert/cert.pem -O /root/encrypt_miner_proxy/cert/cert.pem
	wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/v2.0.3/cert/key.pem -O /root/encrypt_miner_proxy/cert/key.pem
        ;;
    *)
        echo "请输入正确的数字"
        ;;
    esac
    
    chmod 777 /root/encrypt_miner_proxy/encrypt-miner-proxy

    screen -dmS encrypt-miner-proxy
    sleep 0.2s
    screen -r encrypt-miner-proxy -p 0 -X stuff "cd /root/encrypt_miner_proxy"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'
    screen -r encrypt-miner-proxy -p 0 -X stuff "./Server_Run.sh"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'
    sleep 1s

    echo "服务端代理开启的是29999端口，记得开放服务器安全组"
	echo "WEB地址，外网-http://{公网IP}:29999/proxy/server/login"
	echo "WEB地址，内网-http://127.0.0.1:29999/proxy/server/login"
	echo "用户名：ryu"
	echo "密码：https://github.com/ryu0007/EncryptMinerProxy"
	echo "请及时修改您的用户名和密码，防止别人登入"
    echo "已启动web后台"
}

start() {
    if screen -list | grep -q "encrypt-miner-proxy"; then
        echo -e "encrypt-miner-proxy已启动,请勿重复启动" && exit 1
    fi
    screen -dmS encrypt-miner-proxy
    sleep 0.2s
    screen -r encrypt-miner-proxy -p 0 -X stuff "cd /root/encrypt_miner_proxy"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'
    screen -r encrypt-miner-proxy -p 0 -X stuff "./Server_Run.sh"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'

    echo "encrypt-miner-proxy已启动"
}

restart() {
    if screen -list | grep -q "encrypt-miner-proxy"; then
        screen -X -S encrypt-miner-proxy quit
    fi
    screen -dmS encrypt-miner-proxy
    sleep 0.2s
    screen -r encrypt-miner-proxy -p 0 -X stuff "cd /root/encrypt_miner_proxy"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'
    screen -r encrypt-miner-proxy -p 0 -X stuff "./Server_Run.sh"
    screen -r encrypt-miner-proxy -p 0 -X stuff $'\n'

    echo "encrypt-miner-proxy 重新启动成功"
}

stop() {
    if screen -list | grep -q "encrypt-miner-proxy"; then
        screen -X -S encrypt-miner-proxy quit
    fi
    echo "encrypt-miner-proxy 已停止"
}

change_limit(){
    num="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 102400" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为102400,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

check_limit(){
    echo -n "当前连接数限制："
    ulimit -n
}

echo "======================================================="
echo "蜜罐代理服务端Linux一键安装脚本"
echo "  1、安装(默认安装到/root/encrypt_miner_proxy)"
echo "  2、卸载"
echo "  3、更新"
echo "  4、启动"
echo "  5、重启"
echo "  6、停止"
echo "  7、解除linux系统连接数限制(需要重启服务器生效)"
echo "  8、查看当前系统连接数限制"
echo "======================================================="
read -p "$(echo -e "请选择[1-8]：")" choose
case $choose in
1)
    install
    ;;
2)
    uninstall
    ;;
3)
    update
    ;;
4)
    start
    ;;
5)
    restart
    ;;
6)
    stop
    ;;
7)
    change_limit
    ;;
8)
    check_limit
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac
