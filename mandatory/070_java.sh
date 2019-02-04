#!/bin/bash

echo "======================================================================"
echo "install java "
echo "======================================================================"

# install java versions
yay -S --noconfirm --needed jdk jdk8
sudo pacman -S --noconfirm --needed jdk-openjdk jdk8-openjdk

# set default java version
sudo archlinux-java set java-11-jdk

#install jenv
git clone https://github.com/gcuisinier/jenv.git ~/.jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' | tee -a ~/.zshrc ~/.bash_profile
echo 'eval "$(jenv init -)"' | tee -a ~/.zshrc ~/.bash_profile
source ~/.bash_profile

# configure jenv with installed jvms
jenv add /usr/lib/jvm/java-11-jdk
jenv add /usr/lib/jvm/java-11-openjdk
jenv add /usr/lib/jvm/java-8-jdk
jenv add /usr/lib/jvm/java-8-openjdk
jenv global 11.0
