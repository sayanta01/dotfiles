https://wiki.archlinux.org/title/Zram

# Cloudflare DNS

sudo cat <<EOF | sudo tee /etc/resolv.conf
nameserver 1.1.1.3
nameserver 1.0.0.3
EOF

# Laptop 💻

sudo pacman -S --noconfirm brightnessctl
git clone https://github.com/AdnanHodzic/auto-cpufreq.git && cd auto-cpufreq && sudo ./auto-cpufreq-installer

# Enable tap-to-click

[ ! -f /etc/X11/xorg.conf.d/40-libinput.conf ] && printf 'Section "InputClass"
Identifier "libinput touchpad catchall"
MatchIsTouchpad "on"
MatchDevicePath "/dev/input/event\*"
Driver "libinput"
Option "Tapping" "on"
Option "NaturalScrolling" "true"
EndSection' >/etc/X11/xorg.conf.d/40-libinput.conf

# Hyprland

https://wearewaylandnow.com
chrome://flags - ozone > wayland

sudo pacman -S hyprland waybar xdg-desktop-portal-hyprland \
 grim slurp swww qt5-wayland qt6-wayland wl-clipboard
