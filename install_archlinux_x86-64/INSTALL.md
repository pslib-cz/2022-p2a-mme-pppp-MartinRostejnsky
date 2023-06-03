# Installing the Base Kiosk OS on x86-64 Platforms
This document is a guide on how to install the base kiosk operating system on x86-64 platforms.

## Hardware Requirements
The kiosk should run on any reasonably performant hardware, including integrated GPUs. If your CPU does not have any, or you prefer to use a dedicated GPU instead, we **strongly do not recommend** to use GPUs by NVIDIA due to the requirement of additional software and limited support of the Wayland protocol. Regarding other requirements:
- 32 GB of disk space
- an internet connection

## Preparation for Installation
1. Clone the entire kiosk repository.
1. Create the installation archive:

    ```bash
    ./create-install-x86-64-archive.sh
    ```
1. The resulting archive (`install_archlinux_x86-64.tar.gz`) can be copied over to another USB drive, or you can use a simple web server.
1. Download the [Arch Linux](https://archlinux.org/download/) installation ISO file, and create an installation medium. To create one, [Rufus](https://rufus.ie/) can be used under Windows. 

## Instalace
1. Copy or download the installation archive, and extract it.

    ```bash
    # copying from external media
    cp /path/to/install_archlinux_x86-64.tar.gz ~
    # downloading from a web server
    curl -O http://website.local/install_archlinux_x86-64.tar.gz

    tar xzf install_archlinux_x86-64.tar.gz
    ```

    > **Note**  
    > If you're using Wi-Fi to connect, you might need to do some more steps beforehand. See [the Arch Linux installation guide](https://wiki.archlinux.org/title/Installation_guide#Connect_to_the_internet).
1. Switch to the installation directory, and launch `stage1.sh`:

    ```bash
    cd ./install_archlinux_x86-64
    ./stage1.sh
    ```
1. The script should do everything automatically and it will ask you for the password for the `root` user afterwards.
1. Reboot into the new system:

    ```bash
    reboot
    ```

1. Log in as the `root` user, install required applications (e.g. the SSH server, if you need one), and configure the system. For setting up the internet connection, the `nmtui` command can be used. (the credentials from the installation environment are not carried over)

    The commands to launch when the kiosk starts can be set in `/var/lib/kiosk/launch_kiosk.sh`. In the default setting, a reference application with the identifier of `cz.tttie.KiOS` will be launched using Flatpak. 
1. Launch the automatic startup of the Weston compositor: 

    ```bash
    systemctl enable weston.service
    ```

    Restart the computer afterwards:

    ```bash
    reboot
    ```