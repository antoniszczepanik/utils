#!/usr/bin/env bash

# do not proceed in case of failure
set -e

sudo apt update
sudo apt install -y git tmux vim-gtk3 htop curl

sudo apt-get install xclip

setxkbmap -option caps:swapescape

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "Remember to run 'CTRL+B I' to install tmux plugins!"
