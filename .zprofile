#!/bin/zsh

# export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH=$PATH:$HOME/.local/share/cargo/bin
# export MANPAGER='nvim +Man!'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d6d6d6,bg:#030303,hl:#5f87af
 --color=fg+:#e8e8e8,bg+:#313244,hl+:#3bceff
 --color=info:#afaf87,prompt:#d7005f,pointer:#b061ff
 --color=marker:#87ff00,spinner:#972eff,header:#87afaf'

export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export TERM="xterm-256color"
#export BROWSER="google-chrome"
#export VIDEO="mpv"
#export IMAGE="sxiv"
#export OPENER="xdg-open"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"

export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
# export KODI_DATA="$XDG_DATA_HOME/kodi"
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

#export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# export LESSHISTFILE="$XDG_CONFIG_HOME/less/history"
# export LESSKEY="$XDG_CONFIG_HOME/less/keys"
export LESSHISTFILE="-"
export LESS="-R"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
#export XSERVERRC="$XDG_CONFIG_HOME/x11/xserverrc"
#export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
#export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
#export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# export QT_QPA_PLATFORMTHEME="gtk2"  # have QT use gtk2 theme.
export QT_QPA_PLATFORMTHEME="qt5ct"
#export QT_QPA_PLATFORM=wayland       # needed for wayland
export AWT_TOOLKIT="MToolkit wmname LG3D"  # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	     # Fix for Java applications in WM
