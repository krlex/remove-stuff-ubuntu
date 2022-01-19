#!/bin/sh

sudo apt update && sudo apt update -y && sudo apt autoremove -y && sudo apt clean
sudo apt install -y git

sudo service zsysd stop
sudo systemctl disable zsysd

sudo service snapd stop
sudo sysctl disable snapd

sudo apt install -y neovim \
                    tmux \
                    terminator \
                    python3-pip \
                    keepassxc \
                    pavucontrol \
                    wget 

mkdir /home/$USER/repos

bash <(curl -sL https://raw.githubusercontent.com/InstallEasy/vagrant/main/install.sh)
bash <(curl -sL https://raw.githubusercontent.com/InstallEasy/nodejs/main/script.sh) tls 
bash <(curl -sL https://raw.githubusercontent.com/InstallEasy/docker/master/script.sh)
bash <(curl -sL https://raw.githubusercontent.com/InstallEasy/gajim/master/script.sh)

sudo apt install  -f

sudo apt purge -y zsysd snapd && sudo apt autoremove -y

wget https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb
sudo dpkg -i virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb
sudo apt install -f

wget https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb
sudo dpkg -i viber.deb
sudo apt install -f
