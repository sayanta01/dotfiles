#!/bin/zsh

export PATH="$PATH:$(du "$HOME/.local/bin/scripts" | cut -f2 | paste -sd ':')"
export LESSHISTFILE="-"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export VIDEO="mpv"
export IMAGE="sxiv"
export OPENER="xdg-open"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"

export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"


export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export QT_QPA_PLATFORMTHEME="qt5ct"
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export LESS="-N"
