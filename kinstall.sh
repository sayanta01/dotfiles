#!/bin/bash

sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
#
yes '
' | sudo apt full-upgrade

curl https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt install -y cargo && cargo install ttyper
sudo apt install -y neovim fzf ranger \
zathura ripgrep bat fd-find nodejs yarnpkg \
ncdu slock imwheel fonts-jetbrains-mono \
feh sxiv ffmpeg aptitude \
fortune font-viewer \
synaptic stacer stress \
speedtest-cli trash-cli yt-dlp transmission-cli \
bpytop neofetch preload htop \
android-tools-fastboot scrcpy android-tools-adb nvtop spotify-client \
obs-studio audacity gimp blender kdeconnect translate-shell \
telegram-desktop deluge tor torbrowser-launcher snapd docker.io

sudo apt purge -y --auto-remove onboard xterm cherrytree

#
sudo apt install -y virt-manager qemu
sudo usermod -aG libvirt bot
sudo usermod -aG kvm bot

sudo systemctl enable fstrim.timer

sudo apt install -y nvidia-driver nvidia-cuda-toolkit

wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O ~/Documents/vscode.deb
cd ~/Documents && chmod +x vscode.deb && sudo dpkg -i vscode.deb 

git clone https://github.com/abba23/spotify-adblock.git && cd spotify-adblock && make && sudo make install
touch ~/.local/share/applications/spotify-adblock.desktop
cat > spotify-adblock.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Spotify (adblock)
GenericName=Music Player
Icon=spotify-client
TryExec=spotify
Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
EOF
   
sudo cat <<EOF | sudo tee /etc/resolv.conf 
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

axel -n 20 -o PacketTracer.deb https://archive.org/download/packet-tracer-800-build-212-mac-notarized/PacketTracer_800_amd64_build212_final.deb
chmod +x PacketTracer.deb && sudo dpkg -i PacketTracer.deb




########## BSPWM ##########


sudo apt install -y bspwm polybar rofi kitty slock alsa-utils playerctl lxappearance maim libxft-dev libharfbuzz-bin librust-harfbuzz-rs-dev libxinerama-dev

cp -r ~/Desktop/dotfiles/{.zshrc,.fonts,.xinitrc,.imwheelrc,.icons,.themes} ~/
cp -r ~/Desktop/dotfiles/.config/* ~/.config
chmod +x ~/.config/bspwm/bspwmrc ~/.config/dunst/dunstrc ~/.config/polybar/launch.sh ~/.config/scripts/* 

cd ~/.config/dmenu
sudo make clean install

sudo cp -r ~/.icons/MineKali/cursors /usr/share/icons/Adwaita 
sudo cp -r ~/.icons/MineKali /usr/share/icons
sudo cp -r ~/.themes/* /usr/share/themes

sudo rm -rf /usr/share/icons/Flat-Remix-Blue-Dark/* 
sudo cp -r ~/.icons/MineKali/* /usr/share/icons/Flat-Remix-Blue-Dark
sudo rm -rf /usr/share/themes/Kali-Dark/*
sudo cp -r ~/.themes/Fluent-round-dark/* /usr/share/themes/Kali-Dark


# sudo vim /etc/hosts                       blk sites
# sudo systemd-analyze                      critical-chain      
# deb https://mirrors.ocf.berkeley.edu/kali kali-rolling main contrib non-free
