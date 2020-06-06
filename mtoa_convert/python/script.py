from PySide2 import QtWidgets
import os
import constants
import ui
import utils
import sys
import maya.standalone
import maya.cmds as cmds


def main():
    app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("objExport")
    path = "C:/Users/their/Documents/AndreJukebox/MAYA/scenes/MODELS/SET/buildings/OBJ"
    project_root = utils.find_project_root(path)
    if not project_root:
        print("Input path {} is not part of a Maya project".format(path))
        return

    print("Project root is {}".format(project_root))
    objs = {}  # {asset_name: obj_path}
    materials = {}  # {asset_name: mtl_path}
    for file in os.listdir(path):
        filename, extension = os.path.splitext(file)
        asset_name = filename.lower()
        filepath = os.path.join(path, file)
        if extension == ".obj":
            objs[asset_name] = filepath
        elif extension == ".mtl":
            materials[asset_name] = filepath

    assets_dir = utils.create_dir(project_root, constants.assets_dir_rel)
    refs_dir = utils.create_dir(project_root, constants.refs_dir_rel)

    for asset_name, obj_path in objs.items():
        print("Opening OBJ for {}".format(asset_name))
        asset_archive = utils.create_dir(assets_dir, os.path.join(asset_name, constants.archive_dir_rel))
        asset_file = os.path.join(os.path.dirname(asset_archive), "{}.ma".format(asset_name))
        cmds.file(obj_path, i=True, groupReference=True, groupName=asset_name)
        cmds.file(rename=asset_file)
        cmds.file(save=True, type="mayaAscii")
        utils.archive_file(asset_archive, asset_file)

        ref_archive = utils.create_dir(refs_dir, os.path.join(asset_name, constants.archive_dir_rel))
        ref_file = os.path.join(os.path.dirname(ref_archive), "{}_ref.ma".format(asset_name))
        cmds.file(rename=ref_file)
        cmds.file(save=True, type="mayaAscii")
        utils.archive_file(ref_archive, ref_file)

    # window = ui.Dialog()
    # window.show()
    # app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()


if __name__ == "__main__":
    sys.exit(main())
