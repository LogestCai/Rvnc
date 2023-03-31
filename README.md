![Rvnc-logo-blue](http://img.52qcg.cn/books_markdown/Rvnc-logo-blue.png)

[![Php Version](https://img.shields.io/badge/php-%3E=7.1.0-brightgreen.svg?maxAge=2592000&color=yellow)](https://github.com/php/php-src)
[![Mysql Version](https://img.shields.io/badge/mysql-%3E=5.7-brightgreen.svg?maxAge=2592000&color=orange)](https://www.mysql.com/)
[![Thinkphp Version](https://img.shields.io/badge/thinkphp-%3E=6.0.2-brightgreen.svg?maxAge=2592000)](https://github.com/top-think/framework)
[![C#4.0](https://img.shields.io/badge/daoNet-%3E=4.0-pink.svg?maxAge=2592000&color=critical)](https://dotnet.microsoft.com/zh-cn/download/dotnet-framework/net40)
[![Layuimini Version](https://img.shields.io/badge/layuimini-%3E=2.0.4.2-brightgreen.svg?maxAge=2592000&color=ff69b4)](https://github.com/zhongshaofa/layuimini)
[![noVNC](https://img.shields.io/badge/noVnc-vnc-blue.svg?maxAge=2592000)](https://github.com/novnc/noVNC)
[![EasyAdmin License](https://img.shields.io/badge/license-MIT-green?maxAge=2592000&color=blue)](http://rvnc.52qcg.cn)

## 项目介绍

基于noVNC、C#和easyAdmin快速开发的远程管理平台。
可快速部署企业内部远程管理平台，方便企业运维管理。

## 安装教程

### 1、docker 方式安装

>强烈推荐使用docker方式一键安装。

```bash
第一步，下载安装包
git clone https://github.com/LogestCai/Rvnc.git
或者
git clone https://gitee.com/qcg0223/Rvnc.git

第二步，安装依赖包
cd Rvnc/rvnc
### 需要制定安装机器的IP地址 请设置平台服务器ip地址为静态ip
chmod +x ./run.sh&&./run.sh 192.168.1.4

运行完成后访问如下网址
前台地址：http://192.168.1.4:9999 【请替换成你自己的ip地址】此地址为pc端终端安装页面
后台地址：http://192.168.1.4:9999/admin 【请替换成你自己的ip地址】
	登录用户  admin 密码 111111

```



### 2、自行部署环境安装

较复杂，暂时不建议，有兴趣自行研究源码！ 
## 功能介绍
- 客户端http功能 支持发送cmd命令、关闭指定程序命令
- tvnserver服务方式运行。支持锁屏状态下直接远程主机
- 支持vnc发送alt+ctrl+del
- 实现局域网微信截图功能
- 主动发送远程请求功能
- 自定义安装包上传

## 代码仓库

* GitHub地址：[https://github.com/LogestCai/Rvnc](https://github.com/LogestCai/Rvnc)
* Gitee地址:[https://gitee.com/qcg0223/Rvnc.git](https://gitee.com/qcg0223/Rvnc.git)

## 项目效果

![项目效果](http://img.52qcg.cn/books_markdown/%E9%A1%B9%E7%9B%AE%E6%95%88%E6%9E%9C.jpg)