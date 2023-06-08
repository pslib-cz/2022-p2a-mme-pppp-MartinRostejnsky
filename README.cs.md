[Read the documentation in English](README.md)

# Informační kiosek
Cílem tohoto projektu je vytvořit jednoduchý základ pro informační kiosek.

## Instalace
Instalační kroky závisí na použité platformě:
- [x86-64][install-x86-64]
- [Raspberry Pi 3B+/4][install-aarch64]

## Referenční aplikace
Referenční aplikace zobrazená uživatelům je napsána v Pythonu a QML pomocí frameworků PyQt5 a Qt Quick. Dokumentaci k těmto frameworkům lze nalézt zde:
- [PyQt][pyqt-docs]
- [Qt Quick/QML][qt-quick-docs]

Pro lokální vývoj stačí nainstalovat příslušné balíčky. (instalaci balíčků pro lokální vývoj tento návod nepokrývá - pro vývoj lze použít i [flatpakovou verzi][build-instructions]) Pro ulehčení lze aplikaci spustit pomocí souboru `run_local.sh`:

```bash
./run_local.sh
```

Můžete také přejít do složky `app` manuálně a spustit `main.py` přímo:

```bash
cd app
python3 main.py
```

Pro sestavení flatpakové verze určené primárně pro produkční nasazení je dostupný [návod][build-instructions].

## Licence
Tento projekt je licencován následovně:
- Dokumentace k projektu společně se složkou `assemble_rpi_hw` je licencována pod licencí [CC BY-SA 4.0](LICENSE-DOCS).
- Referenční aplikace obsahuje ve složce `qml/fonts` písmo [Noto Sans][noto-sans] šířené pod licencí [SIL OFL 1.1](qml/fonts/OFL.txt).
- Zbytek projektu je licencován pod licencí [GPL 3.0 nebo novějšími verzemi](LICENSE).


[install-x86-64]: install_archlinux_x86-64/INSTALL.cs.md
[install-aarch64]: install_archlinux_aarch64_rpi/INSTALL.cs.md
[build-instructions]: BUILD.cs.md


[pyqt-docs]: https://www.riverbankcomputing.com/static/Docs/PyQt5/
[qt-quick-docs]: https://doc.qt.io/qt-5/qtquick-index.html
[noto-sans]: https://fonts.google.com/noto/specimen/Noto+Sans