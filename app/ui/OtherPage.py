from PyQt5.Qt import *

class OtherPage(QWidget):
    def __init__(self):
        super(QWidget, self).__init__()

        layout = QVBoxLayout()
        layout.setAlignment(Qt.AlignHCenter | Qt.AlignVCenter)

        label = QLabel("Jinej bazmek")
        label.setObjectName("where_to_go")
        label.setAlignment(Qt.AlignCenter)

        font = label.font()
        font.setWeight(QFont.ExtraBold)
        font.setPixelSize(80)
        label.setFont(font)

        layout.addWidget(label)
        layout.setSpacing(50)
        self.setLayout(layout)