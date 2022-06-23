setopt autocd               # change directory just by typing its name
#setopt correct              # auto correct mistakes
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch            # hide error message if there is no match for the pattern
setopt notify               # report the status of background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt

# configure key keybindings
bindkey -e                                        # emacs key bindings
bindkey -s '^o' 'ranger^M'
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
bindkey '^K' kill-line

#bindkey "^A" vi-beginning-of-line
#bindkey '^E' end-of-line
#bindkey '^H' backward-kill-word                   # forward del word 
#bindkey '^K' kill-line
#bindkey '^B' backward-char
#bindkey '^F' forward-char
#bindkey '^N' down-line-or-history
#bindkey '^P' up-line-or-history
#bindkey '^O' forward-word
#bindkey '^J' backward-word
#bindkey '^I' expand-or-complete
#bindkey '^T' transpose-chars
#bindkey '^R' history-incremental-search-backward
#bindkey '^D' exit_zsh

# hide EOL sign ('%')
#PROMPT_EOL_MARK="" 

# configure Time format
TIMEFMT=$'\ntotal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# enable Completion features
autoload -Uz compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' list-prompt %S TAB for more
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# History configurations
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups    # ignore duplicated commands history list
setopt hist_verify             # show command with history expansion to user before running it


# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null 
source /etc/zsh_command_not_found 2>/dev/null
source ~/.config/zsh/zsh-fzf-history-search.zsh 2>/dev/null

# Arch PATH
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null

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
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

PROMPT=' %b%{$fg[red]%}(%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M%{$fg[white]%}  %{$fg[red]%})%{$fg[white]%} ${vcs_info_msg_0_} ~%  '

#PATHs
#export TERM="xterm-256color"                      
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.config/scripts
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d6d6d6,bg:#030303,hl:#5f87af
 --color=fg+:#e8e8e8,bg+:#141414,hl+:#3bceff
 --color=info:#afaf87,prompt:#d7005f,pointer:#b061ff
 --color=marker:#87ff00,spinner:#972eff,header:#87afaf'
 

# Alias
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


alias l='exa -l'
alias ll='exa -al'
alias l.='exa -a | egrep "^\."'
alias ls='ls --color=auto'
alias la='lsd'
alias lsn='exa | wc -l'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'
alias tag='git tag'
alias newtag='git tag -a'

alias update='sudo apt update'
alias install='sudo apt install'
alias upgrade='sudo apt -y full-upgrade'
alias clean='sudo apt -y autoremove; sudo apt clean'
alias fix='sudo dpkg --configure -a; sudo apt --fix-broken install -y; sudo apt install -f; sudo apt update --fix-missing'

alias rr='curl https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias up="uptime -p | sed -e 's/up //g' -e 's/ days/d/g' -e 's/ day/d/g' -e 's/ hours/h/g' -e 's/ hour/h/g' -e 's/ minutes/m/g' -e 's/ minute/m/g' -e 's/, / /g'"

alias free='free -h'
alias df='df -h'
alias shred='shred -uvzn3'
alias iv='sxiv'

alias typer='ttyper'
alias mp='mousepad'
alias vim='nvim'
alias ytdl='yt-dlp -f 137+140'
alias fixburp='export _JAVA_AWT_WM_NONREPARENTING=1 && wmname LG3D'

alias sysctlist='systemctl list-units --type=service'
alias sysctlfail='systemctl --failed'
alias jctl='sudo journalctl -p 3 -xb'
alias cleanjctl='sudo journalctl --vacuum-time=2weeks'

# Arch
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # refresh pkglist & update standard pkgs
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and yay pkgs
alias yaysua='yay -Sua --noconfirm'              # update only yay pkgs

alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias cleanaur='sudo pacman -Sc --noconfirm'
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock


# Snap alias
#alias senable='sudo systemctl enable --now snapd apparmor'
#alias sinstall='sudo snap install mari0 cointop'
#alias sfix='sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/*'
#export PATH=$PATH:/snap/bin
# xprop - wm classname
