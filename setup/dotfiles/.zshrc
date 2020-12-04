# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/antoni/.oh-my-zsh"

# Swap escape and caps lock
/usr/bin/setxkbmap -option "caps:swapescape"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Vim mode
# Set vim as default editior
export VISUAL=vim
export EDITOR="$VISUAL"

# Aliases
alias c='clear'
alias e='exit'
alias ls='ls -1 --color=auto'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias i3rc='vim ~/.config/i3/config'
alias tmuxconf='vim ~/.tmux.conf'
alias loadbash='source ~/.bashrc'
alias gitconfig='vim ~/.gitconfig'
alias todo="~/utils/scripts/todo.sh"
alias note="~/utils/scripts/todo.sh note"
alias priv="~/utils/scripts/todo.sh priv"

plugins=(
  git
  python
  vi-mode
  rust
  cargo
)
source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"
