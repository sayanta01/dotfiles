# cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"

# setopt autocd               # change directory just by typing its name
# setopt interactivecomments  # allow comments in interactive mode
# setopt extendedglob
# setopt correct              # auto correct mistakes
# setopt numericglobsort      # sort filenames numerically when it makes sense
# setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
# setopt nonomatch            # hide error message if there is no match for the pattern
# setopt notify               # report the status of background jobs immediately
# setopt promptsubst          # enable command substitution in prompt

# Keybindings
bindkey -e                                        # emacs key bindings
bindkey -s '^o' 'lfcd^M'
bindkey -s '^r' 'hst^M'
bindkey -s '^t' 'tmux^M'
bindkey ' ' magic-space                           # history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + u
bindkey '^[[3;5~' kill-word                       # backward del
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + Tab undo last action

# Hide EOL sign ('%')
# PROMPT_EOL_MARK="" 

# Time format
TIMEFMT=$'\ntotal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Enable completion 
autoload -Uz compinit && compinit -d $HOME/.cache/zcompdump
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' list-prompt %S TAB for more
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# History
HISTSIZE=9000
SAVEHIST=9000
HISTFILE="$HOME/.local/share/history"
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_ignore_all_dups    # ignore duplicated commands history list
setopt hist_verify             # show command with history expansion

# Load aliases and shortcuts if existent
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"

# Plugins
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
else
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
fi
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]; then
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
else
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null 
fi

# Prompt
autoload -Uz vcs_info colors && colors
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' 
    fi
}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}[%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%}]"
PROMPT=' %{$fg[red]%}❯${vcs_info_msg_0_}%  '
 
# Fzf history
function hst() {
	if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
		history | tac | cut -c 8- | fzf | tr -d '\n' | wl-copy
	else
		history | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c
	fi
}

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"
