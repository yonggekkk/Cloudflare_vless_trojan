# Cloudflare-workers/pages代理脚本

支持workers部署，实现vless+ws+tls、trojan+ws+tls、vless+ws、trojan+ws代理节点

支持pages部署，实现vless+ws+tls、trojan+ws+tls代理节点

--------------------------------

## 一：CF Vless节点可自定义内容

#### 可修改Vless_workers_pages文件下的_worker.js文件

1、UUID必须自定义（第7行）

2、如果无法访问CF类网站或者ChatGPT，说明ProxyIP失效，可更换ProxyIP，自定义（第9行）

3、伪装网页目前留空，显示为400 Bad Request界面，可自定义（第10行）

#### 也可在CF-workers/pages界面中使用变量设置，注：变量设置结果将覆盖本地修改结果
| 变量作用 | 变量名称| 变量值要求| 变量默认值|
| :--- | :--- | :--- | :--- |
| 1、必要的uuid | uuid |符合uuid规定格式 |万人骑uuid：77a571fb-4fd2-4b37-8596-1b7d9728bb5c|
| 2、能上CF类网站 | proxyip |ipv4地址、域名、[ipv6地址]|proxyip域名：cdn.xn--b6gac.eu.org|

#### 详细说明教程请参考[甬哥博客及视频教程](https://ygkkk.blogspot.com/2023/07/cfworkers-vless.html)
---------------------------------

## 二：CF Trojan节点可自定义内容

#### 可修改Trojan_workers_pages文件下的_worker.js文件

1、密码必须自定义（第4行）

2、如果无法访问CF类网站或者ChatGPT，说明ProxyIP失效，可更换ProxyIP，自定义（第5行）

3、伪装网页目前留空，显示为400 Bad Request界面，可自定义（第6行）

#### 也可CF-workers/pages界面中使用变量设置，注：变量设置结果将覆盖本地修改结果
| 变量作用 | 变量名称| 变量值要求| 变量默认值|
| :--- | :--- | :--- | :--- |
| 1、必要的密码 | pswd |任意字符号 |万人骑密码：trojan|
| 2、能上CF类网站 | proxyip |ipv4地址、域名、[ipv6地址]|proxyip域名：cdn.xn--b6gac.eu.org|

#### 详细说明教程请参考[甬哥博客及视频教程]
---------------------------------
## 三：查看相关分享链接（单节点，非订阅）
#### CF Vless分享链接，在网页输入： https:// workers域名 或者 pages域名 或者 自定义域名/自定义uuid
#### CF Trojan分享链接，在网页输入：https:// workers域名 或者 pages域名 或者 自定义域名/自定义密码

#### 注意： 

由于workers域名已被全网TLS阻断、pages域名已被中国移动TLS阻断

所以需使用自定义域名或者在代理环境下才可查看分享链接

如果你看了教程，就可手搓无数个优选IP节点，也不需要买域名，也不需要分享链接

客户端不支持切片功能时，建议使用关TLS的节点或者使用自定义域节点

---------------------------------
---------------------------------
---------------------------------
---------------------------------
# 优选域名、优选官方IP+反代IP一键脚本：

### CF-CDN优选公共大厂域名脚本，苹果安卓手机平板专用，(请参考教程，在本地网络环境下运行)：
```
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/CFcdnym.sh -o CFcdnym.sh && chmod +x CFcdnym.sh && bash CFcdnym.sh
```
------------------------------------------------------------------------
### CF-优选官方IP+反代IP二合一脚本，苹果安卓手机平板专用，(请参考教程，在本地网络环境下运行)：
```
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/cfip.sh -o cfip.sh && chmod +x cfip.sh && bash cfip.sh
```

-------------------------------------------------------------

### 交流平台：[甬哥博客地址](https://ygkkk.blogspot.com)、[甬哥YouTube频道](https://www.youtube.com/@ygkkk)、[甬哥TG电报群组](https://t.me/+jZHc6-A-1QQ5ZGVl)、[甬哥TG电报频道](https://t.me/+DkC9ZZUgEFQzMTZl)

-------------------------------------------------------------
### 感谢你右上角的star🌟
[![Stargazers over time](https://starchart.cc/yonggekkk/Cloudflare-workers-pages-vless.svg)](https://starchart.cc/yonggekkk/Cloudflare-workers-pages-vless)
------------------------------------------------------------------------
### 代码来源：[ca110us](https://github.com/ca110us/epeius)、[emn178](https://github.com/emn178/js-sha256/blob/master/src/sha256.js)、[3Kmfi6HP](https://github.com/3Kmfi6HP/EDtunnel)、[badafans](https://github.com/badafans/Cloudflare-IP-SpeedTest)、[XIU2](https://github.com/XIU2/CloudflareSpeedTest)

### 声明：所有代码来源于Github社区，并通过ChatGPT进行整合
