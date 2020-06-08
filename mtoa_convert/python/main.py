import sys

from PySide2 import QtWidgets
import maya.standalone
import maya.cmds as cmds

import ui


def launch():
    app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("objExport")
    cmds.loadPlugin("mtoa")
    window = ui.Dialog()
    window.show()
    app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()

    return 0


if __name__ == "__main__":
    sys.exit(launch())
