# [ -f "$HOME/.profile" ] && . "$HOME/.profile" # put this in ~/.bash_profile
[[ $- != *i* ]] && return # if not running interactively, don't do anything

export PS1=" \W \[\e[31m\]%\[\e[m\] "

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s checkwinsize # update window size after every command
shopt -s lithist      # save history with newlines instead of ; where possible

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

export HISTFILE="$HOME/.bash_history"
export HISTSIZE=50000
export HISTFILESIZE=10000
export HISTCONTROL="erasedups:ignorespace"

[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"
