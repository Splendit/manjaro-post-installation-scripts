#!/bin/bash

echo "======================================================================"
echo "install docker and docker-compose"
echo "======================================================================"

# install docker
sudo pacman -S --noconfirm --needed docker docker-compose
sudo gpasswd -a $USER docker
