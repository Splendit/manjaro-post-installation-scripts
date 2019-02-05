#!/bin/bash

echo "======================================================================"
echo "install zsh and oh-my-zsh"
echo "======================================================================"

INSTALL_FILE=/tmp/oh-my-zsh-install.sh

# download install script
echo "Downloading oh-my-zsh install script..."
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O $INSTALL_FILE

# remove spawning of new shell
sed -i "/env zsh -l/ d" $INSTALL_FILE

# install zsh and oh-my-zsh
echo "Installing zsh..."
sudo pacman -S --verbose --noconfirm --needed zsh

echo "Installing oh-my-zsh..."
$SHELL $INSTALL_FILE
