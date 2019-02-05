#!/bin/bash

echo "======================================================================"
echo "install oracle virtualbox"
echo "======================================================================"

KERNEL_VERSION=$(echo "linux$(uname -r | awk -F "." '{print $1$2}')")

# install virtualbox
sudo pacman --verbose -S --noconfirm --needed ${KERNEL_VERSION}-headers
sudo pacman --verbose -S --noconfirm --needed ${KERNEL_VERSION}-virtualbox-host-modules
sudo pacman --verbose -S --noconfirm --needed virtualbox virtualbox-guest-iso

echo "Adding $USER to vboxusers group..."
sudo gpasswd -a $USER vboxusers
