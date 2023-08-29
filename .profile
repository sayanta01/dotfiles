#!/bin/zsh

export MANPAGER='nvim +Man!'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
 --color=fg:#d6d6d6,bg:#121212,hl:#5f87af
 --color=fg+:#e8e8e8,bg+:#262626,hl+:#3bceff
 --color=info:#afaf87,prompt:#d7005f,pointer:#b061ff
 --color=marker:#87ff00,spinner:#972eff,header:#87afaf"

# Paths
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')" 
export PATH="$PATH:$HOME/.local/share/cargo/bin"

# Default programs
export EDITOR="nvim"
export TERMINAL="kitty"
export READER="zathura"
export BROWSER="google-chrome-stable"

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# Fixing paths
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export DENO_DIR="$XDG_CONFIG_HOME/deno"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"          # run this - gpg2 --homedir "$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"     # to use this comment .zshrc wget alias
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
# $npm config edit
# prefix="${XDG_DATA_HOME}/npm"
# cache="${XDG_CACHE_HOME}/npm"
# init-module="${XDG_CONFIG_HOME}/npm/config/npm-init.js"

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android" # seems not working
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"
export UNISON="$XDG_DATA_HOME/unison"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/history"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"    # run this - mkdir -p "$XDG_DATA_HOME"/wineprefixes

export LESSHISTFILE="-"    # disable files
export QT_QPA_PLATFORMTHEME="gtk2"    # have QT use gtk2 theme
export QT_QPA_PLATFORMTHEME="qt5ct"   
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT="MToolkit wmname LG3D"  # fix Java applications

# if [ -f "$HOME/.local/share/cargo/env" ]; then
# 	source "$HOME/.local/share/cargo/env"
# else
# 	source "$HOME/.cargo/env"
# fi
