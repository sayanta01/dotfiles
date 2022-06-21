#!/bin/bash

sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

yes '
' | sudo apt full-upgrade

curl https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt install -y cargo && cargo install ttyper lsd bat
sudo apt install -y fzf ranger gpg \
zathura ripgrep exa fd-find nodejs \ #yarnpkg fonts-jetbrains-mono
ncdu slock imwheel \
xwallpaper sxiv ffmpeg aptitude \
fortune font-viewer exiftool inkscape \
synaptic stacer stress \
speedtest-cli trash-cli yt-dlp transmission-cli \
bpytop neofetch preload htop \
android-tools-fastboot scrcpy android-tools-adb nvtop spotify-client \
obs-studio audacity gimp blender kdeconnect translate-shell \
telegram-desktop deluge tor torbrowser-launcher docker.io  #snapd apt-transport-https
 
sudo apt purge -y --auto-remove onboard xterm cherrytree
 
# Build Neovim
sudo apt install -y ninja-build gettext libtool libtool-bin cmake pkg-config doxygen
git clone https://github.com/neovim/neovim.git ~/.config/neovim && cd ~/.config/neovim
make -j4 && sudo make install

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
pip3 install pynvim black flake8
cargo install stylua
sudo apt install -y ueberzug eslint ccls
sudo npm i -g prettier shfmt astyle live-server

#
sudo apt install -y virt-manager qemu
sudo usermod -aG libvirt bot
sudo usermod -aG kvm bot

sudo systemctl enable fstrim.timer

sudo apt install -y nvidia-driver nvidia-cuda-toolkit

wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O ~/Downloads/vscode.deb
wget 'https://discord.com/api/download?platform=linux&format=deb' -O ~/Downloads/discord.deb
cd ~/Downloads && chmod +x vscode.deb discord.deb && sudo dpkg -i vscode.deb discord.deb

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

sudo cat <<EOF | sudo tee -a /etc/default/console-setup
FONT='Uni2-TerminusBold20x10.psf.gz'
EOF

axel -n 20 -o PacketTracer.deb https://archive.org/download/packet-tracer-800-build-212-mac-notarized/PacketTracer_800_amd64_build212_final.deb
chmod +x PacketTracer.deb && sudo dpkg -i PacketTracer.deb


########## BSPWM ##########
sudo apt install -y bspwm polybar rofi kitty slock alsa-utils playerctl lxappearance maim libxft-dev libharfbuzz-bin librust-harfbuzz-rs-dev libxinerama-dev
pip3 install pywal

cp -r ~/Desktop/dotfiles/{.zshrc,.fonts,.xinitrc,.imwheelrc,.icons,.themes} ~/
cp -r ~/Desktop/dotfiles/.config/* ~/.config
chmod +x ~/.config/bspwm/bspwmrc ~/.config/polybar/launch.sh ~/.config/scripts/* ~/.config/sxiv/exec/key-handler

cd ~/.config/dmenu && sudo make clean install

sudo cp -r ~/.icons/PapirusFlatMix/cursors /usr/share/icons/Adwaita 
sudo cp -r ~/.icons/PapirusFlatMix /usr/share/icons

git clone https://github.com/dracula/gtk.git ~/.themes/Dracula
sudo cp -r ~/.themes/* /usr/share/themes

sudo rm -rf /usr/share/icons/Flat-Remix-Blue-Dark/* 
sudo cp -r ~/.icons/PapirusFlatMix/* /usr/share/icons/Flat-Remix-Blue-Dark

sudo rm -rf /usr/share/themes/Kali-Dark/*
sudo cp -r ~/.themes/Fluent-round-dark/* /usr/share/themes/Kali-Dark

#xdg-mime query filetype (file)  #check filetype
#xdg-mime query default (file/type)  #check default app of filetype
xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/jpg
xdg-mime default sxiv.desktop image/png
xdg-mime default inkscape.desktop image/svg+xml
xdg-mime default org.pwmt.zathura.desktop application/pdf


# sudo vim /etc/hosts                       blk sites
# sudo systemd-analyze                      critical-chain      
# deb https://mirrors.ocf.berkeley.edu/kali kali-rolling main contrib non-free
