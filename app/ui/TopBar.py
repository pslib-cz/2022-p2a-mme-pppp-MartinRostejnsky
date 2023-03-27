from PyQt5.Qt import *
from datetime import datetime
from .components.ClickableLabel import ClickableLabel

class TopBar(QWidget):
    def __init__(self, main_ui):
        super(QWidget, self).__init__()
        self.main_ui = main_ui

        self.setFixedHeight(96)

        palette = QPalette()
        palette.setColor(QPalette.Window, Qt.white)
        self.setPalette(palette)

        self.setAutoFillBackground(True)

        layout = QHBoxLayout(self)

        leftLabel = QLabel()
        leftLabel.setAlignment(Qt.AlignLeft | Qt.AlignVCenter)
        leftLabel.setPixmap(QPixmap("icons/logo.svg"))

        centralLabel = ClickableLabel()
        centralLabel.setAlignment(Qt.AlignHCenter | Qt.AlignVCenter)
        centralLabel.setPixmap(QPixmap("icons/home_button.svg"))
        centralLabel.clicked.connect(self.on_home_click)
        centralLabel.setSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed)

        now = datetime.now()

        self.rightLabel = QLabel(now.strftime("%d. %m. %Y %H:%M:%S"))
        self.rightLabel.setObjectName("datetime")
        self.rightLabel.setAlignment(Qt.AlignRight | Qt.AlignVCenter)

        self.timer = QTimer()
        self.timer.timeout.connect(self.on_timer_lapse)
        self.timer.start(1000)

        layout.addWidget(leftLabel)
        layout.addWidget(centralLabel)
        layout.addWidget(self.rightLabel)

        layout.setContentsMargins(16, 0, 16, 0)

        self.setLayout(layout)

    def on_timer_lapse(self):
        now = datetime.now()


        self.rightLabel.setText(now.strftime("%d. %m. %Y %H:%M:%S"))

    def on_home_click(self):
        print("Clicked home button")

        self.main_ui.navigateToPage("main")