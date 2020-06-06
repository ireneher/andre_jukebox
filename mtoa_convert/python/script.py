import os
import sys

from PySide2 import QtWidgets
import maya.standalone
import maya.cmds as cmds

import api
import constants
import ui
import utils


def main():
    app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("objExport")
    path = "C:/Users/their/Documents/AndreJukebox/MAYA/scenes/MODELS/SET/buildings/OBJ"
    project_root = utils.find_project_root(path)
    if not project_root:
        print("Input path {} is not part of a Maya project".format(path))
        return 1

    print("Project root is {}".format(project_root))
    objs, materials = api.retrieve_objs_mtls(path)

    assets_dir = utils.create_dir(project_root, constants.assets_dir_rel)
    refs_dir = utils.create_dir(project_root, constants.refs_dir_rel)

    api.publish_objs(objs, assets_dir, refs_dir)

    # window = ui.Dialog()
    # window.show()
    # app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()
    return 0


if __name__ == "__main__":
    sys.exit(main())
