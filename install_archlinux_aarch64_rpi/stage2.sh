#!/bin/bash
pacman-key --init
pacman-key --populate archlinuxarm

# Update the system and then install additional packages
pacman -Syu
pacman -S cage flatpak networkmanager # nano is bundled in the default Arch ARM install


useradd -m kiosk

echo "Set the root password:"
passwd root

systemctl enable --now NetworkManager.service

echo "Everything is done! Reboot to boot into the new system and to perform additional setup."