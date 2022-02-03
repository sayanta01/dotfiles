#!/bin/bash


sudo timedatectl set-local-rtc 1 --adjust-system-clock

sudo apt install apt-transport-https

#
sudo apt -y full-upgrade

sudo apt install -y font-viewer fonts-jetbrains-mono fonts-symbola
sudo apt install -y fonts-material-design-icons-iconfont fonts-materialdesignicons-webfont
sudo apt install -y preload htop lolcat

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install -y cargo && cargo install ttyper
sudo apt install -y spotify-client moc
sudo apt install -y neovim
sudo apt install -y fzf
sudo apt install -y aptitude
sudo apt install -y telegram-desktop virtualbox putty tor torbrowser-launcher
sudo apt install -y ranger zathura
sudo apt install -y bpytop nvtop neofetch
sudo apt install -y tree ncdu
sudo apt install -y feh sxiv ffmpeg jp2a
sudo apt install -y cmatrix fortune toilet
sudo apt install -y synaptic stacer stress
sudo apt install -y speedtest-cli trash-cli youtube-dl transmission-cli
sudo apt install -y android-tools-fastboot scrcpy android-tools-adb
sudo apt install -y obs-studio audacity gimp kdeconnect blender
sudo apt install -y snapd


sudo apt purge -y --auto-remove onboard xterm cherrytree

cd /usr/share/themes && sudo rm -rf Windows-10 HighContrast Adwaita Adwaita-dark

cd /usr/share/icons && sudo rm -rf Windows-10-Icons Tango oxygen HighContrast

cd /usr/share/icons && sudo rm -rf Flat-Remix-Blue-Dark && sudo mkdir Flat-Remix-Blue-Dark

cd ~/.themes && sudo cp -r Fluent-round-dark WhiteSur-dark Colloid-dark /usr/share/themes

cd ~/.icons/MineKali && sudo cp -r cursors /usr/share/icons/Adwaita

cd ~/.icons && sudo cp -r MineKali /usr/share/icons

cd ~/.icons/MineKali && sudo cp -r actions apps cursors emblems index.theme panel status animations categories devices icon-theme.cache mimetypes places /usr/share/icons/Flat-Remix-Blue-Dark

#
cd ~/Documents && mkdir Python JavaScript C

sudo apt install -y docker.io
sudo systemctl disable docker.service

sudo apt install -y nvidia-driver nvidia-cuda-toolkit

wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo chmod +x vscode.deb && sudo dpkg -i vscode.deb 

git clone https://github.com/abba23/spotify-adblock.git
cd spotify-adblock
make
sudo make install
cd ~/.local/share/applications
touch spotify-adblock.desktop
sudo chown $USER spotify-adblock.desktop
sudo cat > spotify-adblock.desktop <<EOF
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

git clone https://github.com/sayanta01/nvim.git ~/.config/nvim
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
   
wget -O PacketTracer.deb https://archive.org/download/packet-tracer-800-build-212-mac-notarized/PacketTracer_800_amd64_build212_final.deb
sudo chmod +x PacketTracer.deb && sudo dpkg -i PacketTracer.deb




# MY-ALIAS
alias lsa='ls -al | lolcat' 
alias typer='~/.cargo/bin/ttyper'
alias update='sudo apt update'
alias upgrade='sudo apt -y full-upgrade'
alias h='history'
alias clean='sudo apt -y autoremove; sudo apt clean'
alias fix='sudo dpkg --configure -a; sudo apt --fix-broken install -y; sudo apt install -f; sudo apt --fix-missing update; sudo apt update --fix-missing'
alias bashrc='sudo vim ~/.bashrc'
alias zshrc='sudo vim ~/.zshrc'

#
alias not='notion-snap'
alias senable='sudo systemctl enable --now snapd apparmor && bash && source && sources'
alias sinstall='sudo snap install lsd && sudo snap install discord && sudo snap install slack --classic && sudo snap install mari0 && sudo snap install notion-snap && sudo snap install cointop'
alias sfix='sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/*; sudo timedatectl set-local-rtc 1 --adjust-system-clock'

export PATH=$PATH:/snap/bin



                 
echo -e "                ███╗   ██╗ ██████╗  ██████╗ ██████╗  ██████╗ ████████╗ "                                                                                                               
echo -e "                ████╗  ██║██╔═████╗██╔═══██╗██╔══██╗██╔═══██╗╚══██╔══╝ "                                                                                                               
echo -e "                ██╔██╗ ██║██║██╔██║██║   ██║██████╔╝██║   ██║   ██║    "                                                                                                                 
echo -e "                ██║╚██╗██║████╔╝██║██║   ██║██╔══██╗██║   ██║   ██║    "                                                                                                               
echo -e "                ██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝╚██████╔╝   ██║    "                                                                                                               
echo -e "                ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝  ╚═════╝    ╚═╝    "                                                                                          



# sudo vim /etc/hosts                       Blk sites
# sudo vim /etc/resolv.conf                 Ch DNS
# sudo systemd-analyze, critical-chain      



