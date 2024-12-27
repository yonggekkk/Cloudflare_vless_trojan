# Cloudflare-workers/pages代理脚本
### 1、本项目仅支持本地化部署
### 2、本项目配置都为本地化编辑，不使用订阅器、订阅转换等第三方外链引用
### 3、无需担心节点订阅信息被订阅器作者或者订阅转换作者后台查看
--------------------------------
## 脚本特色：
#### 1、懒人小白专用！默认节点都为CF官方IP，无需频繁更新订阅获取客户端优选IP
#### 2、为减少新手小白额外的成本，本项目不推荐使用自定义域名，如果你一定要用自定义域名，也可以
#### 3、当在CF点击部署按钮后，可直接手搓节点或者使用分享链接，最多设置一个uuid/密码，其他不用改
#### 4、Workers方式：支持vless+ws+tls、trojan+ws+tls、vless+ws、trojan+ws代理节点
#### 5、Pages方式：支持vless+ws+tls、trojan+ws+tls代理节点
#### 6、支持单节点链接、聚合通用节点链接、聚合通用节点订阅、sing-box节点订阅、clash节点订阅
#### 7、虽然仅乱码混淆版可用，但只有修改uuid/密码时才必须使用变量
-------------------------------------------------------------

### 交流平台：[甬哥博客地址](https://ygkkk.blogspot.com)、[甬哥YouTube频道](https://www.youtube.com/@ygkkk)、[甬哥TG电报群组](https://t.me/+jZHc6-A-1QQ5ZGVl)、[甬哥TG电报频道](https://t.me/+DkC9ZZUgEFQzMTZl)
--------------------------------

### 推荐新手用户请先看以下两个入门视频教程：

