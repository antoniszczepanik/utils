sync-dotfiles:
	cd setup; ./sync_dotfiles.sh
apply-dotfiles:
	cd setup; ./apply_dotfiles.sh; sudo vim +PluginInstall +qall
configure-git:
	cd setup; ./configure_git.sh
setup:
	cd setup; ./setup/setup.sh
	cd setup; ./apply_dotfiles.sh; sudo vim +PluginInstall +qall
	cd setup; ./configure_git.sh
