#!/bin/sh

if [ -f "$HOME/.xprofile" ]; then
	. "$HOME/.xprofile"
else
	. "$HOME/.xprofile"
fi

if [ -f "$HOME/.profile" ]; then
	. "$HOME/.profile"
else
	. "$HOME/.profile"
fi


fav=startxfce4

case "$1" in
	bspwm) bspwm ;;
	xfce) startxfce4 ;;
	dwm) ssh-agent dwm ;;
	*) exec $fav ;;
esac


#/usr/share/xsession    -- session path
