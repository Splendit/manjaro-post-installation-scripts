#!/bin/bash

echo "======================================================================"
echo "install webmin"
echo "======================================================================"

# install webmin
yay --verbose -S --noconfirm --needed webmin

echo "Starting webmin..."
sudo systemctl start webmin.service

echo "Enabling webmin..."
sudo systemctl enable webmin.service
