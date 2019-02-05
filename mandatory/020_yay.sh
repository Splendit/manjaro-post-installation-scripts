#!/bin/bash

echo "======================================================================"
echo "install yay"
echo "======================================================================"

# install yay for AUR packages
sudo pacman --verbose -S --noconfirm --needed yay
