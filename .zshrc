setopt autocd               # change directory just by typing its name
setopt promptsubst          # enable command substitution in prompt
setopt share_history        # Share history among all sessions
setopt notify               # report the status of background jobs immediately
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch            # hide error message if there is no match for the pattern
setopt numericglobsort      # sort filenames numerically when it makes sense
#setopt correct             # auto correct mistakes


# configure key keybindings
#bindkey -e                                        # emacs key bindings
#bindkey ' ' magic-space                           # do history expansion on space
#bindkey '^[[3~' delete-char                       # delete
#bindkey '^U' backward-kill-line                   # ctrl + U
#bindkey '^[[3;5~' kill-word                       # ctrl + Supr
#bindkey '^[[1;5C' forward-word                    # ctrl + ->
#bindkey '^[[1;5D' backward-word                   # ctrl + <-
#bindkey '^[[5~' beginning-of-buffer-or-history    # page up
#bindkey '^[[6~' end-of-buffer-or-history          # page down
#bindkey '^[[H' beginning-of-line                  # home
#bindkey '^[[F' end-of-line                        # end
#bindkey '^[[Z' undo                               # shift + tab undo last action


# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'


WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word


# enable Completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' select-prompt %Sscrolling active: current selection at %p%s
zstyle ':completion:*' list-prompt %Sat %p: hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' rehash true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# History configurations
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_verify            # show command with history expansion to user before running it


# Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/zsh_command_not_found


# Prompt

autoload -Uz vcs_info colors && colors
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT=' %B%{$fg[red]%}(%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M%{$fg[white]%}  %{$fg[red]%})%{$fg[white]%} ${vcs_info_msg_0_} ~%  '




# Alias

alias l='exa -al' 
alias ls='ls --color=auto'
alias lsa='ls -al | lolcat' 

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias typer='~/.cargo/bin/ttyper'
alias update='sudo apt update'
alias upgrade='sudo apt -y full-upgrade'
alias clean='sudo apt -y autoremove; sudo apt clean'
alias fix='sudo dpkg --configure -a; sudo apt --fix-broken install -y; sudo apt install -f; sudo apt update --fix-missing'
alias bashrc='sudo vim ~/.bashrc'
alias zshrc='sudo vim ~/.zshrc'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias h='history'
alias free='free -h'
alias df='df -h'
alias fixburp='export _JAVA_AWT_WM_NONREPARENTING=1 && wmname LG3D'


# Snap alias

alias not='notion-snap'
alias senable='sudo systemctl enable --now snapd apparmor'
alias sinstall='sudo snap install lsd discord mari0 cointop slack'
alias sfix='sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/*'

export PATH=$PATH:/snap/bin


# Pacman alias

alias mirror='sudo reflector -f 30 --latest 30 --number 10 --verbose > /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay > /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score > /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age > /etc/pacman.d/mirrorlist'

