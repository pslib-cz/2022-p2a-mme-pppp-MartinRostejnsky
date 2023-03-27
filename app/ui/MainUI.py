from PyQt5.Qt import *

from .TopBar import TopBar
from .MainPage import MainPage
from .OtherPage import OtherPage

class MainUI(QWidget):
    pageFactories = {
        "main": lambda self: MainPage(self),
        "other": lambda self: OtherPage()
    }

    def __init__(self):
        super(QWidget, self).__init__()
        self.currentPage = "main"
        self.layout = QVBoxLayout(self)
        self.setLayout(self.layout)

        devWarning = QLabel("This is a development version. The final layout may be subject to change.")
        devWarning.setStyleSheet("color: red; padding: 8px; background-color: yellow")
        devWarning.setAlignment(Qt.AlignHCenter | Qt.AlignVCenter)


        self.layout.addWidget(TopBar(self))
        self.layout.addWidget(self.pageFactories[self.currentPage](self), 1)
        self.layout.addWidget(devWarning)

        self.layout.setContentsMargins(0,0,0,0)

    def navigateToPage(self, page):
        if not page in self.pageFactories:
            return
        
        if self.currentPage == page:
            return
        
        self.currentPage = page

        widget = self.layout.itemAt(1).widget()
        widget.deleteLater()

        self.layout.replaceWidget(widget, self.pageFactories[self.currentPage](self), Qt.FindDirectChildrenOnly)
        del widget