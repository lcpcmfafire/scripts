#!/bin/bash

function download_repo_zabbix(){
cd /tmp
mkdir /tmp/installzabbix
cd /tmp/installzabbix
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-1+debian11_all.deb 

}

function install_repo_zabbix(){

cd /tmp/installzabbix
dpkg -i zabbix-release_6.0-1+debian11_all.deb
apt update

}

function install_zabbix_server(){

apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent  -y

}

function cria_db_e_user_zabbix(){
mysql -u root -p  <<EOF
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'zabbix123';
grant all privileges on zabbix.* to zabbix@localhost;
EOF

}

function descompacta_base_modelo_zabbix(){

zcat /usr/share/doc/zabbix-sql-scripts/mysql/server.sql.gz | mysql -uzabbix -p zabbix 

}

function addpass_zabbix(){

echo "DBpassword=zabbix123" >> /etc/zabbix/zabbix_server.conf 

}

function start_server_and_agentes(){

systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2 

}


download_repo_zabbix
install_repo_zabbix 
install_zabbix_server 
cria_db_e_user_zabbix 
descompacta_base_modelo_zabbix 
addpass_zabbix
start_server_and_agentes

