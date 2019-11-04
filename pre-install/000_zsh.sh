#!/bin/bash

echo "======================================================================"
echo "install zsh and zplug"
echo "======================================================================"

# install zsh and oh-my-zsh
echo "Installing zsh..."
sudo pacman -S --verbose --noconfirm --needed zsh

echo "Installing zplug..."
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

