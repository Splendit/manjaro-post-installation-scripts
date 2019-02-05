#!/bin/bash

echo "======================================================================"
echo "install aws cli and aws sam"
echo "======================================================================"

# install pip
echo "Installing pip..."
sudo pacman --verbose -S --noconfirm --needed python-pip

# install aws cli
echo "Installing AWS CLI..."
pip install awscli --upgrade --user

# make aws cli accessible in bash and zsh
echo "Configuring PATH..."
echo 'export PATH=~/.local/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

# install aws sam cli
echo "Installing AWS SAM CLI..."
pip install --user aws-sam-cli
