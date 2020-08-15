from PySide2 import QtCore, QtGui, QtWidgets

SIZE = (200, 300)
WINDOW_NAME = "Jukebox Rig Publish"


class RigPublishWidget(QtWidgets.QDialog):

    set_root_signal = QtCore.Signal()
    publish_signal = QtCore.Signal()

    def __init__(self, manager=None, parent=None):
        super(RigPublishWidget, self).__init__(parent)
        self.setWindowTitle(WINDOW_NAME)
        self.setObjectName(WINDOW_NAME)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        # self.setWindowFlags(QtCore.Qt.Dialog)
        self.resize(SIZE[0], SIZE[1])

        # ======================================================================== #
        #                         WIDGETS                                          #
        # ======================================================================== #
        # TODO: Ideally should disconnect this logic from the ui code
        self.manager = manager

        main_layout = QtWidgets.QGridLayout()
        main_layout.setSpacing(10)
        main_layout.setContentsMargins(10, 10, 10, 10)

        self.setLayout(main_layout)

        self.root_line = QtWidgets.QLineEdit(self.manager.root_node)
        self.root_line.setFont(QtGui.QFont("Open Sans", 12))

        self.set_root_button = QtWidgets.QPushButton("Set Root")
        self.set_root_button.setMinimumHeight(32)
        self.set_root_button.setFont(QtGui.QFont("Open Sans", 12))

        self.label = QtWidgets.QLabel("JUKEBOX RIG PUBLISH")
        self.label.setFont(QtGui.QFont("Open Sans", 18))
        self.label.setAlignment(QtCore.Qt.AlignLeft | QtCore.Qt.AlignTop)

        self.publish_btn = QtWidgets.QPushButton("Publish")
        self.publish_btn.setMinimumHeight(32)
        self.publish_btn.setFont(QtGui.QFont("Open Sans", 12))

        self.publish_btn.setToolTip("Publish rig to project archive")
        self.publish_btn.setEnabled(bool(self.manager.root_node))

        # ----- Connections -----
        self.set_root_button.clicked.connect(self.on_set_root)
        self.publish_btn.clicked.connect(self.on_publish)

        # ======================================================================== #
        #                         LAYOUT                                           #
        # ======================================================================== #

        main_layout.addWidget(self.label, 0, 0, 2, 1)
        main_layout.addWidget(self.root_line, 2, 0, 2, 1)
        main_layout.addWidget(self.set_root_button, 3, 0, 2, 1)
        main_layout.addWidget(self.publish_btn, 6, 0, 1, 1)

    def on_set_root(self):
        if self.manager:
            root = self.manager.set_root()

        self.root_line.setText(root)
        self.publish_btn.setEnabled(bool(root))

    def on_publish(self):
        if self.manager:
            self.manager.publish()
