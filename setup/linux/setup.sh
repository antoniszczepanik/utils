#!/usr/bin/env bash

# do not proceed in case of failure
set -e
apt-get install xclip -y

apt update
apt install -y \
	tmux \
	vim-gtk3 \
	htop \
	curl \
	docker.io \
	python3-pip \
  zsh

# Rebind escape with tab with
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

usermod -aG docker $USER
# install compose
curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# install lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

if [ ! -d "~/.vim/bundle" ] ; then
  mkdir -p ~/.vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "~/.tmux/plugins/tpm" ] ; then
  mkdir -p ~/.tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Remember to run 'CTRL+B I' to install tmux plugins!"
