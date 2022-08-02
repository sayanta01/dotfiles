#!/bin/bash

sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

yes '
' | sudo apt full-upgrade

########## BSPWM ##########
sudo apt update
sudo apt install -y bspwm polybar rofi kitty dunst lxappearance maim slock playerctl libxft-dev alsa-utils libharfbuzz-bin librust-harfbuzz-rs-dev libxinerama-dev
pip install pywal

cp -r ~/Desktop/dotfiles/{.zshrc,.fonts,.xinitrc,.imwheelrc,.xprofile,.zprofile,.tmux.conf,.icons,.themes} ~/
cp -r ~/Desktop/dotfiles/.local/bin/* ~/.local/bin && cp -r ~/Desktop/dotfiles/.local/share/* ~/.local/share
cp -r ~/Desktop/dotfiles/.config/. ~/.config
chmod +x ~/.config/bspwm/bspwmrc ~/.config/polybar/launch.sh ~/.local/bin/scripts/* ~/.config/sxiv/exec/key-handler

git clone https://github.com/LukeSmithxyz/st.git ~/Downloads/st
cd ~/Downloads/st && sudo make clean install

git clone https://github.com/LukeSmithxyz/dmenu.git ~/Downloads/dmenu
cd ~/Downloads/dmenu && sudo make clean install

sudo cp -r ~/.icons/PapirusFlatMix/cursors /usr/share/icons/Adwaita 
sudo cp -r ~/.icons/PapirusFlatMix /usr/share/icons

git clone https://github.com/dracula/gtk.git ~/.themes/Dracula
sudo cp -r ~/.themes/* /usr/share/themes

sudo rm -rf /usr/share/icons/Flat-Remix-Blue-Dark/* 
sudo cp -r ~/.icons/PapirusFlatMix/* /usr/share/icons/Flat-Remix-Blue-Dark

curl https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install -y cargo fonts-jetbrains-mono \
ffmpeg mpv sxiv ncdu exa fzf stress \
ranger zathura fd-find htop  ripgrep \
slock imwheel xclip xwallpaper gpg \
fortune exiftool preload aptitude \
bpytop neofetch font-viewer stacer \
speedtest-cli transmission-cli transmission-daemon trash-cli yt-dlp cava \
android-tools-fastboot scrcpy android-tools-adb nvtop \
obs-studio audacity gimp inkscape \
nvidia-driver nvidia-cuda-toolkit \
telegram-desktop kdeconnect spotify-client  

#apt-transport-https translate-shell docker.io synaptic
cargo install ttyper lsd bat

sudo apt purge -y --auto-remove onboard xterm cherrytree \
xfce4-notifyd xfce4-clipman-plugin

#
sudo apt install -y virt-manager qemu
sudo usermod -aG libvirt bot
sudo usermod -aG kvm bot

sudo systemctl enable fstrim.timer

wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O ~/Downloads/vscode.deb
wget 'https://discord.com/api/download?platform=linux&format=deb' -O ~/Downloads/discord.deb
cd ~/Downloads && chmod +x vscode.deb discord.deb && sudo dpkg -i vscode.deb discord.deb

git clone https://github.com/abba23/spotify-adblock.git && cd spotify-adblock && make && sudo make install
axel -n 20 -o PacketTracer.deb https://archive.org/download/packet-tracer-800-build-212-mac-notarized/PacketTracer_800_amd64_build212_final.deb
chmod +x PacketTracer.deb && sudo dpkg -i PacketTracer.deb

sudo cat <<EOF | sudo tee /etc/resolv.conf 
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

#xdg-mime query filetype (file)  #check filetype
#xdg-mime query default (file/type)  #check default app of filetype
xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/jpg
xdg-mime default sxiv.desktop image/png
xdg-mime default inkscape.desktop image/svg+xml
xdg-mime default org.pwmt.zathura.desktop application/pdf

GRUB_CMDLINE_LINUX="rhgb quiet mitigations=off"

sudo setfont /usr/share/kbd/consolefonts/ter-c16b.psf.gz
sudo su root -c "echo -e FONT='Uni2-TerminusBold20x10.psf.gz' >> /etc/default/console-setup"

# sudo vim /etc/hosts                       blk sites
# sudo systemd-analyze                      critical-chain      
# deb https://mirrors.ocf.berkeley.edu/kali kali-rolling main contrib non-free
