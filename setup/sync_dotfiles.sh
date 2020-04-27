#!/usr/bin/env bash

cp ~/.vimrc dotfiles/
cp ~/.bashrc dotfiles/
cp ~/.tmux.conf dotfiles/
cp ~/.config/i3/config dotfiles/
cp ~/.inputrc dotfiles/

dconf dump /org/gnome/terminal/ > dotfiles/gnome_terminal_settings.txt
