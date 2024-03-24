#!/bin/bash

function atualiza_repositorio(){

echo ""
echo "
deb http://deb.debian.org/debian bookworm main non-free-firmware
deb-src http://deb.debian.org/debian bookworm main non-free-firmware

deb http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware
deb-src http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware

deb http://deb.debian.org/debian bookworm-updates main non-free-firmware
deb-src http://deb.debian.org/debian bookworm-updates main non-free-firmware" > /etc/apt/sources.list

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

wget wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.12.1-402-amd64.deb

sudo gdebi rstudio-server-2023.12.1-402-amd64.deb -y

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

#wget -O - https://raw.githubusercontent.com/lcpcmfafire/scripts/master/instalar_r_studio_server_debian_12.sh | bash
