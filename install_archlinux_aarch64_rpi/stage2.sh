#!/bin/bash
set -e

pacman-key --init
pacman-key --populate archlinuxarm

# Update the system and then install additional packages
pacman -Syu
# pacman will complain about a conflict between the mainline and RPi Fndn.'s
# kernel here. The RPi kernel is needed for DSI (official touchscreen) support
pacman -S linux-rpi weston flatpak networkmanager # nano is bundled in the default Arch ARM install

# delete the default alarm user
userdel alarm
useradd -m kiosk

mkdir -p /home/kiosk/.config

cp /installer/weston.ini /home/kiosk/.config

echo "Set the root password:"
passwd root

systemctl enable --now NetworkManager.service

echo "Everything is done! Reboot to boot into the new system and to perform additional setup."
echo "Once ready, enable the weston service:"
echo "    systemctl enable weston.service"