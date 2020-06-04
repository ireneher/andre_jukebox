from PySide2 import QtWidgets
import ui
import sys
import maya.standalone
import maya.cmds as cmds


def main():
    app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("objExport")
    window = ui.Dialog()
    window.show()
    app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()


if __name__ == "__main__":
    sys.exit(main())
