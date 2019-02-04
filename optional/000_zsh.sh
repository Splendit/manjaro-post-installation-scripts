#!/bin/bash

echo "======================================================================"
echo "install zsh and oh-my-zsh"
echo "======================================================================"

# install zsh and oh-my-zsh
sudo pacman -S --noconfirm --needed zsh
sudo chsh -s $(which zsh) ${USER}
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
source ~/.zshrc
