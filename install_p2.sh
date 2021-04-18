#!/bin/bash

pacman -S networkmanager grub xorg-server xorg rxvt-unicode plasma plasma-wayland-session kde-applications firefox 
systemctl enable NetworkManager
systemctl enable sddm.service
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "Set password for the root user"
passwd
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archbox" >> /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Athens /etc/localtime
exit
