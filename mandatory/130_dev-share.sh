#!/bin/bash

echo "======================================================================"
echo "mount dev-share and add to fstab"
echo "======================================================================"

# install nfs-utils
echo "Installing nfs-utils..."
sudo pacman --verbose -S --noconfirm --needed nfs-utils

# prepare mount directory
echo "Creating mount directory..."
sudo mkdir -p /media/dev-share
sudo chmod +t /media/dev-share

# mount dev-share
echo "Mounting dev-share..."
sudo mount ds1515.splendit.loc:/volume1/dev-share /media/dev-share

# make mount permanent -> fstab
echo "Adding dev-share to fstab..."
FSTAB_DEV_SHARE="ds1515.splendit.loc:/volume1/dev-share       /media/dev-share      nfs auto,users,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0"
echo "$FSTAB_DEV_SHARE" | sudo tee -a /etc/fstab
