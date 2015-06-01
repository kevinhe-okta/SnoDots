#! /bin/bash
cd ~
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install git htop mailutils
git clone https://github.com/kevinhe-okta/SnoDots.git
cp -r ~/Snodots/vim ~/.vim
cp ~/Snodots/vimrc ~/.vimrc
cp ~/Snodots/screenrc ~/.screenrc
cat ~/Snodots/bashrc > ~/.bashrc
