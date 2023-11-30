#
# ~/.bashrc
#

eval "$(starship init bash)"
export PS1="\W \[\e[31m\]❯\[\e[m\] "

[[ $- != *i* ]] && return # If not running interactively, don't do anything

# shopt -s autocd        # Allows you to cd into directory merely by typing the directory name
shopt -s histappend    # Append to the history file, don't overwrite it
shopt -s checkwinsize  # Check the window size after each command and, if necessary, update the values of LINES and COLUMNS

export HISTFILESIZE=2000
export HISTSIZE=2000
export HISTCONTROL=erasedups:ignoreboth

# Aliases
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"

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

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# [[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"
