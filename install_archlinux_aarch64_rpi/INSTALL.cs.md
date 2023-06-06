# Instalace základového OS kiosku na Raspberry Pi 3B+/4  
Tento dokument je návodem k instalaci základového operačního systému kiosku na jednodeskové počítače Raspberry Pi.  
>**Note**  
> Pokud chcete využít náš [návod k sestavení HW](../assemble_rpi_hw/ASSEMBLY.cs.md), silně doporučujeme si ho přečíst s předstihem.  

## Hardwarové požadavky
- linuxový (virtuální) počítač
- microSD karta minimálně o velikosti 32 GB
- Raspberry Pi 3B+ / Raspberry Pi 4
- chcete-li jej používat, oficiální dotykový displej
- (ideálně drátové) připojení k síti
- externí monitor (pro spuštění 2. etapy instalace - oficiální dotykový displej **nefunguje** s výchozím jádrem)

## Instalace
1. Přejděte do instalačního adresáře a spusťte instalační příkaz:
    - **Raspberry Pi 3B+**:

        ```bash
        sudo ./install.sh
        ```
    - **Raspberry Pi 4**:

        ```bash
        sudo env IS_RPI4=1 ./install.sh
        ```
1. Vyberte úložiště, na které chcete základový OS instalovat. K nalezení správného disku vám může posloužit příkaz `sudo fdisk -l` v druhém okně terminálu.
    > **Warning**  
    > Výběrové menu uvádí **všechny dostupné disky na počítači včetně systémového disku**. Zkontrolujte si, zda jste uvedli správný disk, jelikož vybraný disk bude **formátován** a **data na disku budou ztracena**. **Neručíme za případnou ztrátu dat!**
1. Po ukončení instalačního skriptu vložte SD kartu do vašeho Raspberry Pi, připojte externí monitor, myš, klávesnici a zdroj napájení.
1. Přihlašte se jako uživatel `root` (heslo je `root`)
1. Spusťte druhou etapu instalace.

    ```bash
    /installer/stage2.sh
    ```

    > **Note**  
    > K provedení je potřeba síťový přístup, ideálně přes Ethernet. Chcete-li použít Wi-Fi, použijte před spuštěním instalace následující příkaz pro její nastavení:
    > ```bash
    > wifi-menu
    > # skryje heslo při zadávání
    > wifi-menu -o
    > ```

1. Restartujte vaše Raspberry Pi:

    ```bash
    reboot
    ```
1. Přihlašte se jako uživatel `root`, doinstalujte potřebné aplikace (např. potřebujete-li, SSH server) a dokonfigurujte systém.

    Příkazy, které se spustí při zapnutí kiosku, lze nastavit v souboru `/var/lib/kiosk/launch_kiosk.sh`. Ve výchozím nastavení spustí referenční aplikaci s identifikátorem `cz.tttie.KiOS` pomocí Flatpaku. 

1. Zapněte automatické spuštění kompozitoru Weston:

    ```bash
    systemctl enable weston.service
    ```

    Poté počítač restartujte:

    ```bash
    reboot
    ```