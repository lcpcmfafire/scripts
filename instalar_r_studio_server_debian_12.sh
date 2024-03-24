#!/bin/bash

function instalar_requisitos(){

apt install -y gdebi-core

}


function instala_r_base(){
	
apt install -y r-base

}


function download_rstudio_server(){
	
cd /tmp

wget wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.12.1-402-amd64.deb

gdebi --non-interactive rstudio-server-2023.12.1-402-amd64.deb

}

function exibir_endereco_acesso(){

clear

local ip=$(hostname -I | cut -d ' ' -f1)
echo "Para acessar você deve digitar no navegador:"
echo ""
echo "http://$ip:8787"

}

instalar_requisitos
instala_r_base
download_rstudio_server
exibir_endereco_acesso

#wget -O - https://raw.githubusercontent.com/lcpcmfafire/scripts/master/instalar_r_studio_server_debian_12.sh | bash
