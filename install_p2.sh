#!/bin/bash

pacman -S grub xorg networkmanager firefox xfce4 network-manager-applet lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings git neofetch
systemctl enable NetworkManager
systemctl enable lightdm.service
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo "Set password for the root user"
passwd
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "archbox" >> /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   archbox.localdomain archbox" >> /etc/hosts
ln -sf /usr/share/zoneinfo/Europe/Athens /etc/localtime
exit
