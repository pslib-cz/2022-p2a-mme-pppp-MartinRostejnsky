from PyQt5.Qt import *

class ClickableLabel(QLabel):
    clicked = pyqtSignal()
    def __init__(self, *args, **kwargs):
        super(QLabel, self).__init__(*args, **kwargs)
        self._heldDown = False

    def mousePressEvent(self, event):
        self._heldDown = True
        super(QLabel, self).mousePressEvent(event)

    def mouseReleaseEvent(self, event):
        if self._heldDown:
            self._heldDown = False
            self.clicked.emit()
        
        super(QLabel, self).mouseReleaseEvent(event)
