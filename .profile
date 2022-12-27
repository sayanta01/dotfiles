#!/bin/zsh

export MANPAGER='nvim +Man!'
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
 --color=fg:#d6d6d6,bg:#030303,hl:#5f87af
 --color=fg+:#e8e8e8,bg+:#313244,hl+:#3bceff
 --color=info:#afaf87,prompt:#d7005f,pointer:#b061ff
 --color=marker:#87ff00,spinner:#972eff,header:#87afaf"

# Paths
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')" 
export PATH="$PATH:$HOME/.local/share/cargo/bin"

# Default programs
export EDITOR="nvim"
export TERMINAL="st"
# export BROWSER="google-chrome"

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
export HISTFILE="$XDG_DATA_HOME/bash/history"    # run this - mkdir -p "$XDG_DATA_HOME"/bash 
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"     # to use this comment .zshrc wget alias
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# Uncmnt when needed
# export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"  # run this - mkdir -p "$XDG_DATA_HOME"/wineprefixes
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
# export KODI_DATA="$XDG_DATA_HOME/kodi"
# export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
# export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"                  # run this - gpg2 --homedir "$XDG_DATA_HOME/gnupg"

export LESSHISTFILE="-"  # Disable files
export LESS="-R"

export QT_QPA_PLATFORMTHEME="gtk2"    # have QT use gtk2 theme.
export QT_QPA_PLATFORMTHEME="qt5ct"   
export _JAVA_AWT_WM_NONREPARENTING=1 && wmname LG3D
# export AWT_TOOLKIT="MToolkit wmname LG3D"  # fix Java applications do not work in DWM
# export QT_QPA_PLATFORM=wayland      # needed for wayland
