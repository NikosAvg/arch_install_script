#!/bin/bash

pacman -S grub xorg xf86-video-intel sddm plasma konsole dolphin ark kwrite kcalc spectacle krunner partitionmanager alsa-utils bluez bluez-utils firefox qbittorrent audacious wget screen git neofetch
systemctl enable NetworkManager
systemctl enable sddm.service
systemctl enable bluetooth.service
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "Set password for the root user"
passwd
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archbox" >> /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Athens /etc/localtime
exit
