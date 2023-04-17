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
export READER="zathura"
# export BROWSER="google-chrome-stable"

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Fixing paths
export GOPATH="$XDG_DATA_HOME/go"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
# export DENO_DIR="$XDG_CONFIG_HOME/deno"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"

export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export HISTFILE="$XDG_DATA_HOME/bash/history"    # run this - mkdir -p "$XDG_DATA_HOME"/bash 
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"     # to use this comment .zshrc wget alias
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"

# Uncmnt when needed
# export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"  # run this - mkdir -p "$XDG_DATA_HOME"/wineprefixes
# export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
# export KODI_DATA="$XDG_DATA_HOME/kodi"
# export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"                  # run this - gpg2 --homedir "$XDG_DATA_HOME/gnupg"

export LESSHISTFILE="-"  # Disable files
# export LESS="-R"

export QT_QPA_PLATFORMTHEME="gtk2"    # have QT use gtk2 theme.
export QT_QPA_PLATFORMTHEME="qt5ct"   
export _JAVA_AWT_WM_NONREPARENTING=1 && wmname LG3D
# export AWT_TOOLKIT="MToolkit wmname LG3D"  # fix Java applications do not work in DWM
# export QT_QPA_PLATFORM=wayland      # needed for wayland
