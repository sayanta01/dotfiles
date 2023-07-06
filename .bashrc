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

. "$HOME/.local/share/cargo/env"
# . "$HOME/.cargo/env" # for kali

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

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

# Aliases
alias hst="history | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c"
