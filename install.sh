#!/bin/bash

# check internet connection.
x=$(ping -q -c 1 -W 1 gnu.org >/dev/null; echo $?)
if [ "$x" -eq 0 ]; then
	echo "Online."
	echo "Syncronizing clock..."
	timedatectl set-ntp true
	echo "Availiable disk to partition:"
	readarray -t lines < <(lsblk --nodeps -no name,size,type,mountpoint | grep disk)
	PS3='Please enter your choise: '
	select opt in "${lines[@]}"
	do
		drive=${opt%%" "*}
		echo "Creating partitions on $drive"
		echo "creating boot partition..."
		printf "o\nn\np\n\n\n+128M\na\nw" | fdisk /dev/"$drive" >/dev/null
		echo "creating system partition..."
		printf "n\np\n\n\n\nw" | fdisk /dev/"$drive" >/dev/null
		#Make filesystems
		mkfs.ext4 /dev/"$drive"1 >/dev/null
		mkfs.ext4 /dev/"$drive"2 >/dev/null
		#Mount them
		mount /dev/"$drive"2 /mnt
		mkdir /mnt/boot
		mount /dev/"$drive"1 /mnt/boot
		echo "Installing"
		pacstrap /mnt base base-devel linux linux-firmware vim git
		genfstab -U /mnt >> /mnt/etc/fstab
		chmod +x install_p2.sh
		cp locale.gen /mnt/etc/
		cp install_p2.sh /mnt
		arch-chroot /mnt ./install_p2.sh
		umount -R /mnt
		echo "Arch is installed on your system!"
		echo "Reboot!"
		break
	done		
	
		

else
	echo "You are not connected to the internet."
	echo "Please connect and run the script again."
	exit 0
fi
