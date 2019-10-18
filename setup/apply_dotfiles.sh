#!/usr/bin/env bash

cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.bashrc ~/.bashrc
cp dotfiles/.tmux.conf ~/.tmux.conf
sudo cp -r dotfiles/resurrect ~/.tmux/resurrect
mkdir -p ~/.config/htop/htoprc
sudo cp dotfiles/htoprc ~/.config/htop/htoprc
dconf load /org/gnome/terminal/ < dotfiles/gnome_terminal_settings.txt
# make sure bashrc is sourced in tmux env
echo ". ~/.bashrc" >> ~/.bash_profile
