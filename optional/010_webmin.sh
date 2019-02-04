#!/bin/bash

echo "======================================================================"
echo "install webmin"
echo "======================================================================"

# install webmin
yay -S --noconfirm --needed webmin
sudo systemctl start webmin.service
sudo systemctl enable webmin.service