[CF vless/trojan免费节点混淆时代来临：workers/pages代码混淆后详细设置的更新说明；1101报错总结；福利计划：甬哥自建多个ProxyIP让大家使用](https://youtu.be/QSFaP5EVI04)

[CF vless/trojan永久免费节点(视频中代码内容请替换为混淆代码)：无需自定义域名，快速上手搭建；全平台免费客户端设置说明；独家优选IP与Proxyip的意义说明；一键生成美国、香港、欧洲三区优选官方IP](https://youtu.be/WwAeLyEz6jY)

---------------------------------------------

## 一：CF Vless节点可设置的变量内容

| 变量作用 | 变量名称| 变量值要求| 变量默认值| 变量要求|
| :--- | :--- | :--- | :--- | :--- |
| 1、必要的uuid | uuid (小写字母) |符合uuid规定格式 |万人骑uuid：86c50e3a-5b87-49dd-bd20-03c7f2735e40|建议|
| 2、全局节点能上CF类网站 | proxyip (小写字母) |443端口：ipv4地址、[ipv6地址]、域名。非443端口：IPV4地址:端口、[IPV6地址]:端口、域名:端口|proxyip域名：ts.hpc.tw公用域名|可选|
| 3、订阅节点：优选IP | ip1到ip13，共13个 |CF官方IP、CF反代IP、CF优选域名| CF官方不同地区的visa域名|可选|
| 4、订阅节点：优选IP对应端口 | pt1到pt13，共13个 |CF13个标准端口、反代IP对应任意端口| CF13个标准端口|可选|

---------------------------------

## 二：CF Trojan节点可设置的变量内容

| 变量作用 | 变量名称| 变量值要求| 变量默认值| 变量要求|
| :--- | :--- | :--- | :--- | :--- |
| 1、必要的密码 | pswd (小写字母) |建议字母数字 |万人骑密码：trojan|建议|
| 2、全局节点能上CF类网站 | proxyip (小写字母) |443端口：ipv4地址、[ipv6地址]、域名。非443端口：IPV4地址:端口、[IPV6地址]:端口、域名:端口|proxyip域名：ts.hpc.tw公用域名|可选|
| 3、订阅节点：优选IP | ip1到ip13，共13个 |CF官方IP、CF反代IP、CF优选域名| CF官方不同地区的visa域名|可选|
| 4、订阅节点：优选IP对应端口 | pt1到pt13，共13个 |CF13个标准端口、反代IP对应任意端口| CF13个标准端口|可选|

#### 订阅节点中IP与端口的变量（3与4）特别注意 【新手小白可无视变量（3与4），使用默认即可】

0、由于现在只能用混淆代码，无法在文件上直接修改了，只能使用变量

1、切记：当你非要用订阅类的客户端，且要改优选IP时，才需要设置ip1到ip13，pt1到pt13的变量

2、ip1到ip7，pt1到pt7，在订阅分享链接中，仅支持80系端口关TLS节点

3、ip8到ip13，pt8到pt13，在订阅分享链接中，仅支持443系端口开TLS节点

4、设置官方IP，无需设置端口（默认已设置13个CF标准端口）；设置反代IP需要分开关TLS，端口变量也必须设置

5、订阅节点变量设置可参考此[视频教程](https://youtu.be/8s-ELRuFaeE?si=MjhcKbt20d2Q2eqp&t=447)

---------------------------------
## 三：自定义proxyip

虽说脚本默认自带其他大佬的proxyip，但同时也支持自定义proxyip

支持IPV4、IPV6、域名三种方式（端口为443时，可不写:端口）

1、全局节点变量形式（上文一与二已说明）：

| proxyip端口 | IPv4形式| IPv6形式| 域名形式|
| :--- | :--- | :--- | :--- |
| 443端口 | IPV4地址 |[IPV6地址] |域名|
| 非443端口 | IPV4地址:端口 |[IPV6地址]:端口 |域名:端口|

2、单节点path路径形式：

| proxyip端口 | IPv4形式| IPv6形式| 域名形式|
| :--- | :--- | :--- | :--- |
| 443端口 | /pyip=IPV4地址 |/pyip=[IPV6地址] |/pyip=域名|
| 非443端口 | /pyip=IPV4地址:端口 |/pyip=[IPV6地址]:端口 |/pyip=域名:端口|

注意：

1、单节点path路径变更proxyip：仅影响当前客户端正在设置的单节点，并不影响其他单节点或者订阅节点的proxyip

2、全局节点变更proxyip：影响所有未设置path路径proxyip的节点

3、当节点的path路径出现```/pyip=```关键字时，此节点的proxyip只认准path路径设置的proxyip，全局proxyip不起作用

---------------------------------
## 四：无需socks5！小白利用reality协议一键自制proxyip、80系/443系的任意端口反代IP

### 1、Serv00专用：

修改自Serv00|ct8老王sing-box安装脚本，支持一键三协议：vless-reality、vmess-ws(argo)、hysteria2。

主要增加reality协议默认支持 CF vless/trojan 节点的proxyip以及非标端口的优选反代IP功能

详细设置视频教程，请点击[Serv00最全面的代理脚本](https://youtu.be/2VF9D6z2z7w)

Serv00专用一键脚本 (默认自动安装进程保活)，快捷方式：```bash serv00.sh```
```
curl -sSL https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/serv00.sh -o serv00.sh && bash serv00.sh
```
脚本界面预览图：

![1a215abda2dd54d1042e8d3e61979b1](https://github.com/user-attachments/assets/cc28a80b-7cee-41b8-98c1-1d64cb0b1013)


Serv00多账号进程保活脚本仅支持第三方VPS服务器，修改kp.sh文件的参数即可定时自动保活单个或多个Serv00账号的节点

Serv00保活自动下载脚本如下，VPS专用，不可用在serv00上，默认nano编辑形式，你也可以手动放在root目录
```
curl -sSL https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/kp.sh -o kp.sh && chmod +x kp.sh && nano kp.sh
```
最后运行```bash kp.sh```即可 


### 2、VPS专用：

推荐使用 离中国近、便宜、流量多的纯IPV6的vps进行搭建。近可能避免使用IPV4，因为IPV4大概率被大佬们偷扫反代IP，成为他们的公益或收费反代IP库。如果非要用IPV4，请时常关注下自己VPS的流量，使用proxyip与客户端优选IP都会消耗VPS流量

搭建proxyip与反代ip的脚本推荐：[x-ui-yg脚本](https://github.com/yonggekkk/x-ui-yg)、[sing-box-yg脚本](https://github.com/yonggekkk/sing-box-yg)

相关操作请看[视频教程高阶1](https://youtu.be/QOnMVULADko)、[视频教程高阶2](https://youtu.be/CVZStM0t8BA)


### 3、可现实以下四种情况(推荐在TLS节点环境下)：

可选择现实1：仅用于客户端优选IP，即CF节点访问非CF网站的落地IP地区与VPS地区一致，访问CF网站落地IP地区根据proxyip决定

可选择现实2：仅用于proxyip，即CF节点访问CF网站的落地IP地区与VPS地区一致，访问非CF网站落地IP地区根据客户端优选IP决定

可选择现实3：同时用于客户端优选IP与proxyip，即CF节点访问CF网站的落地IP地区、访问非CF网站落地IP地区，两者都与VPS地区一致

可选择现实4：通过在VPS安装WARP全局双栈V4+V6功能，即访问非CF网站的客户端优选IP的落地IP（104.28……/2a09:……）现实固定，或访问CF网站的proxyip的落地IP（104.28……/2a09:……）现实WARP解锁功能效果

-------------------------------------------

## 五：查看配置信息与分享链接

CF Vless：在网页地址栏输入 https:// workers域名 或者 pages域名 或者 自定义域名 /自定义uuid

CF Trojan：在网页地址栏输入 https:// workers域名 或者 pages域名 或者 自定义域名 /自定义密码

注意：

1、workers域名 或者 pages域名 或者 自定义域名如果都被墙，必须开代理才能打开

2、使用自定域时，原先workers域名 或者 pages域名下的配置信息与分享链接依旧可用

---------------------------------

## 六：优选IP应用

如果你没有天天最高速度或者选择国家的需求，使用默认的CF官方IP或者域名即可，不必更换

推荐好记的懒人专属CF官方IP如下（IP落地地区都为美国，支持13个标准端口切换），称之为"冲在最前的不死IP"

104.16.0.0 

104.17.0.0 

104.18.0.0 

104.19.0.0 

104.20.0.0 

104.21.0.0 

104.22.0.0 

104.24.0.0 

104.25.0.0 

104.26.0.0 

104.27.0.0 

172.66.0.0

172.67.0.0

162.159.0.0

2606:4700:: 需IPV6环境

通过配置变量修改，可使用他人分享的IP或者域名，也可以自行本地优选，相关优选应用与脚本可参考视频教程

本地电脑端优选项目推荐（可在上面代码区直接下载）：

1、CDN优选域名V23.8.18 (电脑win64)

2、CF优选反代IP (电脑版，带测速)

3、CF优选官方IP (美、亚、欧三地区无交互电脑版！强烈推荐！点击[视频教程](https://youtu.be/6kKIzObEZ2c))

4、CF优选官方IP (电脑版，带测速)

注意：多个CF节点在客户端使用负载均衡或者自动选择时，建议所有应用的节点都为同一个国家地区，以避免不同国家之间的IP乱跳现象

---------------------------------

## 七：客户端推荐

#### 启用分片(Fragment)功能的好处：无视域名被墙TLS阻断，从而让workers等被墙的域名支持TLS节点
#### 提示：未被墙TLS阻断的自定义域名或pages域名无需开启分片就可使用TLS节点
 
目前支持该功能的平台客户端如下（点击名称即跳转到官方下载地址）

1、安卓Android：[v2rayNG](https://github.com/2dust/v2rayNG/tags)、[Nekobox](https://github.com/maskedeken/NekoBoxForAndroid/tags)、[Karing](https://github.com/KaringX/karing/tags)、v2box

2、电脑Windows：[v2rayN](https://github.com/2dust/v2rayN/tags)、[Hiddify](https://github.com/hiddify/hiddify-next/tags)、[Karing](https://github.com/KaringX/karing/tags)

3、苹果Ios：Karing、Hiddify Proxy & VPN、Shadowrocket(小火箭)、Streisand、v2box

4、软路由Openwrt：[homeproxy](https://github.com/kiddin9/openwrt-packages)，建议使用系统自带的软件库查找更新

注意：其他平台客户端未开启分片功能情况下，workers域的6个443系TLS节点是不可用的

注意：Shadowrocket(小火箭)、v2box、v2rayn、v2rayng客户端对trojan+ws有强制开启TLS问题，造成trojan+ws不通。且clash订阅没有trojan+ws节点。特此说明

关于客户端使用问题，请看[CF vless/trojan永久免费节点教程（六）：节点不能用，问题出在哪？多平台免费客户端设置指南及避坑说明](https://youtu.be/8E0l0nQWLxs)

---------------------------------

### CF视频教程集合：

[CF workers永久免费vless节点搭建教程（一）：全网首发演示跳IP现象，解密两大节点使用技巧，优选IP、优选域名的优缺点说明](https://youtu.be/9V9CQxmfwoA)

[CF workers永久免费vless节点搭建教程（二）：优选反代IP一键脚本发布，pages部署教程，多平台客户端设置说明，独家探讨CF免费代理敏感安全问题](https://youtu.be/McdRoLZeTqg)

[CF workers永久免费Trojan节点搭建教程（三）：无需自定义域名，workers与pages两方案部署优选IP节点；CF Trojan与CF Vless对比总结；如何看待Trojan被识别](https://youtu.be/lmhhL8M1k0I)

强烈推荐：[CF vless/trojan永久免费节点教程（四）：解读优选官方IP、优选反代IP、优选域名三者的关系与特点；ProxyIP存在的意义](https://youtu.be/NaLd-orwFUE)

强烈推荐：[CF vless/trojan永久免费节点教程（五）：不用自定义域名？不用频繁优选IP？不用订阅器？总结CF节点与域名的结构关系图](https://youtu.be/8s-ELRuFaeE)

强烈推荐：[CF vless/trojan永久免费节点教程（六）：节点不能用，问题出在哪？多平台免费客户端设置指南及避坑说明](https://youtu.be/8E0l0nQWLxs)

高阶推荐：[CF vless/trojan永久免费节点最终教程（七）：全网独家演示真正的"固定IP"，解决twitch、chatgpt客户端报错问题；一键自制反代IP与ProxyIP；揭秘你被他人偷扫IP的风险](https://youtu.be/QOnMVULADko)

高阶推荐：[CF vless/trojan永久免费节点最终教程（八）：自建全端口通用的ProxyIP，同时支持客户端地址优选反代IP，自建反代IP的最终教程](https://youtu.be/CVZStM0t8BA)

[直播精选回顾：CF workers vless免费节点四大特点，节点被断流阻断问题](https://youtu.be/9OHGpWlfdJ0)

[ClouDNS永久免费域名最终教程：CF pages vless自定义域名直接部署](https://youtu.be/PN0BLANXh4I)

小白优选IP应用推荐：[CF优选IP解放小白最终方案：一键自动生成美国、香港、欧洲三区优选官方IP，电脑WIN、安卓android、苹果ios多平台一键通用](https://youtu.be/6kKIzObEZ2c)

最新推荐：[CF vless/trojan免费节点混淆时代来临：workers/pages代码混淆后详细设置的更新说明；1101报错总结；福利计划：甬哥自建多个ProxyIP让大家使用](https://youtu.be/QSFaP5EVI04)


---------------------------------
---------------------------------
---------------------------------
---------------------------------
## 优选域名、优选官方IP+反代IP一键脚本（在本地网络环境下利用termux或者ish运行）：

1、安卓请使用termux官方项目下载客户端（谷歌商店下载的不可用！）：https://github.com/termux/termux-app/releases/tag/v0.118.1

首次安装后，请先安装依赖：```pkg upgrade```，然后运行以下你要使用的脚本

2、苹果手机用户，由于ISH最新版有BUG导致脚本运行卡住，请使用ISH_1.2.2版本，可以用巨魔先安装再降级，网上也有其它指定旧版IPA安装的教程

首次安装后，请先安装依赖：```apk add curl bash```，然后运行以下你要使用的脚本

-------------------------------------------------------------
### 脚本1：CF-优选官方IP (默认美、亚、欧三地区 强烈推荐！！！)，安卓苹果手机平板专用：
```
curl -sSL https://raw.githubusercontent.com/yonggekkk/Cloudflare_vless_trojan/main/cf/cf.sh -o cf.sh && chmod +x cf.sh && bash cf.sh
```
-------------------------------------------------------------

### 脚本2：CF-CDN优选公共大厂域名脚本，苹果安卓手机平板专用：
```
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/CFcdnym.sh -o CFcdnym.sh && chmod +x CFcdnym.sh && bash CFcdnym.sh
```
------------------------------------------------------------------------
### 脚本3：CF-优选官方IP+反代IP二合一脚本（带测速），苹果安卓手机平板专用：
```
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/cfip.sh -o cfip.sh && chmod +x cfip.sh && bash cfip.sh
```

-------------------------------------------------------------
### 感谢你右上角的star🌟
[![Stargazers over time](https://starchart.cc/yonggekkk/Cloudflare-workers-pages-vless.svg)](https://starchart.cc/yonggekkk/Cloudflare-workers-pages-vless)
------------------------------------------------------------------------
### 代码来源：[ca110us](https://github.com/ca110us/epeius)、[emn178](https://github.com/emn178/js-sha256/blob/master/src/sha256.js)、[3Kmfi6HP](https://github.com/3Kmfi6HP/EDtunnel)、[badafans](https://github.com/badafans/Cloudflare-IP-SpeedTest)、[XIU2](https://github.com/XIU2/CloudflareSpeedTest)、[老王eooce](https://github.com/eooce/Sing-box/blob/test/sb_00.sh)、[frankiejun](https://github.com/frankiejun/serv00-play/blob/main/start.sh)

### 声明：所有代码来源于Github社区，并通过ChatGPT进行整合
