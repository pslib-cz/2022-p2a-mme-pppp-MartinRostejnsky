# Informační kiosek
Cílem tohoto projektu je vytvořit jednoduchý základ pro informační kiosek.

## Instalace
Instalační kroky závisí na použité platformě:
- [x86_64][install-x86_64]
- [Raspberry Pi 3B+/4][install-aarch64]

## Referenční aplikace
Referenční aplikace zobrazená uživatelům je napsána v Pythonu a QML pomocí frameworků PyQt5 a Qt Quick. Dokumentaci k těmto frameworkům lze nalézt zde:
- [PyQt][pyqt-docs]
- [Qt Quick/QML][qt-quick-docs]

Pro lokální vývoj stačí nainstalovat příslušné balíčky (instalaci balíčků pro lokální vývoj tento návod nepokrývá - pro vývoj lze použít i [flatpakovou verzi][build-instructions]). Pro ulehčení lze aplikaci spustit pomocí souboru `run_local.sh`:

```bash
./run_local.sh
```

Můžete také přejít do složky `app` manuálně a spustit `main.py` přímo:

```bash
cd app
python3 main.py
```

Pro sestavení flatpakové verze určené primárně pro produkční nasazení je dostupný [návod][build-instructions].


[install-x86_64]: install_archlinux_x86-64/INSTALL.md
[install-aarch64]: install_archlinux_aarch64_rpi/INSTALL.md
[build-instructions]: BUILD.md


[pyqt-docs]: https://www.riverbankcomputing.com/static/Docs/PyQt5/
[qt-quick-docs]: https://doc.qt.io/qt-5/qtquick-index.html