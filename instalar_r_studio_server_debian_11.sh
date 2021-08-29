#!/bin/bash

function atualiza_repositorio(){

echo ""
echo "
deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free

deb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free
deb-src http://deb.debian.org/debian-security/ bullseye-security main contrib non-free

deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free" > /etc/apt/sources.list

apt update 
apt upgrade -y

}


function instalar_requisitos(){

apt install -y sudo gdebi-core wget apt-transport-https ca-certificates curl gnupg2 

}


function instala_r_base(){
	
apt install -y r-base

}


function download_rstudio_server(){
	
cd /tmp

wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb

sudo gdebi --n rstudio-server-1.4.1717-amd64.deb

}

function exibir_endereco_acesso(){

clear

local ip=$(hostname -I | cut -d ' ' -f1)
echo "Para acessar você deve digitar no navegador:"
echo ""
echo "http://$ip:8787"

}


atualiza_repositorio
instalar_requisitos
instala_r_base
download_rstudio_server
exibir_endereco_acesso