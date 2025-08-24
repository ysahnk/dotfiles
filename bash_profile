#
# ~/.bash_profile
#

# ENVIRONMENT rarely changed or not idempotent
[[ -d "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin"
[[ -d "$HOME/dotfiles" ]] && export DOTDIR="$HOME/dotfiles"
[[ -f "$HOME/todo.md" ]] && export TODOFILE="$HOME/todo.md"
export EDITOR='vim'

# Make sure to export ENVIRONMENT variables BEFORE sourcing bashrc,
# so they are available within console login shell context (TTY).
[[ -f ~/.bashrc ]] && . ~/.bashrc
