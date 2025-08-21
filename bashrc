#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL='ignoreboth:erasedups'
export HISTIGNORE='re:re *:resudo:reless:regrep *'
export HISTSIZE=1200
export HISTFILESIZE=5000
#export HISTTIMEFORMAT='%b %d %H:%M:%S '

set -o noclobber
complete -c man sudo
complete -d cd

alias c='checkupdates && sudo pacman -Syu'
alias d="$EDITOR $TODOFILE"
alias v="$EDITOR"
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias ..='cd ..'
alias man='man -P "less --incsearch --redraw-on-quit"'

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
