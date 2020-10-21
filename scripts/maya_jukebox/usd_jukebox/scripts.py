import sys
import os

from PySide2 import QtWidgets
import maya.standalone
import maya.cmds as cmds

from maya_jukebox import lib as maya_lib
from maya_jukebox import usd_jukebox
from core_jukebox import jukebox
from maya_jukebox.common import file_reference

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


def replace_refs_with_usds():
    refs = file_reference.ls_references()
    for ref in refs:
        xform_matrix = cmds.xform(ref.top_node, q=True, matrix=True)
        tape_obj = jukebox.tape.AssetTape.from_filepath(ref.filepath)
        song_obj = jukebox.song.Song.from_fields(tape_obj.asset_type, tape_obj.name, "usd")
        usd_compound = mv.CreateUsdCompound(song_obj.filepath)
        cmds.xform(usd_compound, q=True, matrix=xform_matrix)

    for ref in refs:
        cmds.file(removeReference=ref.filepath, force=True)
                    
    gpu_shapes = cmds.ls(type="gpuCache")
    if not gpu_shapes:
        return
    gpu_caches = [(cmds.listRelatives(gpu_shape, parent=True)[0], cmds.getAttr("{}.cacheFileName".format(gpu_shape)) for gpu_shape in gpu_shapes]
    for transform, filepath in gpu_caches:
        if not filepath:
            continue
        xform_matrix = cmds.xform(transform, q=True, matrix=True)
        tape_obj = jukebox.tape.AssetTape.from_filepath(filepath)
        song_obj = jukebox.song.Song.from_fields(tape_obj.asset_type, tape_obj.name, "usd")
        usd_compound = mv.CreateUsdCompound(song_obj.filepath)
        cmds.xform(usd_compound, q=True, matrix=xform_matrix)

    try:
        cmds.delete(gpu_shapes)
    except:
        pass

