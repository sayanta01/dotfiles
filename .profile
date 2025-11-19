#!/bin/sh
# shellcheck disable=SC2155

# Add all dirs in `~/.local/bin` to $PATH
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"

# Defaults
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-stable"

# ~/ Clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

export QT_QPA_PLATFORMTHEME="qt5ct"
export _JAVA_AWT_WM_NONREPARENTING="1"
