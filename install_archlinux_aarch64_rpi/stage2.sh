pacman -S cage nano flatpak networkmanager


useradd -m kiosk

echo "Set the root password:"
passwd root

systemctl enable --now NetworkManager.service

echo "Everything is done! Reboot to boot into the new system and to perform additional setup."