from PyQt5.Qt import *
from PyQt5.QtWebEngine import *

from Meta import Meta
from URLUtils import URLUtils
from sys import argv, exit
from os import scandir

import signal

signal.signal(signal.SIGINT, signal.SIG_DFL)

QtWebEngine.initialize()
app = QApplication(argv)


flatpak_info = QFile("/.flatpak-info")
# exists() does not work correctly under flatpak, open R/O instead
if flatpak_info.open(QIODevice.ReadOnly):
    print("Flatpak info exists")
    gui_file = QFile("./qml/main.qml")
    font_dir = QDir("./qml/fonts")
else:
    print("No flatpak info found")
    gui_file = QFile("../qml/main.qml")
    font_dir = QDir("../qml/fonts/")

# Automatically load fonts if bundled
if font_dir.exists():
    print("font dir found!")
    for entry in font_dir.entryList(["*.ttf"], QDir.Files):
        print(f"Loading font {entry}")
        QFontDatabase.addApplicationFont(f"{font_dir.path()}/{entry}")

engine = QQmlApplicationEngine()

qmlRegisterType(Meta, 'Meta', 1, 0, 'Meta')
qmlRegisterType(URLUtils, 'URLUtils', 1, 0, 'URLUtils')

engine.quit.connect(app.quit)

flatpak_info.close()

if not gui_file.exists():
    engine.load("./main.qml")
else:
    engine.load(gui_file.fileName())

app.exec()
