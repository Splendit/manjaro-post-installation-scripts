#!/bin/bash

echo "======================================================================"
echo "install openssh"
echo "======================================================================"

# install openssh
sudo pacman --verbose -S --noconfirm --needed openssh

echo "Enable sshd..."
sudo systemctl enable sshd

echo "Start sshd..."
sudo systemctl start sshd
