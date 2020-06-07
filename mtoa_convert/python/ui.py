from PySide2 import QtWidgets

import api


class Dialog(QtWidgets.QWidget):
    def __init__(self):
        super(Dialog, self).__init__(parent=None)
        self.setWindowTitle("MtoA Convert OBJs")
        self.setMinimumSize(500, 150)
        self.layout = QtWidgets.QVBoxLayout(self)

        self.path_editor = QtWidgets.QLineEdit()
        self.path_editor.setPlaceholderText("Input path to OBJ(s)")

        self.convert_btn = QtWidgets.QPushButton("Convert", self)
        self.layout.addWidget(self.path_editor)
        self.layout.addWidget(self.convert_btn)
        self.convert_btn.clicked.connect(self.convert)

    def convert(self):
        api.publish_mtoa_convert(str(self.path_editor.text()))

