<h2 align="center">蜜罐加密代理-平头哥</h2>
<h4 align="center">市面上第一款也是唯一一款加密代理抽水软件</h4>

<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-v3.0.0-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2022_04_28-orgin.svg" alt="travis">
  </a>
</p>


## 平头哥Logo
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E8%9C%9C%E7%BD%90.jpg" width="350"/>
</h1>

## 视频教程
[简介](http://f2poolbackup.xyz/index.php/2022/03/13/%e8%9c%9c%e7%bd%90%e4%bb%a3%e7%90%86%e4%b8%ad%e8%bd%ac%e4%bb%8b%e7%bb%8d/)

[视频教程](http://f2poolbackup.xyz/index.php/2022/03/12/%e8%9c%9c%e7%bd%90%e4%bb%a3%e7%90%86%e7%9b%b8%e5%85%b3%e6%95%99%e7%a8%8b/)

## :sparkles: 特性

- 📚 转发抽水基于Netty(Java技术栈高性能框架)+C技术开发，WEB服务基于SpringBoot技术开发
- 💾 安全稳定：客户端+服务端模式(也可单独服务端模式)，客户端加密混淆、服务端解密解混淆
- :cloud: 全币种支持加密煮饭，全币种支持抽水(ETH/ETC/BTC/BCH/LTC/ERG等)
- :zap: 性能强劲，CPU占用低
- 💻 可以自定义抽水比例
- :outbox_tray: WEB管理，清晰明了
- :rocket: 开箱即用：All-In-One 打包，一键搭建运行
- :family_woman_girl_boy: 支持Liunx Windows

## 流量侦别原理
发现很多人不太理解为啥运营商可以侦别SSL流量，明明已经用了SSL(非常安全，数据几乎无法被破解)，但是为啥运营商还是能够识别你的流量呢，其实下图就是原理，中心词就是两个字：特征。对于大数据训练的模型无需知道流量内容，通过大量数据训练之后，流量对外呈现某种特征类型，就可以识别流量了，无需知道明文。
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E6%B5%81%E9%87%8F%E4%BE%A6%E5%88%AB.jpg" width="350"/>
</h1>
知道原理了，那么可以针对该原理，使用自定义加密的算法，并且对数据进行混淆操作，甚至模拟访问正常网页访问，尽可能抹去特征，这样运营商就无法识别。

## 蜜罐平头哥部署模式
### 部署方案1-同普通代理方案

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%881.jpg" width="800"/>
</h1>

### 部署方案2

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%882.jpg" width="800"/>
</h1>

### 部署方案3

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%883.jpg" width="800"/>
</h1>

### 部署方案4

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E9%83%A8%E7%BD%B2%E6%96%B9%E6%A1%884.jpg" width="800"/>
</h1>


## 加解密报文
### 蜜罐平头哥客户端加密混淆

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E5%AE%A2%E6%88%B7%E7%AB%AF%E5%8A%A0%E5%AF%86%E6%95%B0%E6%8D%AE.jpg" width="800"/>
</h1>

### 蜜罐平头哥服务端解密转发

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E6%9C%8D%E5%8A%A1%E7%AB%AF%E8%A7%A3%E5%AF%86%E6%95%B0%E6%8D%AE.jpg" width="800"/>
</h1>

### 蜜罐平头哥WEB界面-客户端

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Web%E7%95%8C%E9%9D%A2-%E5%AE%A2%E6%88%B7%E7%AB%AF.jpg" width="800"/>
</h1>

### 蜜罐平头哥WEB界面-服务端

<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Web%E7%95%8C%E9%9D%A2.jpg" width="800"/>
</h1>

## 部署模式解释
如果使用部署模式1：该模式矿机直连服务端代理，无需客户端代理，链路如下所示

矿机->运营商->服务端代理(香港云主机)->矿池

如果使用部署模式2：该模式每台矿机上安装客户端代理，然后矿机连客户端代理，链路如下所示

矿机->客户端代理(本地局域网)->运营商->服务端代理(香港云主机)->矿池

如果使用部署模式3：该模式在本地局域网随便找一台机器，然后运行客户端代理，局域网上所有机器连这台安装了客户端代理的机器，然后客户端代理连服务端代理，链路如下所示

矿机->客户端代理(本地局域网)->运营商->服务端代理(香港云主机)->矿池

如果使用部署模式4：该模式在本地局域网随便找一台机器，然后运行客户端代理，局域网上所有机器连这台安装了客户端代理的机器，然后客户端代理连服务端代理，链路如下所示

矿机->客户端代理(本地局域网)->客户端代理(国内云主机)->运营商->服务端代理(香港云主机)->矿池

## 开发者费用
0.25%

## :hammer_and_wrench: 运行

### Windows一键安装脚本

#### 安装服务端代理
1、双击Windows_Server_OneKey.bat，弹出对话框，按任意键
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E6%9C%8D%E5%8A%A1%E7%AB%AF%E6%AD%A5%E9%AA%A41.jpg" width="600"/>
</h1>

2、根据提示安装程序
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E8%BF%90%E8%A1%8CWindows%E6%9C%8D%E5%8A%A1%E7%AB%AF%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC.jpg" width="600"/>
</h1>

3、浏览器输入url登入
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E6%9C%8D%E5%8A%A1%E7%AB%AF%E6%AD%A5%E9%AA%A44.jpg" width="600"/>
</h1>

#### 安装客户端代理
1、双击Windows_Client_OneKey.bat，弹出对话框，按任意键
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%AD%A5%E9%AA%A41.jpg" width="600"/>
</h1>

2、根据提示安装程序
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E8%BF%90%E8%A1%8CWindows%E5%AE%A2%E6%88%B7%E7%AB%AF%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC.jpg" width="600"/>
</h1>

3、浏览器输入url登入
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%AD%A5%E9%AA%A44.jpg" width="600"/>
</h1>

### Linux一键脚本
#### 安装服务端代理
1、切换root用户
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Linux_%E6%9C%8D%E5%8A%A1%E7%AB%AF%E6%AD%A5%E9%AA%A41.jpg" width="600"/>
</h1>

2、下载服务端一键脚本
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E4%B8%8B%E8%BD%BDLinux%E6%9C%8D%E5%8A%A1%E7%AB%AF%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC.jpg" width="600"/>
</h1>

```bash
wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/script/Linux/LinuxOneKey/Linux_Server_OneKey.sh
```

3、执行服务端一键脚本
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E8%BF%90%E8%A1%8CLinux%E6%9C%8D%E5%8A%A1%E7%AB%AF%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC.jpg" width="600"/>
</h1>

```bash
bash Linux_Server_OneKey.sh
```

4、输入url登入
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Linux_%E6%9C%8D%E5%8A%A1%E7%AB%AF%E6%AD%A5%E9%AA%A45.jpg" width="600"/>
</h1>

#### 安装客户端代理
1、切换root用户
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Linux_%E6%9C%8D%E5%8A%A1%E7%AB%AF%E6%AD%A5%E9%AA%A41.jpg" width="600"/>
</h1>

2、下载客户端一键脚本
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E4%B8%8B%E8%BD%BDLinux%E5%AE%A2%E6%88%B7%E7%AB%AF%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC.jpg" width="600"/>
</h1>

```bash
wget https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/encrypt-miner-proxy/script/Linux/LinuxOneKey/Linux_Client_OneKey.sh
```

3、执行客户端一键脚本
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E8%BF%90%E8%A1%8CLinux%E5%AE%A2%E6%88%B7%E7%AB%AF%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC.jpg" width="600"/>
</h1>

```bash
bash Linux_Client_OneKey.sh
```


4、输入url登入
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Linux_%E5%AE%A2%E6%88%B7%E7%AB%AF%E6%AD%A5%E9%AA%A42.jpg" width="600"/>
</h1>

## 安装问题
### 问题1
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Windows%E9%97%AE%E9%A2%981.jpg" width="600"/>
</h1>
解答：缺少必要的windwos运行库，参照这个贴解决https://zhuanlan.zhihu.com/p/102535551

## 蜜罐代理软件性能
下图是服务器连续跑了2天2夜，一共连接这100多个矿工的情况下占用的资源情况：
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/Win%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%80%A7%E8%83%BD.jpg" width="600"/>
</h1>

## 联系方式
### 链接打开
<p align="center">
  <a href="https://t.me/+Q0u6PCLXZoZhMjRl">Telegram 群</a> •
  <a href="https://jq.qq.com/?_wv=1027&k=6Hkn0cla">QQ 群</a> 
</p>
### 扫码
QQ群：
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/%E8%9C%9C%E7%8D%BE%E4%BB%A3%E7%90%86%E5%AE%98%E6%96%B9%E6%8A%80%E6%9C%AF%E4%BA%A4%E6%B5%81%E7%BE%A4%E7%BE%A4%E8%81%8A%E4%BA%8C%E7%BB%B4%E7%A0%81.png" width="350"/>
</h1>
TG：https://t.me/+Q0u6PCLXZoZhMjRl
<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/ryu0007/EncryptMinerProxy/main/images/TG.png" width="350"/>
</h1>



## 其他说明

1、使用gitHub的DownLoad ZIP或者gitee的下载压缩包功能下载的包，双击bat文件会报错，估计是网站在打zip包的时候对bat做了啥处理，使用正常的git clone下载无任何问题，请下载release版本，如果有问题请加群获取正确的bat文件，或者使用git clone下载bat文件

