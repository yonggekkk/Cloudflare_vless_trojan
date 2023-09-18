## Cloudflare代理脚本

## 支持workers与pages两种形式部署

## 现实vless+ws+tls与vless+ws两种代理节点

## 详细说明教程请参考[甬哥博客及视频教程](https://ygkkk.blogspot.com/2023/07/cfworkers-vless.html)
--------------------------------
### CF vless代码默认修改内容

1、UUID默认已更换，强烈建议自定义

2、proxyIP默认为香港地区的固定IP，可自定义

3、伪装网页默认为央视海外频道global.cctv.com，可自定义

4、重点对workers与pages、有域名与无域名，这4种情况下的节点分享做了优化显示，方便小白们理解操作

---------------------------------
### CF-CDN优选域名一键脚本(请参考教程，在本地网络环境下运行)：
```
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/CFcdnym.sh -o CFcdnym.sh && chmod +x CFcdnym.sh && bash CFcdnym.sh
```
------------------------------------------------------------------------
### CF-优选反代IP一键脚本(请参考教程，在本地网络环境下运行)：
```
curl -sSL https://gitlab.com/rwkgyg/CFwarp/raw/main/point/cfip.sh -o cfip.sh && chmod +x cfip.sh && bash cfip.sh
```

------------------------------------------------------------------------
### 感谢：CF-vless代码作者[3Kmfi6HP](https://github.com/3Kmfi6HP/EDtunnel) CF优选IP程序作者[badafans](https://github.com/badafans/Cloudflare-IP-SpeedTest)、[XIU2](https://github.com/XIU2/CloudflareSpeedTest)


