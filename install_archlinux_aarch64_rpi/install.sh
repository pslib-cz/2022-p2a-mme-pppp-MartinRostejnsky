#!/bin/bash
set -e

HERE=$(pwd)

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

partprobe "$DEVICE"

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
    # This will be replaced back automatically when installing the linux-rpi kernel
    sed -i 's/mmcblk0/mmcblk1/g' /tmp/mnt/root/etc/fstab
fi

mkdir -p /tmp/mnt/root/installer

cp $HERE/stage2.sh /tmp/mnt/root/installer
cp -L $HERE/weston.ini /tmp/mnt/root/installer
chmod +x /tmp/mnt/root/installer/stage2.sh

# copy the service and the autostart script over
cp -L $HERE/weston.service /tmp/mnt/root/etc/systemd/system

mkdir -p /tmp/mnt/root/var/lib/kiosk
cp -L $HERE/launch_kiosk.sh /tmp/mnt/root/var/lib/kiosk

sync
umount /tmp/mnt/{boot,root}

rm -rf /tmp/mnt

# We're telling the user to continue from the Pi because the setup is probably
# going to be done from a x86_64 computer and we cannot run aarch64 binaries there
echo "Done! Move the SD card to your Pi, log in as root"
echo "(password is root), and run /installer/stage2.sh to install the rest."
echo ""
echo "Keep in mind that you will probably need an external display for the"
echo "second installation stage. You will be able to use the official touchscreen"
echo "afterwards."