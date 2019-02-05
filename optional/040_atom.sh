#!/bin/bash

echo "======================================================================"
echo "install atom and atom java decompiler"
echo "======================================================================"

# install atom and java decompiler for atom
sudo pacman --verbose -S --noconfirm --needed atom
apm install atom-java-decompiler
