#
# ~/.bashrc
#

export PS1=" \W \[\e[31m\]$\[\e[m\] "

[[ $- != *i* ]] && return # if not running interactively, don't do anything

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS

export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTFILE="$HOME/.local/share/history"
export HISTCONTROL="erasedups:ignorespace"

[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"
