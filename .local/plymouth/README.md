#!/bin/sh

########## KALI ##########
sudo cp -r lone /usr/share/plymouth/themes/
sudo plymouth-set-default-theme -R lone


########## ARCH ##########
#sudo vim /etc/mkinitcpio.conf  (in HOOKS add plymouth after udev)
#sudo mkinitcpio -p linux  (Regenerate image)

#sudo vim /etc/default/grub  (in GRUB_CMDLINE_LINUX_DEFATULT add splash rd.udev.log_priority=3 vt.gloabl cursor_default=0
#sudo grub-mkconfig -o /boot/grub/grub.cfg 

sudo plymouth-set-default-theme -l  
sudo plymouth-set-default-theme -R lone

sudo systemctl disable lightdm
sudo systemctl enable lightdm-plymouth.service

#sudo vim /etc/plymouth/plymouthd.conf  (ShowDelay=0)
#sudo mkinitcpio -p linux  (Regenerate config file for theme)
