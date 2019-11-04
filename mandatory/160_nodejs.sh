#!/bin/bash

echo "======================================================================"
echo "install nodejs and yarn"
echo "======================================================================"

# install docker
sudo pacman --verbose -S --noconfirm --needed nodejs yarn
