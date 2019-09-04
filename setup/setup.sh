#!/usr/bin/env bash

apt update
apt install git
apt install tmux
apt install vim-gtk3

setxkbmap -option caps:swapescape

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



