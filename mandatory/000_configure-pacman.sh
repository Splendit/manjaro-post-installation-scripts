#!/bin/bash

echo "======================================================================"
echo "configure pacman"
echo "======================================================================"

# enable colours for pacman
sudo sed -i".old" "s/#Color/Color/g" /etc/pacman.conf

# configure fastest mirrors
sudo pacman-mirrors -f
