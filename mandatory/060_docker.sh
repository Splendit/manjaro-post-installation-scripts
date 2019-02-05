#!/bin/bash

echo "======================================================================"
echo "install docker and docker-compose"
echo "======================================================================"

# install docker
sudo pacman --verbose -S --noconfirm --needed docker docker-compose

echo "Adding $USER to docker group..."
sudo gpasswd -a $USER docker
