#!/bin/bash


sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
#sudo apt install apt-transport-https

#
sudo apt -y full-upgrade

sudo apt install -y font-viewer fonts-jetbrains-mono fonts-symbola fonts-indic \
fonts-material-design-icons-iconfont fonts-materialdesignicons-webfont
sudo apt install -y preload htop lolcat

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt install -y cargo && cargo install ttyper
sudo apt install -y neovim fzf translate-shell \
ranger zathura \
tree ncdu slock \
feh sxiv ffmpeg \
cmatrix fortune \
synaptic stacer stress \
speedtest-cli trash-cli youtube-dl transmission-cli \
spotify-client \
bpytop nvtop neofetch \
android-tools-fastboot scrcpy android-tools-adb \
obs-studio audacity gimp blender kdeconnect \
telegram-desktop deluge virt-manager putty tor torbrowser-launcher snapd


sudo apt purge -y --auto-remove onboard xterm cherrytree

sudo cp -r ~/.icons/MineKali/cursors /usr/share/icons/Adwaita 
sudo rm -rf /usr/share/icons/Flat-Remix-Blue-Dark/* 
sudo rm -rf /usr/share/themes/Kali-Dark/*
sudo cp -r ~/.themes/* /usr/share/themes
sudo cp -r ~/.icons/MineKali /usr/share/icons
sudo cp -r ~/.themes/Fluent-round-dark/* /usr/share/themes/Kali-Dark
sudo cp -r ~/.icons/MineKali/* /usr/share/icons/Flat-Remix-Blue-Dark

#
cd ~/Documents && mkdir Python JavaScript C

sudo apt install -y docker.io
sudo systemctl disable docker.service
sudo systemctl enable fstrim.timer

sudo apt install -y nvidia-driver nvidia-cuda-toolkit

wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
chmod +x vscode.deb && sudo dpkg -i vscode.deb 

git clone https://github.com/abba23/spotify-adblock.git && cd spotify-adblock
make && sudo make install
touch ~/.local/share/applications/spotify-adblock.desktop
chown $USER spotify-adblock.desktop
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
# Generated by NetworkManager
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
# nvim/lua/plugins/configs/bufferline  

wget -O PacketTracer.deb https://archive.org/download/packet-tracer-800-build-212-mac-notarized/PacketTracer_800_amd64_build212_final.deb
chmod +x PacketTracer.deb && sudo dpkg -i PacketTracer.deb


########## BSPWM ##########


sudo apt install -y bspwm polybar rofi kitty slock alsa-utils playerctl nitrogen lxappearance scrot  xfce4-terminal libxft-dev libharfbuzz-bin librust-harfbuzz-rs-dev libxinerama-dev

git clone https://github.com/dracula/xfce4-terminal.git ~/.local/share/xfce4/terminal/colorschemes
git clone https://github.com/sayanta01/dotfiles ~/Desktop/dotfiles/
cp -r ~/Desktop/dotfiles/{.zshrc,.vimrc,.fonts,.xinitrc} ~/
cp -r ~/Desktop/dotfiles/.config/* ~/.config
chmod +x ~/.config/bspwm/bspwmrc ~/.config/dunst/dunstrc ~/.config/polybar/launch.sh ~/.config/scripts/* 

cd ~/Desktop/dotfiles/.config/st
sudo make clean install && bash STcolor

cd ~/.config/dmenu
sudo make clean install




# sudo vim /etc/hosts                       Blk sites
# sudo systemd-analyze                      critical-chain      
# deb https://mirrors.ocf.berkeley.edu/kali kali-rolling main contrib non-free
