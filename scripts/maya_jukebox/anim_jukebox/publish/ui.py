from PySide2 import QtCore, QtGui, QtWidgets

SIZE = (120, 300)
WINDOW_NAME = "Jukebox Animation Publish"


class AnimPublishWidget(QtWidgets.QWidget):

    publish_signal = QtCore.Signal()

    def __init__(self, manager=None, parent=None):
        super(AnimPublishWidget, self).__init__(parent)
        self.setWindowTitle(WINDOW_NAME)
        self.setObjectName(WINDOW_NAME)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        self.setWindowFlags(QtCore.Qt.Dialog)
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

        self.instance_list = QtWidgets.QListView()
        self.model = QtWidgets.QStandardItemModel(instance_list)

        if self.manager:
            for instance in self.manager.instances:
                item = QtWidgets.QStandardItem(instance.instance)
                item.setCheckable(True)
                model.appendRow(item)

        self.label = QtWidgets.QLabel("Publish")
        self.label.setFont(QtGui.QFont("Helvetica Bold", 18))
        self.label.setAlignment(QtCore.Qt.AlignLeft | QtCore.Qt.AlignTop)

        self.publish_btn = QtWidgets.QPushButton("Publish")
        self.publish_btn.setMinimumHeight(32)
        self.publish_btn.setFont(QtGui.QFont("Open Sans", 12))

        self.publish_btn.setToolTip("Publish animation to project archive")
        # self.publish_btn.setEnabled(False)

        # ----- Connections -----
        self.publish_btn.clicked.connect(self.on_publish)

        # ======================================================================== #
        #                         LAYOUT                                           #
        # ======================================================================== #

        main_layout.addWidget(self.label, 0, 0, 2, 1)
        main_layout.addWidget(self.publish_btn, 5, 0, 2, 1)
        main_layout.addWidget(self.close_btn, 7, 0, 2, 1)

    def on_publish(self):
        if self.manager:
            pass
