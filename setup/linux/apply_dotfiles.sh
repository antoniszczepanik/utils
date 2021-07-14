#!/usr/bin/env bash

mkdir -p ~/.config/git

cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.tmux.conf ~/.tmux.conf
cp dotfiles/.zshrc ~/.zshrc
cp -r dotfiles/regolith/ ~/.config/
cp dotfiles/ignore ~/.config/git/ignore
