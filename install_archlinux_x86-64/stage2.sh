#!/bin/bash
set -e

ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
hwclock --systohc

locale-gen

useradd -m kiosk

mkdir -p /home/kiosk/.config

cp /installer/weston.ini /home/kiosk/.config


echo "Set the root password:"
passwd root

echo "Installing GRUB:"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager.service

echo "Everything is done! Reboot to boot into your new system and to perform additional setup."
echo "Once ready, enable the weston service:"
echo "    systemctl enable weston.service"
