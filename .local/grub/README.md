#!/bin/bash

#ARCH
sudo cp -r catppuccin-mocha-grub-theme /usr/share/grub/themes/
/etc/default/grub >> GRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"
sudo grub-mkconfig -o /boot/grub/grub.cfg
 
 
#KALI 
sudo cp -r catppuccin-mocha-grub-theme /boot/grub/themes
/etc/default/grub >> GRUB_THEME="/boot/grub/themes/catppuccin-mocha-grub-theme/theme.txt"
sudo grub-mkconfig -o /boot/grub/grub.cfg


#/etc/default/grub (modify 1920x1080 to your screen resolution) 
# GRUB_GFXMODE=1920x1080

#Grub is not detecting all systems (dual-boot)
# GRUB_DISABLE_OS_PROBER=false

#Grub isn't detecting the theme
# GRUB_TERMINAL_OUTPUT="console"