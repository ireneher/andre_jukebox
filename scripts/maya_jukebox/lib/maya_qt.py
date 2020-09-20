"""
Module contains utility functions and widgets for working with Qt
"""
import contextlib
import maya.cmds as cmds
import maya.OpenMayaUI as apiUI
from maya.api import OpenMaya as om2
from PySide2 import QtCore, QtWidgets
import shiboken2


MAYA_MAIN_WINDOW_NAME = "MayaWindow"


def maya_main_window():
    """Get the main Maya window as a QtWidgets.QMainWindow instance

    Returns:
        [QtWidgets.QMainWindow]: instance of the top level Maya windows
    """

    ptr = apiUI.MQtUtil.mainWindow()
    if ptr is not None:
        return shiboken2.wrapInstance(long(ptr), QtWidgets.QWidget)


class MayaWidget(QtWidgets.QWidget):
    def keyPressEvent(self, event):
        """Maya's main window will catch shift and control keys, so accept
        them here to avoid it taking focus"""
        if event.key() in (QtCore.Qt.Key_Shift, QtCore.Qt.Key_Control):
            event.accept()
        else:
            event.ignore()

    @classmethod
    def launch_dialog(cls):
        widget = cls(parent=maya_main_window())
        widget.show()
        return widget


@contextlib.contextmanager
def blocked_signals(widget):
    """
    Stop widget from emitting signals during context block
    """
    state = widget.blockSignals(True)
    try:
        yield widget
    finally:
        widget.blockSignals(state)


@contextlib.contextmanager
def update_halted(widget):
    """
    Stop widget from redrawing during execution.

    It's a good habit to use while executing code that will cause redrawing.
    When iterating and mutating internal models it's better to perform all
    changes and only redraw once.
    """
    widget.setUpdatesEnabled(False)
    try:
        yield widget
    finally:
        widget.setUpdatesEnabled(True)
