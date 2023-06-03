# Instalace základového OS kiosku pro platformu x86-64
Tento dokument je návodem k instalaci základového operačního systému kiosku na platformu x86-64.

## Hardwarové požadavky
Kiosek by měl fungovat pod jakýmkoli důstojně výkonným hardwarem, včetně integrovaných grafických jader. Nemá-li váš procesor integrovaná grafická jádra nebo chcete raději použít dedikovanou GPU, tak **silně nedoporučujeme** pro tuto sestavu používat GPU od výrobce NVIDIA kvůli nutnosti instalovat dodatečné ovladače a omezené podpory protokolu Wayland. Co se týče ostatních požadavků:
- 32 GB diskového prostoru
- internetové připojení

## Příprava k instalaci
1. Naklonujte celý repozitář kiosku.
1. Vytvořte instalační archiv:

    ```bash
    ./create-install-x86-64-archive.sh
    ```
1. Vytvořený archiv (`install_archlinux_x86-64.tar.gz`) můžete přesunout na další USB disk, případně můžete použít pro přenos jednoduchý webový server.
1. Stáhněte instalační ISO soubor [Arch Linuxu](https://archlinux.org/download/) a vytvořte instalační médium. K vytvoření instalačního média může na Windows posloužit [Rufus](https://rufus.ie/). 

## Instalace
1. Překopírujte nebo stáhněte instalační archiv a extrahujte jej.

    ```bash
    # kopírování z externího média
    cp /path/to/install_archlinux_x86-64.tar.gz ~
    # stažení z webového serveru
    curl -O http://website.local/install_archlinux_x86-64.tar.gz

    tar xzf install_archlinux_x86-64.tar.gz
    ```

    > **Note**  
    > V případě, že používáte k připojení k internetu Wi-Fi, možná bude nutné vykonat další kroky, viz. [instalační návod Arch Linuxu](https://wiki.archlinux.org/title/Installation_guide#Connect_to_the_internet)
1. Přejděte do instalačního adresáře a spusťte skript `stage1.sh`:

    ```bash
    cd ./install_archlinux_x86-64
    ./stage1.sh
    ```
1. Skript by měl vše obstarat automaticky a následně se Vás zeptá na nové heslo k uživateli `root`.
1. Restartujte do nového systému:

    ```bash
    reboot
    ```

1. Přihlašte se jako uživatel `root` a doinstalujte potřebné aplikace (např. potřebujete-li, SSH server) a dokonfigurujte systém. K nastavení síťového přístupu vám poslouží příkaz `nmtui`. (údaje z instalačního prostředí se nepřenášejí)

    Příkazy, které se spustí při zapnutí kiosku, lze nastavit v souboru `/var/lib/kiosk/launch_kiosk.sh`. Ve výchozím nastavení spustí referenční aplikaci s identifikátorem `cz.tttie.KiOS` pomocí Flatpaku. 
1. Zapněte automatické spuštění kompozitoru Weston:

    ```bash
    systemctl enable weston.service
    ```

    Poté počítač restartujte:

    ```bash
    reboot
    ```