bindkey -e                      # emacs mode
bindkey '^[[3;5~' kill-word     # backward del [A-d]
bindkey '^[[1;5C' forward-word  # [A-f]
bindkey '^[[1;5D' backward-word # [A-b]
bindkey '^[[Z' undo             # [S-Tab]

TIMEFMT=$'\ntotal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

autoload -Uz compinit
compinit -C -d $HOME/.cache/zcompdump
zmodload zsh/complist
_comp_options+=(globdots) # include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.local/share/history"
setopt hist_ignore_space
setopt hist_ignore_all_dups

[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
[ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null || source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null || source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

autoload -U colors && colors	
PROMPT=' %1~ %F{red}❯ %f'
 
function hst() {
  if [ -n "$WAYLAND_DISPLAY" ]; then
    history 0 | tac | cut -c 8- | fzf | tr -d '\n' | wl-copy
  else
    history 0 | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c
  fi
}
