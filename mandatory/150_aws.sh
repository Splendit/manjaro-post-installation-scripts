#!/bin/bash

echo "======================================================================"
echo "install aws cli and aws sam"
echo "======================================================================"

# install pip
sudo pacman -S --noconfirm --needed python-pip

# install aws cli
pip install awscli --upgrade --user

# make aws cli accessible in bash and zsh
echo "export PATH=~/.local/bin:$PATH" | tee -a ~/.zshrc ~/.bash_profile
source ~/.bash_profile

# install aws sam cli
pip install --user aws-sam-cli
