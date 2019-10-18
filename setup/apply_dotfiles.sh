#!/usr/bin/env bash

cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.bashrc ~/.bashrc
cp dotfiles/.tmux.conf ~/.tmux.conf
sudo cp -r dotfiles/resurrect ~/.tmux/resurrect
mkdir -p ~/.config/htop/htoprc
sudo cp dotfiles/htoprc ~/.config/htop/htoprc
