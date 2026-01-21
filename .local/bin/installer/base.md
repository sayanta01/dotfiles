- Disable Secure Boot

# Connect to the internet

iwctl
device list
station <adpater-name> get-networks
station <adpater-name> connect <network-name>

# Set TTY Font

pacman -Sy terminus-font
setfont ter-124b

# Disk Partitions

cfdisk /dev/sda
sda1 boot 1G # Type efi system
sda2 root # Rest of the space
Write & Quit

# Format Partitions

mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2

# Mount Partitions

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot/efi

# Update the system clock

timedatectl set-ntp true

# Base System

pacstrap -K /mnt base base-devel linux-lts linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot

arch-chroot /mnt

# Time

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

# Localization

nvim /etc/locale.gen # Uncomment en_US.UTF-8 UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Network Configuration

echo <myhostname> > /etc/hostname
nvim /etc/hosts
127.0.0.1    localhost
::1          localhost
127.0.1.1    myhostname.localdomain    myhostname

pacman -S networkmanager
systemctl enable NetworkManager

# Add User

passwd # Set the root password
useradd -m -G wheel <user>
passwd <user>
nvim /etc/sudoers # Uncomment %wheel ALL=(ALL:ALL) ALL

# Bootloader

pacman -S grub os-prober efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
exit & reboot

# Essential Pkgs

ly intel-ucode

# Tips & Tricks

<!-- nvim /etc/makepkg.conf `MAKEFLAGS="-j$(nproc)` Faster compilation -->

<!-- https://wiki.artixlinux.org/Main/Repositories#Arch_repositories -->
<!-- sudo pacman -S artix-archlinux-support [ Artix ] -->
<!-- sudo pacman-key --populate archlinux -->
<!-- sudo pacman -Syu -->
<!-- dbus-uuidgen | sudo tee /var/lib/dbus/machine-id [ Artix ] -->
<!-- sudo pacman -S --noconfirm dbus-runit && sudo ln -s /etc/runit/sv/dbus /run/runit/service -->
