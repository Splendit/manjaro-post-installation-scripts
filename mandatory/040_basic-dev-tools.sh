#!/bin/bash

echo "======================================================================"
echo "install basic dev tools"
echo "======================================================================"

# install basic dev tools
sudo pacman --verbose -S --noconfirm --needed vim maven cloc
