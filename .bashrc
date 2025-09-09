#
# ~/.bashrc
#

export PS1=" \W \[\e[31m\]❯\[\e[m\] "

[[ $- != *i* ]] && return # if not running interactively, don't do anything

shopt -s histappend   # append to the history file, don't overwrite it
shopt -s checkwinsize # check the window size after each command and, if necessary, update the values of LINES and COLUMNS

export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL="erasedups:ignorespace"

[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"

function hst() {
	if [ -n "$WAYLAND_DISPLAY" ]; then
		history 0 | tac | cut -c 8- | fzf | tr -d '\n' | wl-copy
	else
		history 0 | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c
	fi
}
