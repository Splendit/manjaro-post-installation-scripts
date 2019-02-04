#!/bin/bash

echo "======================================================================"
echo "install oracle virtualbox"
echo "======================================================================"

KERNEL_VERSION=$(echo "linux$(uname -r | awk -F "." '{print $1$2}')")

# install virtualbox
sudo pacman -S --noconfirm --needed ${KERNEL_VERSION}-headers
sudo pacman -S --noconfirm --needed ${KERNEL_VERSION}-virtualbox-host-modules
sudo pacman -S --noconfirm --needed virtualbox virtualbox-guest-iso
sudo gpasswd -a $USER vboxusers
