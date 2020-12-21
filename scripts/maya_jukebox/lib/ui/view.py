from PySide2 import QtCore, QtGui, QtWidgets

SIZE = (200, 300)
WINDOW_NAME = "André Jukebox Tapes"


class TapeBrowser(QtWidgets.QTreeView):
    def __init__(self, model, parent=None):
        super(TapeBrowser, self).__init__(parent)
        self.setWindowTitle(WINDOW_NAME)
        self.setObjectName(WINDOW_NAME)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        self.setWindowFlags(QtCore.Qt.Dialog)
        self.resize(SIZE[0], SIZE[1])

        self.setModel(model)