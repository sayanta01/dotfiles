#!/bin/zsh

# export MANPAGER='nvim +Man!'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d6d6d6,bg:#030303,hl:#5f87af
 --color=fg+:#e8e8e8,bg+:#313244,hl+:#3bceff
 --color=info:#afaf87,prompt:#d7005f,pointer:#b061ff
 --color=marker:#87ff00,spinner:#972eff,header:#87afaf'

# Paths
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH=$PATH:$HOME/.local/share/cargo/bin

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export TERM="xterm-256color"
# export VIDEO="mpv"
# export IMAGE="sxiv"
# export BROWSER="google-chrome"
# export OPENER="xdg-open"
# export PAGER="less"

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Fixing paths
export GOPATH="$XDG_DATA_HOME/go"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export HISTFILE="$XDG_DATA_HOME/history"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Uncmnt when needed 
# export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
# export KODI_DATA="$XDG_DATA_HOME/kodi"
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"  # run this - mkdir -p "$XDG_DATA_HOME"/wineprefixes
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"                  # run this - gpg2 --homedir "$XDG_DATA_HOME/gnupg"
# export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"    # to use this comment .zshrc wget alias

export LESSHISTFILE="-"  # Disable files
# export LESS="-R"

# Xorg file
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
# export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
# export XSERVERRC="$XDG_CONFIG_HOME/x11/xserverrc"
# export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

export QT_QPA_PLATFORMTHEME="gtk2"    # have QT use gtk2 theme.
export AWT_TOOLKIT="MToolkit wmname LG3D"  # May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	     # Fix for Java applications in WM
# export QT_QPA_PLATFORM=wayland      # needed for wayland
