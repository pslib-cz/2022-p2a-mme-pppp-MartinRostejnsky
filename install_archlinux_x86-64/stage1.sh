#!/bin/bash
set -xe
IFS=$'\n'
devices=($(lsblk -d -o NAME -rpn))
unset IFS


PS3="Pick a device to partition: "
select device in ${devices[@]}; do 
	DEVICE="$device"
	break
done

echo "Partitioning $DEVICE..."

parted --script "$DEVICE" -- mklabel gpt \
        mkpart primary fat32 0 512MiB \
        mkpart primary linux-swap 512MiB 1536MiB \
        mkpart primary ext4 1536MiB 100% set 1 esp on | less

echo "Made following partitions:"
parted --script "$DEVICE" -- "print"

IFS=$'\n'
partitions=($(lsblk "$DEVICE" -o NAME -rpn | tail -n+2))
unset IFS

mkfs.fat -F 32 "${partitions[0]}"
mkswap "${partitions[1]}"
mkfs.ext4 "${partitions[2]}"


mount "${partitions[2]}" /mnt
mkdir -p /mnt/boot
mount "${partitions[0]}" /mnt/boot
swapon "${partitions[1]}"

echo "Opening up an editor for you to edit the mirror list"
read
nano /etc/pacman.d/mirrorlist

MICROCODE=""
cpu_vendor=$(lscpu | grep -E "^Vendor ID:" | cut -d" " -f3- | tr -d "[:space:]")

case $cpu_vendor in
	AuthenticAMD)
		MICROCODE="amd-ucode"
		;;
	GenuineIntel)
		MICROCODE="intel-ucode"
		;;
	*)
		MICROCODE=""
		;;
esac

if [[ $MICROCODE ]]; then
	echo "Additionally installing $MICROCODE for microcode updates"
fi

#TODO: It might be worth getting something like a session manager into play here
pacstrap -K /mnt base linux linux-firmware cage nano flatpak networkmanager xorg-xwayland efibootmgr grub $MICROCODE

genfstab -U /mnt >> /mnt/etc/fstab

mkdir -p /mnt/installer

mount --bind "$(pwd)" /mnt/installer

arch-chroot /mnt /installer/stage2.sh
