#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
hwclock --systohc

cp /etc/locale.gen /etc/locale.gen.orig
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=cz" > /etc/vconsole.conf

echo "kiosk" > /etc/hostname

useradd -m kiosk

echo "Set the root password:"
passwd root

echo "Installing GRUB:"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub2/grub.cfg

systemctl enable NetworkManager.service

echo "Everything is done! Reboot to boot into your new system and to perform additional setup."
