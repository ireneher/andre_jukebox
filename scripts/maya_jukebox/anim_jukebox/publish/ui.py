from PySide2 import QtCore, QtGui, QtWidgets

SIZE = (200, 300)
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

        self.list_view = QtWidgets.QListView()
        self.model = QtGui.QStandardItemModel(self.list_view)
        self.list_view.setModel(self.model)
        self.list_view.setFont(QtGui.QFont("Open Sans", 12))
        self.list_view.setSelectionMode(QtWidgets.QAbstractItemView.ContiguousSelection)

        if self.manager:
            for instance in self.manager.instances:
                item = QtGui.QStandardItem(instance.instance)
                item.setCheckable(True)
                item.setCheckState(QtCore.Qt.Checked)
                self.model.appendRow(item)
        self.label = QtWidgets.QLabel("ANIMATION JUKEBOX")
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
        main_layout.addWidget(self.list_view, 2, 0, 4, 1)
        main_layout.addWidget(self.publish_btn, 6, 0, 1, 1)

    def on_publish(self):
        if self.manager:
            self.manager.publish()
