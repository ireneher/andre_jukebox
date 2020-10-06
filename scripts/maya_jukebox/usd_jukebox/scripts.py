import sys
import os

from PySide2 import QtWidgets
import maya.standalone
import maya.cmds as cmds

from maya_jukebox import lib as maya_lib
from maya_jukebox import usd_jukebox

ROOT_FOLDER = r"C:\Users\their\Documents\AJ_test\MAYA\scenes\ASSETS\sets\city\workarea\model\building_groups"

def launch():
    # app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("objExport")
    cmds.loadPlugin("mtoa")
    cmds.loadPlugin("MultiverseForMaya")
    for dirpath, dirnames, files in os.walk(ROOT_FOLDER):
        for file in files:
            filepath = os.path.join(dirpath, file)
            print("Processing {}".format(filepath))
            cmds.file(new=True, force=True)  # clear scene
            cmds.file(filepath, i=True, force=True)
            usd_jukebox.api.publishAsset()
            mel.eval("cleanUpScene 3")
            cmds.file(save=True, type="mayaAscii")
            maya_lib.utils.remove_student_license(asset_file)


    # window = ui.Dialog()
    # window.show()
    # app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()

    return 0


if __name__ == "__main__":
    sys.exit(launch())
