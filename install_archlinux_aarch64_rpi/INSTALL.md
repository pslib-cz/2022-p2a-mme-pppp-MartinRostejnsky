# Instalace kiosku na Raspberry Pi 3B+/4
Tento dokument je návodem k instalaci kiosku na jednodeskové počítače Raspberry Pi.

## Hardwarové požadavky
- linuxový (virtuální) počítač
- microSD karta minimálně o velikosti 32 GB
- Raspberry Pi 3B+ / Raspberry Pi 4
- chcete-li jej používat, oficiální dotykový displej
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
1. Vyberte úložiště, kde je vaše SD karta. K nalezení správného disku vám může posloužit příkaz `sudo fdisk -l` v druhém okně.
    > **Warning**  
    > Výběrové menu uvádí **všechny dostupné disky na počítači**. Zkontrolujte si, zda jste uvedli správný disk, jelikož vybraný disk bude **formátován**. **Neručíme za případnou ztrátu dat!**
1. Po ukončení instalačního skriptu vložte SD kartu do vašeho Raspberry Pi, připojte externí monitor, myš, klávesnici a zdroj napájení.
1. Přihlašte se jako uživatel `root` (heslo je `root`)
1. Spusťte druhou etapu instalace. K nastavení síťového přístupu vám poslouží příkaz `nmtui`. (údaje z instalačního prostředí se nepřenášejí)

    ```bash
    /installer/stage2.sh
    ```
1. Restartujte vaše Raspberry Pi:

    ```bash
    reboot
    ```
1. Přihlašte se jako uživatel `root` a doinstalujte potřebné aplikace (např. potřebujete-li, SSH server) a dokonfigurujte systém.

    Příkazy, které se spustí při zapnutí kiosku, lze nastavit v souboru `/var/lib/kiosk/launch_kiosk.sh`. Ve výchozím nastavení spustí referenční aplikaci s identifikátorem `cz.tttie.KiOS` pomocí Flatpaku. 
1. Zapněte automatické spuštění kompozitoru Weston:
    ```bash
    systemctl enable weston.service
    ```

   Poté počítač restartujte:
    ```bash
    reboot
    ```