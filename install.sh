#!/bin/bash

echo 'Install pactakges'
dpkg -s curl sudo 1>/dev/null 2>&1 || \
	apt-get -yqq install curl sudo
dpkg -s docker-ce 1>/dev/null 2>&1 || \
	curl -fsSL https://get.docker.com |sh get-docker.sh

echo 'Install systemd script'
mkdir -p /opt/data/dockers /etc/docker-compose
cp systemd/* /etc/systemd/system/
systemctl daemon-reload

echo 'Install custom script'
cp usr_local_sbin/* /usr/local/sbin
cp usr_local_bin/* /usr/local/bin
chmod +x /usr/local/bin/* /usr/local/sbin/*

echo 'Install docker-ce + docker-compose'
export WGET='wget -q'
docker-compose_update
