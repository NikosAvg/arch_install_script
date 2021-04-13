#!/bin/bash

pacman -S networkmanager grub xfce4 xfce-goodies lightdm lightdm-webkit-greeter
systemctl enable NetworkManager
systemctl enable lightdm
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "Set password for the root user"
passwd
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archbox" >> /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Athens /etc/localtime
exit
