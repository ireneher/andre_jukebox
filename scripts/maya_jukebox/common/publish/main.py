import sys
import os

import maya.standalone
import maya.cmds as cmds
from PySide2 import QtWidgets

import ui

def launch():    
    app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("mtoa")     
    import multiverse
    multiverse.LoadPlugin()
    tapeBrowser = ui.TapeBrowser()
    tapeBrowser.show()
    app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()

    return 0

if __name__ == "__main__":
    sys.exit(launch())
