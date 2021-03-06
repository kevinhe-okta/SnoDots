#! /bin/bash
cd ~
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install git htop tree mailutils tmux
git clone https://github.com/kevinhe-okta/SnoDots.git
cp -r ~/SnoDots/vim ~/.vim
cp ~/SnoDots/vimrc ~/.vimrc
cp ~/SnoDots/screenrc ~/.screenrc
cp ~/SnoDots/tmux.conf ~/.tmux.conf
cat ~/SnoDots/bashrc > ~/.bashrc
