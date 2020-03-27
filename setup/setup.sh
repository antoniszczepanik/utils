#!/usr/bin/env bash

# do not proceed in case of failure
set -e

sudo apt-get install xclip

setxkbmap -option caps:swapescape
# remap mouse 8 to nothing (not going back with mouse8)
xmodmap -e "pointer = 1 2 3 4 5 6 7 10 9 8"

sudo apt update
sudo apt install -y \
	git \
	tmux \
	vim-gtk3 \
	htop \
	curl \
	docker.io \
	python3-pip

sudo usermod -aG docker $USER
# install compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# nodejs for vim mode
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs

pip3 install -r basic_requirements.txt

jupyter labextension install jupyterlab_vim

# silent output in case of errors
if [ ! -d "~/.vim/bundle" ] ; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d "~/.tmux/plugins/tpm" ] ; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


echo "Remember to run 'CTRL+B I' to install tmux plugins!"
