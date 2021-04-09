# Arch install script

Two small scripts to automate my arch installation process.

# The first script **install.sh**

1. Checks for internet connection.
2. Syncronizes the system clock.
3. Shows availiable disks for partitioning in a selection menu.
4. Partitions the selected disk into a 128 Mb boot partition and the rest to a root partition.
5. Makes ext4 filesystems.
6. Mounts them to /mnt/boot and /mnt respectively.
7. Installs base base-devel linux linux-firmware vim git.
8. Generates fstab
9. Copies a pre-made locale.gen and the second script to the installed system.
10. And arch-chroots into the system to run the second script.

# The second script **install_p2.sh**

1. Installs grub and networkmanager.
2. Sets password for the root user.
3. Generates locale.
4. Creates the machines hostname.
5. And sets timezone.
