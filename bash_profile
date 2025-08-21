#
# ~/.bash_profile
#

# ENVIRONMENT rarely changed or not idempotent
[[ -d "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin"
[[ -d "$HOME/dotfiles" ]] && export DOTDIR="$HOME/dotfiles"
[[ -f "$HOME/todo.md" ]] && export TODOFILE="$HOME/todo.md"
export EDITOR='vim'

# Make sure to source bashrc after exporting ENVIRONMENT used there
# if you want it to work properly within console TTY login shell
[[ -f ~/.bashrc ]] && . ~/.bashrc
