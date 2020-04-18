#!/usr/bin/env bash

cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.bashrc ~/.bashrc
cp dotfiles/.tmux.conf ~/.tmux.conf
cp dotfiles/config ~/.config/i3/config

dconf load /org/gnome/terminal/ < dotfiles/gnome_terminal_settings.txt

# make sure bashrc is sourced in tmux env
echo ". ~/.bashrc" >> ~/.bash_profile
