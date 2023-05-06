from PyQt5.Qt import *
from sys import version

class URLUtils(QObject):
    def __init__(self, *args, **kwargs):
        super(QObject, self).__init__(*args, **kwargs)

    @pyqtSlot("QUrl", result=str)
    def getOrigin(self, url):
        return url.host()