from PyQt5.Qt import *

from ui.MainUI import MainUI
from sys import argv, exit

windowStylesheet = None

with open("./style.qss", "r") as f:
    windowStylesheet = f.read()

app = QApplication(argv)

window = QMainWindow()

font = app.font()
font.setPixelSize(24)
app.setFont(font)

window.resize(QSize(1600, 900))
window.setStyleSheet(windowStylesheet)
window.setCentralWidget(MainUI())

window.show()

try:
    app.exec()
except (SystemExit, KeyboardInterrupt):
    exit(0)
