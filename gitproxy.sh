#!/bin/bash
. color.sh
#shadowsocks的git代理设置
#http代理url
proxy_url="http://127.0.0.1:1087"
#socks代理url
proxy_socks_url="socks5://127.0.0.1:1086"

# param1：add添加，其他删除
# param2: 1为http代理，其他为socks代理
if [ "add" == $1 ];
then
	if [[ "1" == $2 ]];
	then
		git config --global https.proxy $proxy_url
		git config --global http.proxy $proxy_url
		log "git http proxy was setted for $proxy_url finish!"
	else
		git config --global https.proxy $proxy_socks_url
		git config --global http.proxy $proxy_socks_url
		log 6 "git socks5 proxy was setted for $proxy_socks_url finish!"
	fi
else
		git config --global --unset https.proxy
		git config --global --unset http.proxy
		log 6 'git proxy was deleted!'
fi
