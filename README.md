## Cloudflare-workers/pages代理脚本

### 方案一支持workers部署，实现vless+ws+tls与vless+ws两种代理节点

### 方案二支持pages部署，仅实现vless+ws+tls代理节点

### 详细说明教程请参考[甬哥博客及视频教程](https://ygkkk.blogspot.com/2023/07/cfworkers-vless.html)
--------------------------------
### CF vless代码可修改内容及说明

1、UUID必须自定义（第7行）

2、如果无法访问CF类网站或者ChatGPT，说明ProxyIP失效，可更换ProxyIP，自定义（第9行）

3、伪装网页目前留空，显示为400界面，可自定义（第765行）

4、查看相关分享链接，在网页输入：(workers/pages/自定义)域名/uuid

重点对workers与pages、有域名与无域名，这4种情况下的节点分享做了优化显示，方便小白们理解操作

---------------------------------
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
### 感谢你右上角的star🌟
[![Stargazers over time](https://starchart.cc/yonggekkk/Cloudflare-workers-pages-vless.svg)](https://starchart.cc/yonggekkk/Cloudflare-workers-pages-vless)
------------------------------------------------------------------------
### 感谢：CF-vless代码作者[3Kmfi6HP](https://github.com/3Kmfi6HP/EDtunnel) CF优选IP程序作者[badafans](https://github.com/badafans/Cloudflare-IP-SpeedTest)、[XIU2](https://github.com/XIU2/CloudflareSpeedTest)

---------------------------------------
#### 声明：

#### 其中一键脚本使用base64加密，可自行解密，介意者请勿使用，[加密原因在此](https://ygkkk.blogspot.com/2022/06/github.html)

#### 所有代码来源于Github社区与ChatGPT的整合；如您需要开源代码，请提Issues留下您的联系邮箱
