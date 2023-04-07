from PyQt5.Qt import *
from PyQt5.QtWebEngine import *

from Meta import Meta
from sys import argv, exit
from os import scandir

import signal

signal.signal(signal.SIGINT, signal.SIG_DFL)

QtWebEngine.initialize()
app = QApplication(argv)

font_dir = QDir("./fonts/")

flatpak_info = QFile("/.flatpak-info")

if font_dir.exists():
    for entry in font_dir.entryList(["*.ttf"], QDir.Files):
        QFontDatabase.addApplicationFont(entry)

engine = QQmlApplicationEngine()

qmlRegisterType(Meta, 'Meta', 1, 0, 'Meta')

engine.quit.connect(app.quit)

# exists() does not work correctly under flatpak, open R/O instead
if flatpak_info.open(QIODevice.ReadOnly):
    print("Flatpak info exists")
    gui_file = QFile("./qml/main.qml")
else:
    print("No flatpak info found")
    gui_file = QFile("../qml/main.qml")

flatpak_info.close()

if not gui_file.exists():
    engine.load("./main.qml")
else:
    engine.load(gui_file.fileName())

app.exec()
