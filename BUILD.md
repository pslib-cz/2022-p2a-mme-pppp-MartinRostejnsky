# Sestavení referenční aplikace kiosku
Tento dokument je návodem, jak sestavit referenční aplikaci kiosku.

## Požadavky
- linuxový počítač s nainstalovaným `flatpak` a `flatpak-builder`
- dostatek diskového prostoru na sestavení aplikace (asi 10 GB volného místa)

Pro prvotní sestavení bude také nutné doinstalovat některé základní balíčky pro sestavení aplikace:

```bash
# nativní platforma (ve většině případů x86-64)
sudo ./setup.sh

# sestavení pro ARM64 - hodí se pro instalaci na Raspberry Pi
sudo env IS_AARCH64=1 ./setup.sh
```

Vše nutné se poté nainstaluje.

## Sestavení
1. Nejdříve sestavte základní aplikaci:

    ```bash
    # nativní platforma (ve většině případů x86-64)
    ./build-main.sh

    # sestavení pro ARM64 - hodí se pro instalaci na Raspberry Pi
    IS_AARCH64=1 ./build-main.sh
    ```

1. Poté z ní vytvořte instalační balíček:

    ```bash
    # nativní platforma (ve většině případů x86-64)
    ./bundle-main.sh

    # sestavení pro ARM64 - hodí se pro instalaci na Raspberry Pi
    IS_AARCH64=1 ./bundle-main.sh
    ```

1. Poté ji nainstalujte – jinak vám nepůjde sestavit GUI:

    ```bash
    # nativní platforma (ve většině případů x86-64)
    sudo flatpak install kiosk.flatpak

    # sestavení pro ARM64 - hodí se pro instalaci na Raspberry Pi
    sudo flatpak install kiosk-aarch64.flatpak 
    ```

1. Podobnými kroky sestavte a nainstalujte GUI:

    ```bash
    # nativní platforma (ve většině případů x86-64)
    ./build-gui.sh
    ./bundle-gui.sh
    sudo flatpak install kiosk-gui.flatpak

    # sestavení pro ARM64 - hodí se pro instalaci na Raspberry Pi
    IS_AARCH64=1 ./build-gui.sh
    IS_AARCH64=1 ./bundle-gui.sh
    sudo flatpak install kiosk-gui-aarch64.flatpak
    ```

1. Následně lze aplikaci spustit:
    ```bash
    flatpak run cz.tttie.KiOS
    ```

> **Note**  
> Hlavní aplikace a GUI jsou od sebe logicky odděleny. Lze tedy v případě změn sestavit jen GUI, případně sestavit jen hlavní aplikaci atd.
