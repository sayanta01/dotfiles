# cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"

# setopt extendedglob         # enables advanced pattern matching in globbing
# setopt notify               # report the status of background jobs immediately

# Keybindings
bindkey -e                                        # emacs mode
# bindkey -s '^r' 'hst^M'
bindkey ' ' magic-space                           # history expansion on space
bindkey '^[[3;5~' kill-word                       # backward del [A-d]
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl -> [A-f]
bindkey '^[[1;5D' backward-word                   # ctrl <- [A-b]
bindkey '^[[Z' undo                               # Shift Tab undo last action

# Hide EOL sign ('%')
# PROMPT_EOL_MARK="" 

# Time format
TIMEFMT=$'\ntotal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Completion 
autoload -Uz compinit && compinit -d $HOME/.cache/zcompdump
zmodload zsh/complist
_comp_options+=(globdots)  # include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# History
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.local/share/history"
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_ignore_all_dups    # ignore duplicated commands

# Load aliases & shortcuts
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
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' 
    fi
}
precmd() { vcs_info }
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}[%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%}]"
PROMPT=' %{$fg[red]%}❯${vcs_info_msg_0_}%  '
# PROMPT=' %1~ %F{red}❯ %f'
 
# Fzf history
function hst() {
  if [ -n "$WAYLAND_DISPLAY" ]; then
    history 0 | tac | cut -c 8- | fzf | tr -d '\n' | wl-copy
  else
    history 0 | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c
  fi
}

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.local/share/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.local/share/sdkman/bin/sdkman-init.sh"
