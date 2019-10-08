#!/usr/bin/env bash

apt update
apt install -y git tmux vim-gtk3

setxkbmap -option caps:swapescape

apt-get install xclip

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

./configure_git.sh

echo "Remember to run 'CTRL+B I' to install tmux plugins and to run :PluginInstall in vim"
