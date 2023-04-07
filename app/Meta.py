from PyQt5.Qt import *
from sys import version

class Meta(QObject):
    def __init__(self, *args, **kwargs):
        super(QObject, self).__init__(*args, **kwargs)

    @pyqtProperty("QString", constant=True)
    def qtVersion(self):
        return qVersion()

    @pyqtProperty("QString", constant=True)
    def pyVersion(self):
        return version