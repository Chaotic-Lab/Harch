#!/bin/bash
#HarchPost 
# ---------------------------------------------------------------
# Author    : Chaotic_Guru                                       |
# Github    : https://github.com/ChaoticHackingNetwork           |
# Discord   : https://discord.gg/nv445EX (ChaoticHackingNetwork) |
# ---------------------------------------------------------------

#Set root password
echo -e "\033[33;36mPlease set ROOT password!!!\033[0m"
passwd

#Create a new user
read -p "Enter a new Username: " username
echo "Welcome to your new system $username!"
useradd -mg users -G wheel,power,storage,uucp,network -s /bin/bash $username
echo "Please set your password now!"
passwd $username
perl -i -pe 's/# (%wheel ALL=\(ALL\) ALL)/$1/' /etc/sudoers

# Set locale to en_US.UTF-8 UTF-8
sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
export LANG=en_US.UTF-8

#Set time & clock
timedatectl set-ntp true
hwclock --systohc --utc

#Change localtime *Note this script has it set too Chicago*
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime #CHANGE THIS TO YOUR TIMEZONE

#Install some needed packages
pacman -Syyu
pacman -S vim nano dhcpcd netctl dialog wpa_supplicant mlocate neofetch net-tools dnsutils ntfs-3g sudo man-db usbutils pulseaudio alsa-utils --noconfirm

#Install MATE Desktop env and LightDM after reboot
pacman -S xorg-server xorg-xrandr mate mate-extra sddm xorg-xinit --noconfirm
systemctl enable sddm

#Install bootloader
dmesg | grep -q "EFI v" 
if [ $0 -eq 0 ]
then
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=ARCH_UEFI --recheck
grub-mkconfig -o /boot/grub/grub.cfg
else
grub-install --target=i386-pc /dev/sda --recheck
grub-mkconfig -o /boot/grub/grub.cfg

#Install BlackArch Mirror
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh
pacman -Syyu --noconfirm

#Successfully Installed
neofetch
echo "Harch has been succesfully installed on your system"
echo "Hack the planet $username"
echo "A reboot should now take place"
echo "Run the following commands to reboot properly!"
echo
echo "  [1]: exit "
echo "  [2]: umount -a "
echo "  [3]: telinit 6 "

exit