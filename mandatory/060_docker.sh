#!/bin/bash

echo "======================================================================"
echo "install docker and docker-compose"
echo "======================================================================"

# install docker
sudo pacman --verbose -S --noconfirm --needed docker docker-compose

echo "Enable docker daemon..."
sudo systemctl enable docker

echo "Start docker daemon..."
sudo systemctl start docker

echo "Adding $USER to docker group..."
sudo gpasswd -a $USER docker
