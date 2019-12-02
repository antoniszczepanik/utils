setup-basic:
	cd setup; ./setup.sh
sync-dotfiles:
	cd setup; ./sync_dotfiles.sh
apply-dotfiles:
	cd setup; ./apply_dotfiles.sh; sudo vim +PluginInstall +qall
configure-git:
	cd setup; ./configure_git.sh
setup: setup-basic apply-dotfiles configure-git
