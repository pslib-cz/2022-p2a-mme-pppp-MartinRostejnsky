from PyQt5.Qt import *


class MainPage(QWidget):
    def __init__(self, main_ui):
        super(QWidget, self).__init__()
        self.main_ui = main_ui

        layout = QVBoxLayout()
        layout.setAlignment(Qt.AlignHCenter | Qt.AlignVCenter)

        label = QLabel("Kam to bude?")
        label.setObjectName("where_to_go")
        label.setAlignment(Qt.AlignCenter)

        font = label.font()
        font.setWeight(QFont.ExtraBold)
        font.setPixelSize(80)
        label.setFont(font)

        grid = QGridLayout()

        grid.addWidget(self._createPushButton("Rozvrh", "timetable"), 0, 0)
        grid.addWidget(self._createPushButton("Suplování", "suplovani"), 0, 1)
        grid.addWidget(self._createPushButton("Web", "web"), 1, 0)
        grid.addWidget(self._createPushButton("O aplikaci", "about", "other"), 1, 1)
        grid.setSpacing(100)

        layout.addWidget(label)
        layout.addLayout(grid)

        layout.setSpacing(50)
        self.setLayout(layout)

    def _createPushButton(self, label, icon, target_page = None):
        def navigate():
            print(f"Navigating to {target_page}")
            self.main_ui.navigateToPage(target_page)

        btn = QPushButton()
        btn.setFlat(True)

        ly = QHBoxLayout(btn)

        iconWidget = QLabel()
        iconWidget.setPixmap(QPixmap(f"icons/{icon}.svg"))

        text = QLabel(label)
        font = text.font()
        font.setWeight(QFont.Bold)
        font.setPixelSize(48)
        text.setFont(font)

        ly.addWidget(iconWidget)
        ly.addWidget(text)
        ly.setSpacing(16)

        ly.setAlignment(Qt.AlignHCenter | Qt.AlignVCenter)

        btn.setMinimumHeight(120)
        btn.setMinimumWidth(360)

        if target_page is not None:
            btn.clicked.connect(navigate)

        return btn
