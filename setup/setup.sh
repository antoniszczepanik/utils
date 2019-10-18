#!/usr/bin/env bash

# do not proceed in case of failure
set -e

apt update
apt install -y git tmux vim-gtk3 htop

apt-get install xclip

setxkbmap -option caps:swapescape

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

./configure_git.sh
./apply_dotfiles.sh
sudo vim +PluginInstall +qall

echo "Remember to run 'CTRL+B I' to install tmux plugins!"
