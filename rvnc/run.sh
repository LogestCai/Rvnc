#!/bin/bash
if [ ! -n "$1" ] ;then
    echo "第一个参数必须指定IP"
    exit 1
else
    echo "the IP you input is $1"
fi

ip_address=`ip addr | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}'`
work_dir=`pwd`
##### 启动redis容器
echo "===================正在启动redis容器=================================="
docker run -p 6379:6379 --name redis -d redis:6.2 redis-server --save 60 1 --loglevel warning

### 启动vnc代理
echo "===================正在启动vnc代理容器=================================="
docker run -itd --rm  -p 6080:6080 -v $work_dir/noVNC:/data royeecai/novnc-websockify   --web /data :6080 --token-plugin TokenRedis --token-source "$1":6379


### 启动mysql
echo "===================正在启动mysql容器=================================="
docker run --name mysql57 -p 3306:3306 -v $work_dir/database/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=Cmm@111111 -d mysql:5.7
#docker exec -i mysql57 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" --default-character-set=utf8 ' < $work_dir/database/devManager.sql
#docker exec -i mysql57 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" --default-character-set=utf8 ' < $work_dir/database/views.sql

### 启动vncLNMP
echo "===================正在启动启动vncLNMP=================================="
docker run -dit \
-p 9999:80 \
-p 3307:3306 \
-p 9000:9000 \
-v $work_dir/php/www:/www \
-v $work_dir/php/extensions:/usr/local/src \
-v $work_dir/php/conf:/etc/nginx \
--privileged=true \
--name=vnclnmp \
royeecai/cmmlnmp

docker exec -i vnclnmp bash -c 'cd /usr/local/src && chmod +x ./init.sh && ./init.sh'
docker container restart vnclnmp
####替换数据库ip地址
sed -i "s/HOSTNAME=10.87.230.199/HOSTNAME=$1/g" ./php/www/.env


echo "===================正在启动还原mysql数据文件=================================="
sleep 15s
docker exec -i mysql57 sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" --default-character-set=utf8 ' < ./database/devManager.sql



