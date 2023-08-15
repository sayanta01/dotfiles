#
# ~/.bashrc
#

eval "$(zoxide init bash)"
eval "$(starship init bash)"

[[ $- != *i* ]] && return # If not running interactively, don't do anything

shopt -s autocd       # Allows you to cd into directory merely by typing the directory name
shopt -s histappend   # Append to the history file, don't overwrite it
shopt -s checkwinsize # Check the window size after each command and, if necessary, update the values of LINES and COLUMNS

export HISTFILESIZE=2000
export HISTSIZE=2000
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Aliases
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"

# Automatically do an ls after each cd
# cd() {
# 	if [ -n "$1" ]; then
# 		builtin cd "$@" && ls
# 	else
# 		builtin cd ~ && ls
# 	fi
# }

# For some reason, rot13 pops up everywhere
rot13() {
	if [ $# -eq 0 ]; then
		tr 'a-mn-zA-MN-Z' 'n-za-mN-ZA-M'
	else
		echo "$*" | tr 'a-mn-zA-MN-Z' 'n-za-mN-ZA-M'
	fi
}

function hst() {
	session_type="$XDG_SESSION_TYPE"

	if [ "$session_type" = "x11" ]; then
		history | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c
	elif [ "$session_type" = "wayland" ]; then
		history | tac | cut -c 8- | fzf | tr -d '\n' | wl-copy
	else
		history | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c
	fi
}

. "$HOME/.local/share/cargo/env"
# . "$HOME/.cargo/env" # 4 kali

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"
