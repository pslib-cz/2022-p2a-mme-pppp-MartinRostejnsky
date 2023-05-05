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
        mkpart primary fat32 0 256MiB \
        mkpart primary ext4 256MiB 100% | less

echo "Made following partitions:"
parted --script "$DEVICE" -- "print"

IFS=$'\n'
partitions=($(lsblk "$DEVICE" -o NAME -rpn | tail -n+2))
unset IFS

mkfs.fat -F 32 "${partitions[0]}"
mkfs.ext4 "${partitions[1]}"

mkdir -p /tmp/mnt/boot
mkdir -p /tmp/mnt/root

mount "${partitions[0]}" /tmp/mnt/boot
mount "${partitions[1]}" /tmp/mnt/root

if [[ ! -f arch_linux_base.tar.gz ]]; then
    echo "Downloading Arch Linux base image..."
    curl -Lo arch_linux_base.tar.gz http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
fi

tar -xpf arch_linux_base.tar.gz -C /tmp/mnt/root
sync

mv /tmp/mnt/root/boot/* /tmp/mnt/boot

# Some steps can be done without having to chroot
ln -sf /usr/share/zoneinfo/Europe/Prague /tmp/mnt/root/etc/localtime

echo "LANG=en_US.UTF-8" > /tmp/mnt/root/etc/locale.conf
echo "KEYMAP=cz" > /tmp/mnt/root/etc/vconsole.conf

echo "kiosk" > /tmp/mnt/root/etc/hostname

if [[ -n $IS_RPI4 ]]; then
    # RPI4 boards use a different identifier for the SD card
    sed -i 's/mmcblk0/mmcblk1/g' /tmp/mnt/root/etc/fstab
fi

cp ./stage2.sh /tmp/mnt/root
chmod +x /tmp/mnt/root/stage2.sh

sync
umount /tmp/mnt/{boot,root}

rm -rf /tmp/mnt

echo "Done! Move the SD card to your Pi and run stage2.sh to install the rest."