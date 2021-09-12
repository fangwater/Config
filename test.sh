#!/bin/sh
sudo apt install vim
sudo apt install wget 
sudo apt install sed
sudo apt install grep
sudo apt-get install openssh-server
sudo apt install gzip
# Change SSH port
echo "\033[32mStrat Change SSH port \033[0m" 
line_number=`grep -n "#Port 22" /etc/ssh/sshd_config | cut -d ":" -f 1`
sudo sed -i "${line_number}d" /etc/ssh/sshd_config
sudo sed -i "$line_number i Port 22 \nPort 2000" /etc/ssh/sshd_config

line_number=`grep -n "#Port 22" /etc/ssh/ssh_config | cut -d ":" -f 1`
sudo sed -i "${line_number}d" /etc/ssh/ssh_config
sudo sed -i "$line_number i Port 22 \nPort 2000" /etc/ssh/ssh_config

echo "\033[32mSuccess change sshd_config port 2000 \033[0m" 

# Install Caddy
echo "\033[32mStart install caddy \033[0m" 
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
echo "\033[32mSuccess install caddy \033[0m" 
#yarn
echo "\033[32mStart install yarn \033[0m" 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
echo "\033[32mSuccess install yarn \033[0m" 
#FileBrower 6000
echo "\033[32mSuccess install FileBrower\033[0m" 
mkdir file
curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
echo "\033[32mSuccess install FileBrower\033[0m" 

#Install ProxyChains
echo "\033[32mStart install ProxyChains\033[0m" 
sudo apt install proxychains
line_number=`grep -n "socks4 	127.0.0.1 9050" /etc/proxychains.conf| cut -d ":" -f 1`
sudo sed -i "${line_number}d" /etc/proxychains.conf
sudo sed -i "$line_number i socks5 127.0.0.1 7891\nhttp 127.0.0.1 7890" /etc/proxychains.conf
echo "\033[32mSuccess install ProxyChains\033[0m" 

#Install clash
echo "\033[32mStart install clash\033[0m" 
mkdir clash
wget https://github.com/Dreamacro/clash/releases/download/v1.7.0/clash-linux-amd64-v1.7.0.gz
gunzip clash-linux-amd64-v1.7.0.gz
mv clash-linux-amd64-v1.7.0 clash
sudo chmod +x clash
wget https://raw.githubusercontent.com/fangwater/Config/main/config.yaml
wget https://github.com/haishanh/yacd/archive/gh-pages.zip
unzip gh-pages.zip
mv yacd-gh-pages ui
echo "\033[32mSuccess install clash\033[0m" 
#Install Aria2Ng
echo "\033[32mStart install Aria2Ng\033[0m" 
mkdir Aria2Ng
wget https://github.com/mayswind/AriaNg/releases/download/1.2.2/AriaNg-1.2.2.zip
unzip unzip AriaNg-1.2.2.zip
echo "\033[32mSuccess install Aria2Ng\033[0m"

#Install frps
echo "\033[32mStart install Frps\033[0m" 
wget https://github.com/fatedier/frp/releases/download/v0.37.1/frp_0.37.1_linux_amd64.tar.gz
tar -zxvf frp_0.37.1_linux_amd64.tar.gz
mv frp_0.37.1_linux_amd64 frp_server
wget https://raw.githubusercontent.com/fangwater/Config/main/frps.ini
echo "\033[32mSuccess install Frps\033[0m" 










































