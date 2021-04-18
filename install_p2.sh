#!/bin/bash

pacman -S grub plasma-desktop sddm plasma-wayland-session firefox plasma-nm plasma-pa dolphin sddm-kcm konsole kdeplasma-addons powerdevil
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
