# Start shell in tmux by default (if not already in tmux)
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# History convieniences
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Swap escape and caps lock
/usr/bin/setxkbmap -option "caps:swapescape"

# Useful for apps installed for a user
PATH=~/.local/bin:$PATH
force_color_prompt=yes

# Vim mode
set editing-mode vi
set -o vi

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


# Show git branch name, color included
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Custom PS1
export PS1="\u@\h \[\033[01;32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
      . /usr/share/bash-completion/bash_completion

# Set vim as default editior
export VISUAL=vim
export EDITOR="$VISUAL"
export LOCAL_DEVELOPMENT=true

LS_COLORS=$LS_COLORS:'di=0;36' ; export LS_COLORS
export PATH=$HOME/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
