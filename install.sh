#!/bin/sh

# check internet connection.
x=`ping -q -c 1 -W 1 gnu.org >&/dev/null; echo $?`
if [ $x -eq 0 ]; then
	echo "Online."
	echo "Syncronizing clock..."
	timedatectl set-ntp true
	echo "Availiable disk to partition:"
	readarray -t lines < <(lsblk --nodeps -no name,size,type,mountpoint | grep disk)
	for l in "${lines[@]}"; do
		echo $l
	done
	choice=$(dialog --clear \
			  --backtitle "Disks" \
			  --title "disks" \
			  --menu "Choose the correct disk to partition:" \
			  15 40 4 \
			  "${options[@]}" \
			  2>&1 >/dev/tty)
	clear
	
		

else
	echo "You are not connected to the internet."
	echo "Please connect and run the script again."
	exit 0
fi
