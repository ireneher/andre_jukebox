from PySide2 import QtWidgets

import api


class Dialog(QtWidgets.QWidget):
    def __init__(self):
        super(Dialog, self).__init__(parent=None)
        self.setWindowTitle("MtoA Convert OBJs")
        self.setMinimumSize(500, 150)
        self.layout = QtWidgets.QVBoxLayout(self)

        self.path_layout = QtWidgets.QHBoxLayout(self)
        self.path_editor = QtWidgets.QLineEdit()
        self.path_editor.setPlaceholderText("Input path to OBJ(s)")
        self.path_editor.setText("C:/Users/their/Documents/AndreJukebox_Irene/MAYA/scenes/MODELS/SET/buildings/test")

        self.browse_button = QtWidgets.QPushButton("Browse")
        self.browse_button.clicked.connect(self.open_file_browser)
        self.path_layout.addWidget(self.path_editor)
        self.path_layout.addWidget(self.browse_button)

        self.convert_btn = QtWidgets.QPushButton("Convert", self)
        self.layout.addLayout(self.path_layout)
        self.layout.addWidget(self.convert_btn)
        self.convert_btn.clicked.connect(self.convert)

    def convert(self):
        api.publish_mtoa_convert(str(self.path_editor.text()))

    def open_file_browser(self):
        browser = QtWidgets.QFileDialog()
        filepath = browser.getExistingDirectory()
        self.path_editor.setText(filepath)

