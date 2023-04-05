

## RVNC 服务端部署教程

###  一、环境准备

- 准备一台Linux服务器 推荐Centos 7 以上版本
- 安装docker软件安装教程可以
- 主机要能够连接外网

**参考资料**

> linux安装教程：[Centeros 7.6最小化安装](https://blog.csdn.net/Qcg0223/article/details/104157233)
>
> docker安装教程：[Docker快速入门指南](https://blog.csdn.net/Qcg0223/article/details/107999885)



### 二、参考项目文档安装

```
注意 先安装docker 
第一步，下载安装包
git clone https://github.com/LogestCai/Rvnc.git
或者
git clone https://gitee.com/qcg0223/Rvnc.git

第二步，安装依赖包
cd Rvnc/rvnc
### 需要指定安装机器的IP地址 请设置平台服务器ip地址为静态ip 如果执行过程中出现网络错误则重新执行此命令
chmod +x ./run.sh&&./run.sh 192.168.17.211
主机需要开放对应端口  9999 、3306、6379 、6080端口 或关闭防火墙 后重启docker 服务

运行完成后访问如下网址
前台地址：http://192.168.1.4:9999 【请替换成你自己的ip地址】此地址为pc端终端安装页面
后台地址：http://192.168.1.4:9999/admin 【请替换成你自己的ip地址】
	登录用户  admin 密码 111111
```

```shell
[root@localhost rvnc]# chmod +x ./run.sh&&./run.sh 192.168.17.211
the IP you input is 192.168.17.211
===================正在启动redis容器==================================
Unable to find image 'redis:6.2' locally
6.2: Pulling from library/redis
f1f26f570256: Pull complete 
8a1809b0503d: Pull complete 
d792b14d05f9: Pull complete 
bd3e0972c4f9: Pull complete 
05f3167f99d8: Pull complete 
6031abe46d78: Pull complete 
Digest: sha256:09fa1f52ad0cc05590a837eb787799bd768074e6566f53c7a8399243cad456b4
Status: Downloaded newer image for redis:6.2
7e31ea6d0250567052810887ba4f8b97e78f8f1ea3d90a36bd5ad0c67effdcc5
===================正在启动vnc代理容器==================================
Unable to find image 'royeecai/novnc-websockify:latest' locally
latest: Pulling from royeecai/novnc-websockify
0e29546d541c: Pull complete 
9b829c73b52b: Pull complete 
cb5b7ae36172: Pull complete 
6494e4811622: Pull complete 
6f9f74896dfa: Pull complete 
5e3b1213efc5: Pull complete 
9fddfdc56334: Pull complete 
404f02044bac: Pull complete 
c4f42be2be53: Pull complete 
5a0e916cd0ec: Pull complete 
1edc7b45484b: Pull complete 
d46a2e7639c0: Pull complete 
Digest: sha256:df3a2ce26c989c7d622224ac401b4b488253fe68237266b588d1980a51d0a805
Status: Downloaded newer image for royeecai/novnc-websockify:latest
50040962535f846e74ebd69fb3b8180df55cea60a89f7d3ad7467a053c92cc53
===================正在启动mysql容器==================================
Unable to find image 'mysql:5.7' locally
5.7: Pulling from library/mysql
e83e8f2e82cc: Pull complete 
0f23deb01b84: Pull complete 
f5bda3b184ea: Pull complete 
ed17edbc6604: Pull complete 
33a94a6acfa7: Pull complete 
3686cf92b89d: Pull complete 
f81535a6a8bf: Pull complete 
4bffb03ea5e2: Pull complete 
49348ef8dcaa: Pull complete 
509d665d0cf5: Pull complete 
adc919b937fd: Pull complete 
Digest: sha256:bf18020f32cc5d8f5e2add516d52fbf3afc3de431457076340e938596c528171
Status: Downloaded newer image for mysql:5.7
9eab66fb994b9f6371713951000fc9e9243270ce9fa613df163014f963de4117
===================正在启动启动vncLNMP==================================
Unable to find image 'royeecai/cmmlnmp:latest' locally
latest: Pulling from royeecai/cmmlnmp
524b0c1e57f8: Pull complete 
8cd7ef2b22fa: Pull complete 
d7e95cb84cf1: Pull complete 
Digest: sha256:b58d4a94ae0d8a5af9e08552a970a6ee9d0b0301014187a137047e50c03ee306
Status: Downloaded newer image for royeecai/cmmlnmp:latest
edf5a5d04c83590201a7d07c18f0906623c7da5cb608fcba770f39a39da226a5
vnclnmp
===================正在还原mysql数据文件==================================
mysql: [Warning] Using a password on the command line interface can be insecure.

```

- 查看docker服务状态

```shell
[root@localhost rvnc]# docker container ls
CONTAINER ID        IMAGE                       COMMAND                  CREATED              STATUS              PORTS                                                                  NAMES
edf5a5d04c83        royeecai/cmmlnmp            "/usr/sbin/init"         About a minute ago   Up About a minute   0.0.0.0:9000->9000/tcp, 0.0.0.0:9999->80/tcp, 0.0.0.0:3307->3306/tcp   vnclnmp
9eab66fb994b        mysql:5.7                   "docker-entrypoint.s…"   4 minutes ago        Up 4 minutes        0.0.0.0:3306->3306/tcp, 33060/tcp                                      mysql57
50040962535f        royeecai/novnc-websockify   "/docker-entrypoint.…"   5 minutes ago        Up 5 minutes        80/tcp, 443/tcp, 0.0.0.0:6080->6080/tcp                                vnc-proxy
7e31ea6d0250        redis:6.2                   "docker-entrypoint.s…"   6 minutes ago        Up 6 minutes        0.0.0.0:6379->6379/tcp                                                 redis

```



- 查看前台地址是否正常访问

![image-20230405142524557](http://img.52qcg.cn/books_markdown/image-20230405142524557.png)

- 查看后台是否正常访问

![image-20230405142845475](http://img.52qcg.cn/books_markdown/image-20230405142845475.png)

### 三、客户端安装

- 在浏览器打开首页网址 http://192.168.17.211:9999/ 然后点击立即下载按钮

![image-20230405143804854](http://img.52qcg.cn/books_markdown/image-20230405143804854.png)

![image-20230405143838919](http://img.52qcg.cn/books_markdown/image-20230405143838919.png)

![image-20230405143905680](http://img.52qcg.cn/books_markdown/image-20230405143905680.png)

![image-20230405143925321](http://img.52qcg.cn/books_markdown/image-20230405143925321.png)

![image-20230405144001666](http://img.52qcg.cn/books_markdown/image-20230405144001666.png)



- 修改安装根目录下的`SysConfig.ini` 文件 将里面的ip地址改为对应服务器端地址 保存后运行桌面RVNC快捷方式

![image-20230405144254645](http://img.52qcg.cn/books_markdown/image-20230405144254645.png)



- 通过后台 即可远程 

![image-20230405153615915](http://img.52qcg.cn/books_markdown/image-20230405153615915.png)

![image-20230405153645412](http://img.52qcg.cn/books_markdown/image-20230405153645412.png)





###  四、客户端打包

参考[【RVNC客户端exe制作方法.md】](./RVNC客户端exe制作方法.md)

### 五、升级包制作

参考[【RVNC客户端升级包制作方法.md】](./RVNC客户端升级包制作方法.md)
