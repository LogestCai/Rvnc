#!/bin/bash

####替换原有的配置文件
mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.bak
ln -s /etc/nginx/nginx.conf /usr/local/nginx/conf/
/bin/cp -rf /usr/local/src/php.ini /usr/local/php7/lib/php.ini

