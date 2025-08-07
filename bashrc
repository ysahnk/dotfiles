#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="re:re *:resudo:reless:regrep *"
export HISTSIZE=1000
export HISTFILESIZE=5000
#export HISTTIMEFORMAT="%b %d %H:%M:%S "
# stop pipe overwrite
set -o noclobber
complete -c man sudo

alias c='checkupdates && sudo pacman -Syu'
alias d='vim ~/todo.md'
alias v='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias ..='cd ..'

alias sudo='sudo '
alias re='eval "$(fc -ln -1)"'
#alias rere='eval "$(fc -ln -2 -2)"'
alias resudo='eval "sudo $(fc -ln -1)"'
alias reless='eval "$(fc -ln -1) | less"'
alias regrep='eval "$(fc -ln -1)" | grep'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias grep='grep --color=auto'

PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
