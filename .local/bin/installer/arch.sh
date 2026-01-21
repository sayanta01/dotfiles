#!/bin/sh

# https://dither8.xyz/guide/arch-postinstall
for dots in .bashrc .profile .xprofile .zshrc .zprofile; do
  cp -r "$HOME/dotfiles/$dots" "$HOME"
done
mkdir -p "$HOME/.local/bin/"
cp -r ~/dotfiles/.config/* ~/.config/ && cp -r ~/dotfiles/.local/bin/* ~/.local/bin && cp -r ~/dotfiles/.local/share/* ~/.local/share

printf "Fonts? [Y/n]: "
read -r choice
case "$choice" in [nN]) ;; *)
  [ -d "/usr/share/fonts/nerd-fonts" ] && sudo rm -rf "/usr/share/fonts/nerd-fonts"
  sudo mkdir -p "/usr/share/fonts/nerd-fonts"
  curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
  sudo tar -xvf JetBrainsMono.tar.xz -C /usr/share/fonts/nerd-fonts && fc-cache -fv
  ;;
esac

printf "Main pkgs? [y/N]: "
read -r choice
if [ "$choice" = "y" ]; then
  sudo pacman -S --noconfirm --needed noto-fonts noto-fonts-emoji \
    kitty neovim fzf btop \
    zsh zsh-autosuggestions zsh-syntax-highlighting \
    bspwm sxhkd polybar rofi slock dunst \
    xcape polkit-gnome gnome-keyring \
    mpv nsxiv maim xwallpaper \
    pipewire-pulse pavucontrol playerctl \
    lf mediainfo ffmpegthumbnailer file-roller \
    gvfs-mtp thunar-archive-plugin exfatprogs \
    zathura-pdf-mupdf jq \
    xdg-utils xdg-user-dirs xclip
fi

# Tools
# git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
# paru -S --needed xsct
systemctl --user --now enable pipewire pipewire-pulse
git clone --depth=1 https://github.com/sayanta01/dmenu ~/.config/dmenu && cd ~/.config/dmenu && sudo make clean install
git clone --depth=1 https://github.com/sayanta01/nvim ~/.config/nvim
# ntfs-3g
# sudo systemctl disable docker

# Teletype font
# sudo setfont /usr/share/kbd/consolefonts/ter-124b.psf.gz
# sudo su root -c "echo -e FONT='ter-124b' > /etc/vconsole.conf"

# KVM
# https://share.google/XPZvqpBTiGmDcSDEu
# printf "KVM? [y/N]: "
# read -r choice
# if [ "$choice" = "y" ]; then
# 	sudo pacman -S --noconfirm --needed qemu-full virt-manager \
# 		dnsmasq bridge-utils openbsd-netcat guestfs-tools libvirt
# 	sudo virsh net-start default
# 	sudo virsh net-autostart default
# 	sudo ln -s /etc/runit/sv/libvirtd /run/runit/service && sudo touch /run/runit/service/libvirtd/down
# 	sudo ln -s /etc/runit/sv/virtlogd /run/runit/service && sudo touch /run/runit/service/virtlogd/down
# 	sudo sed -i '/^#unix_sock_group = "libvirt"/s/^#//' /etc/libvirt/libvirtd.conf
# 	sudo usermod -aG libvirt "$USER"
# 	sudo sed -i '/^#unix_sock_rw_perms = "0770"/s/^#//' /etc/libvirt/libvirtd.conf
# fi
