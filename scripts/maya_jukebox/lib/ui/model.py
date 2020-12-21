from PySide2 import QtCore, QtGui, QtWidgets

from core_jukebox import os_common

ROOT_FOLDER = r"C:\Users\their\Documents\AJ_test\MAYA"

class JukeboxTapeModel(QtGui.QStandardItemModel):
    def __init__(self, project_root, mayapy_loc):
        super(JukeboxTapeModel, self).__init__()
        self.tapes = os_common.retrieve_tapes(project_root)
        for tape in self.tapes:
            item = JukeboxTapeItem(tape)
            self.appendRow(item)


class JukeboxTapeItem(QtGui.QStandardItem):
    def __init__(self, tape):
        super(JukeboxTapeItem, self).__init__(tape.name)
