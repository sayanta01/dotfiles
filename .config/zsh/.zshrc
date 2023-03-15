cowsay "$(shuf -n 1 ~/.local/share/vocab/words.txt)"
eval "$(zoxide init zsh)" 

# setopt correct              # auto correct mistakes
# setopt autocd               # change directory just by typing its name
# setopt interactivecomments  # allow comments in interactive mode
setopt extendedglob
setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch            # hide error message if there is no match for the pattern
setopt notify               # report the status of background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt

# Configure keybindings
bindkey -e                                        # emacs key bindings
bindkey -s '^o' 'lfub^M'
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

# Hide EOL sign ('%')
#PROMPT_EOL_MARK="" 

# Time format
TIMEFMT=$'\ntotal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Enable completion 
# autoload -Uz compinit && compinit  # ( default path )
# Enable completion  (+ separate path for .zcompdump file)
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zcompdump"
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' list-prompt %S TAB for more
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# History configurations
HISTSIZE=2000
SAVEHIST=2000
HISTFILE="$XDG_DATA_HOME/history"
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups    # ignore duplicated commands history list
setopt hist_verify             # show command with history expansion to user before running it

# Plugins
# Kali PATH
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null 
#source /etc/zsh_command_not_found 2>/dev/null

# source ~/.config/zsh/tty-colors

# Arch PATH
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null

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

PROMPT=' %b%{$fg[red]%}❯${vcs_info_msg_0_}%  '
#PROMPT=' %b%{$fg[red]%}(%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M%{$fg[white]%}  %{$fg[red]%})%{$fg[white]%} ${vcs_info_msg_0_} ~%  '
# %b  %{$fg[red]%}(  %{$fg[yellow]%}%n  %{$fg[green]%}@  %{$fg[magenta]%}%M   %{$fg[white]%}   %{$fg[red]%})  %{$fg[white]%}
 

#### ALIAS #### 
# Replace sudo with doas
# alias sudo='doas'

# Kali
#alias fix='sudo dpkg --configure -a; sudo apt --fix-broken install -y; sudo apt install -f; sudo apt update --fix-missing'
#alias install='sudo nala install'
#alias update='sudo nala update'
#alias remove='sudo nala purge'
#alias uplist='apt list --upgradable'
#alias clean='sudo apt -y autoremove; sudo apt clean'

# Arch
alias install='sudo pacman -Sy'
alias update='sudo pacman -Syyu; echo "############### ⬆️AUR ###############"; paru -Sua'
alias remove='sudo pacman -Rns'
alias clean='sudo pacman -Rns $(pacman -Qtdq); sudo pacman -Sc --noconfirm'  # remove orphaned packages
alias unlock='sudo rm /var/lib/pacman/db.lck'   # remove pacman lock
alias installed="grep -i installed /var/log/pacman.log"

# XBPS
# alias install='sudo xbps-install -Sv'
# alias dry-i='sudo xbps-install -Sn'
# alias update='sudo xbps-install -Suv'
# alias remove='sudo xbps-remove -Rv'
# alias clean='sudo xbps-remove -o; sudo xbps-remove -O'

# Runit
alias ssh-on="sudo sv start sshd"
alias ssh-off="sudo sv stop sshd"
alias doc-on="sudo sv start docker"
alias doc-off="sudo sv stop docker"
alias vm-on="sudo sv start libvirtd virtlogd"
alias vm-off="sudo sv stop libvirtd virtlogd"

# Systemd
# alias ssh-on="sudo systemctl start sshd.service"
# alias ssh-off="sudo systemctl stop sshd.service"
# alias doc-on="sudo systemctl start docker.socket"
# alias doc-off="sudo systemctl stop docker.socket"
# alias vm-on="sudo systemctl start libvirtd.service"
# alias vm-off="sudo systemctl stop libvirtd.service"
# alias sysctlist='systemctl list-unit-files --type=service'
# alias sysctlfail='systemctl --failed'
# alias jctl='sudo journalctl -p 3 -xb'
# alias cleanjctl='sudo journalctl --vacuum-time=2weeks'

alias la='exa --icons'
alias ls='ls --color=auto'
alias lt='exa --icons --tree'
alias ll='exa --icons -lgha --group-directories-first'
alias lm='ls -t -1'
alias lsn='exa | wc -l'
alias l-="ls -l | grep -v 'd'"
alias ld="ls -l | grep -E 'd'"
alias l.='exa -a | grep -E "^\."'

alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias del='gio trash'
alias tre='trash-restore'
alias less='less -R'
alias mkdir='mkdir -pv'
alias trim="sudo fstrim -va"

alias add.='git add .'
alias addup='git add -u'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'
alias pull='git pull origin'
alias push='git push origin'

alias rr='curl https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias tb='nc termbin.com 9999'
alias cht='sh -c '\''curl cheat.sh/$1'\'' _'
alias rate='sh -c '\''curl rate.sx/$1'\'' _'
alias wttr_='sh -c '\''curl wttr.in/$1'\'' _'
alias myip='curl ifconfig.me; echo'
alias php-server='php -S 0.0.0.0:8000'
alias python-server='python -m http.server 8000'
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

alias hst="history 0 | tac | cut -c 8- | fzf | tr -d '\n' | xclip -sel c"
alias ff="fd --type f --hidden --exclude .git | fzf | xargs -r $EDITOR"
alias fonts="magick convert -list font | grep -iE 'font:.*' | fzf"
alias find_='sh -c '\''find $@ 2>&1 | grep -v "Permission denied" >&2'\'' _'
alias bigfile="du -h -x -s -- * | sort -r -h | head -20"
alias psmem='ps axch -o cmd,%mem --sort=-%mem | head'
alias pscpu='ps axch -o cmd,%cpu --sort=-%cpu | head'
alias mkgrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias ping='ping -c 7'
alias ports='netstat -tulanp'
alias copy='rsync --progress -aluvr'

alias df='df -h'
alias du='du -h'
alias free='free -h'
alias bc='bc -ql'
alias shred='shred -uvzn3'
alias bat='bat --theme OneHalfDark'
alias cat='bat --theme OneHalfDark -p'
alias pu='pushd'
alias po='popd'
alias ffmpeg='ffmpeg -hide_banner'
alias tsm='transmission-remote'
# alias wget='wget --hsts-file=/dev/null'
alias wget="wget --hsts-file='$HOME/.cache/wget-hsts'"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# alias mpv='bsp-swallow mpv'
alias iv='sxiv'
alias za='zathura'

alias vim='nvim'
alias se='sudoedit'
alias mpad='mousepad'
alias mpc='mpd 2>/dev/null; ncmpcpp'
alias ytdl-vid='yt-dlp -f bestvideo+bestaudio'
alias ytdl-aud='yt-dlp --extract-audio --audio-format m4a'

# for Arch Linux only
#alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
#alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
#alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
#alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
