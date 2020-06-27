"""
Main module for Pose Sketcher ui
"""
import maya.cmds as cmds
import shiboken2
from PySide2 import QtCore, QtGui, QtWidgets

from maya_library import decorators

from art_playblast import constants

SIZE = (120, 240)


class SketchWidget(QtWidgets.QWidget):

    close_signal = QtCore.Signal()
    draw_signal = QtCore.Signal()
    delete_signal = QtCore.Signal()

    def __init__(self, parent=None):
        """
        :param str                  workarea:
        :param QtWidgets.QWidget    parent:
        """
        super(SketchWidget, self).__init__(parent)
        self.setWindowTitle(constants.WINDOW_NAME)
        self.setObjectName(constants.WINDOW_NAME)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        self.setWindowFlags(QtCore.Qt.Dialog)
        self.resize(SIZE[0], SIZE[1])

        # ======================================================================== #
        #                         WIDGETS                                          #
        # ======================================================================== #

        # separator = QtWidgets.QFrame()
        # separator.setFrameShape(QtWidgets.QFrame.HLine)
        # separator.setFrameShadow(QtWidgets.QFrame.Sunken)

        main_layout = QtWidgets.QGridLayout()
        main_layout.setSpacing(10)
        main_layout.setContentsMargins(10, 10, 10, 10)

        self.setLayout(main_layout)

        self.label = QtWidgets.QLabel("PLAYBLAST")
        self.label.setFont(QtGui.QFont("Helvetica Bold", 18))
        self.label.setAlignment(QtCore.Qt.AlignLeft | QtCore.Qt.AlignTop)

        self.draw_btn = QtWidgets.QPushButton("Draw Curve")
        self.draw_btn.setMinimumHeight(32)
        self.draw_btn.setFont(QtGui.QFont("Open Sans", 12))

        self.draw_btn.setToolTip("Draw a curve.\nCommitted")
        # self.draw_btn.setEnabled(False)

        # Cancel button
        self.close_btn = QtWidgets.QPushButton("Close")
        self.close_btn.setMinimumHeight(32)
        self.close_btn.setFont(QtGui.QFont("Open Sans", 12))

        # ----- Connections -----
        self.close_btn.clicked.connect(self.close_signal.emit)
        self.draw_btn.clicked.connect(self.draw_signal.emit)

        # ======================================================================== #
        #                         LAYOUT                                           #
        # ======================================================================== #

        main_layout.addWidget(self.label, 0, 0, 2, 1)
        main_layout.addWidget(self.draw_btn, 5, 0, 2, 1)
        main_layout.addWidget(self.close_btn, 7, 0, 2, 1)
