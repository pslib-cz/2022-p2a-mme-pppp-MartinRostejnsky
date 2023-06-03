# Installing the Base Kiosk OS on Raspberry Pi 3B+/4
This document is a guide on how to install the base kiosk operating system on Raspberry Pi single-board computers.

## Hardware Requirements
- Linux computer or a virtual machine
- microSD card with a size of at least 32 GB
- Raspberry Pi 3B+ / Raspberry Pi 4
- if you want to use it, the official touch screen
- internet connection (ideally a wired one)
- an external monitor (to launch the 2nd stage of installation - the official touch screen **does not work** with the default kernel)

## Installation
1. Go to the installation directory, and launch the installation command:
    - **Raspberry Pi 3B+**:

        ```bash
        sudo ./install.sh
        ```
    - **Raspberry Pi 4**:

        ```bash
        sudo env IS_RPI4=1 ./install.sh
        ```
1. Pick the device you would like to install the base OS on. To find the correct disk, you can use the `sudo fdisk -l` command in a second terminal window.
    > **Warning**  
    > The selection menu lists **all available disks on the computer, including the system one**. Please, double check that you have chosen the correct disk, as the selected disk will be **formatted** and **any data on the disk will be lost**. **We disclaim any responsibility for possible data loss!**
1. After the installation script finishes, insert the SD card into your Raspberry Pi, connect an external monitor, mouse, keyboard, and power source.
1. Log in as the `root` user (the password is `root`)
1. Launch the second stage of installation.

    ```bash
    /installer/stage2.sh
    ```

    > **Note**  
    > An internet connection is needed for this, ideally via Ethernet. If you'd like to use Wi-Fi, use the following command before launching the installation to set it up:
    > ```bash
    > wifi-menu
    > # hide password input
    > wifi-menu -o
    > ```

1. Reboot your Raspberry Pi:

    ```bash
    reboot
    ```
1. Log in as the `root` user, install required applications (e.g. an SSH server, if you need one) and configure the system.

    The commands to launch when the kiosk starts can be set in `/var/lib/kiosk/launch_kiosk.sh`. In the default setting, a reference application with the identifier of `cz.tttie.KiOS` will be launched using Flatpak. 

1. Launch the automatic startup of the Weston compositor: 

    ```bash
    systemctl enable weston.service
    ```

    Restart the computer afterwards:

    ```bash
    reboot
    ```