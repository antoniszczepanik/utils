#!/usr/bin/env bash

apt update
apt install -y git tmux vim-gtk3

setxkbmap -option caps:swapescape

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



