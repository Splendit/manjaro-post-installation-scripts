#!/bin/bash

echo "======================================================================"
echo "install java "
echo "======================================================================"

# install java versions
echo "Installing Oracle Java..."
yay --verbose -S --noconfirm --needed jdk8 jdk11 jdk

echo "Installing OpenJDK"
sudo pacman --verbose -S --noconfirm --needed jdk8-openjdk jdk11-openjdk  jdk-openjdk 

# set default java version
echo "Setting default java version..."
sudo archlinux-java set java-11-openjdk

#install jenv
echo "Installing jenv..."
git clone https://github.com/gcuisinier/jenv.git ~/.jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
source ~/.zshrc

# configure jenv with installed jvms
echo "Configuring jenv..."
jenv add /usr/lib/jvm/java-13-jdk
jenv add /usr/lib/jvm/java-13-openjdk
jenv add /usr/lib/jvm/java-11-jdk
jenv add /usr/lib/jvm/java-11-openjdk
jenv add /usr/lib/jvm/java-8-jdk
jenv add /usr/lib/jvm/java-8-openjdk
jenv global 11.0
