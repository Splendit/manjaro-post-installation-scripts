#!/bin/bash

echo "======================================================================"
echo "configure pacman"
echo "======================================================================"

# enable colours for pacman --verbose
echo "Enable pacman colours..."
sudo sed -i".old" "s/#Color/Color/g" /etc/pacman.conf

# configure fastest mirrors
echo "Searching fastest pacman mirrors..."
#sudo pacman-mirrors -f
