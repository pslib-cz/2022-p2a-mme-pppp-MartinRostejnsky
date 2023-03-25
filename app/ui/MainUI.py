from PyQt5.Qt import *

from .TopBar import TopBar
from .MainPage import MainPage

class MainUI(QWidget):
    def __init__(self):
        super(QWidget, self).__init__()
        layout = QVBoxLayout(self)
        self.setLayout(layout)

        devWarning = QLabel("This is a development version. The final layout may be subject to change.")
        devWarning.setStyleSheet("color: red; padding: 8px; background-color: yellow")
        devWarning.setAlignment(Qt.AlignHCenter | Qt.AlignVCenter)


        layout.addWidget(TopBar())
        layout.addWidget(MainPage(), 1)
        layout.addWidget(devWarning)

        layout.setContentsMargins(0,0,0,0)