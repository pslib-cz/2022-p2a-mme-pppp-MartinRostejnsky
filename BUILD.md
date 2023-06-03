# Building the Reference Kiosk Application
This document is a guide on how to build the reference kiosk application.

## Requirements
- A Linux machine with `flatpak`, and `flatpak-builder` installed
- if building for a different architecture (if building the package for Raspberry Pi on your own PC), `qemu-user-static` has to be installed
- enough free space on the disk to build the application (about 10 GB of free space)

For the first build, additional packages are needed to build the application:

```bash
# native platform (x86-64 in most cases)
sudo ./setup.sh

# ARM64 builds - useful for Raspberry Pi deployments
sudo env IS_AARCH64=1 ./setup.sh
```

Everything required to build will then be installed.

## Building
1. Build the main application:

    ```bash
    # native platform (x86-64 in most cases)
    ./build-main.sh

    # ARM64 builds - useful for Raspberry Pi deployments
    IS_AARCH64=1 ./build-main.sh
    ```

1. Create its installation package:

    ```bash
    # native platform (x86-64 in most cases)
    ./bundle-main.sh

    # ARM64 builds - useful for Raspberry Pi deployments
    IS_AARCH64=1 ./bundle-main.sh
    ```

1. Install it afterwards - else you won't be able to build the GUI:

    ```bash
    # native platform (x86-64 in most cases)
    sudo flatpak install kiosk.flatpak

    # ARM64 builds - useful for Raspberry Pi deployments
    sudo flatpak install kiosk-aarch64.flatpak 
    ```
    > **Note**  
    > The installation package is portable and can be transferred between machines of the same architecture.

1. Using similar steps, build and install the GUI:

    ```bash
    # native platform (x86-64 in most cases)
    ./build-gui.sh
    ./bundle-gui.sh
    sudo flatpak install kiosk-gui.flatpak

    # ARM64 builds - useful for Raspberry Pi deployments
    IS_AARCH64=1 ./build-gui.sh
    IS_AARCH64=1 ./bundle-gui.sh
    sudo flatpak install kiosk-gui-aarch64.flatpak
    ```

1. Transfer `kiosk.flatpak`, and `kiosk-gui.flatpak` (`kiosk-aarch64.flatpak`, and `kiosk-gui-aarch64.flatpak` respectively) to the target machine and install them:

    ```bash
    # native platform (x86-64 in most cases)
    sudo flatpak install kiosk.flatpak
    sudo flatpak install kiosk-gui.flatpak

    # ARM64 builds - useful for Raspberry Pi deployments
    sudo flatpak install kiosk-aarch64.flatpak
    sudo flatpak install kiosk-gui-aarch64.flatpak
    ```

1. The application can be launched on the target machine afterwards:
    ```bash
    flatpak run cz.tttie.KiOS
    ```

> **Note**  
> The main application and the GUI are logically separated. It is therefore possible to build only the GUI, or build only the main application if changed.
