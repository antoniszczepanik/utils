#!/usr/bin/env bash

cp ~/.vimrc dotfiles/
cp ~/.bashrc dotfiles/
cp ~/.tmux.conf dotfiles/
cp -rL ~/.tmux/resurrect/last dotfiles/resurrect/
cp ~/.config/htop/htoprc dotfiles/
dconf dump /org/gnome/terminal/ > dotfiles/gnome_terminal_settings.txt
