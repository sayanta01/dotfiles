#!/bin/zsh

export PATH="$PATH:$(du "$HOME/.local/bin/scripts" | cut -f2 | paste -sd ':')"
export LESSHISTFILE="-"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export _JAVA_AWT_WM_NONREPARENTING=1
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export QT_QPA_PLATFORMTHEME=qt5ct
export LESS="-N"
