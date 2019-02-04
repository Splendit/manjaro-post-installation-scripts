#!/bin/bash

echo "======================================================================"
echo "install openssh"
echo "======================================================================"

# install openssh
sudo pacman -S --noconfirm --needed openssh
sudo systemctl enable sshd
sudo systemctl start sshd
