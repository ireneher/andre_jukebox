import sys
import os

#from PySide2 import QtWidgets
import maya.mel as mel
import maya.standalone
import maya.cmds as cmds

sys.path.append(r"C:\Users\their\dev\andre_jukebox\scripts")

from maya_jukebox import lib as maya_lib
from core_jukebox import jukebox
from maya_jukebox import maya_startup

ROOT_FOLDER = r"C:\Users\their\Documents\AJ_test\MAYA\scenes\ASSETS\sets\city\workarea\model\assettest"

def get_songs(asset_name):
    usd_song_obj = jukebox.song.Song.from_fields("env", asset_name, "usd", asset_name, "usd")
    mat_song_obj = jukebox.song.Song.from_fields("env", asset_name, "material", asset_name, "ma")
    if not usd_song_obj:
        usd_song_obj = jukebox.song.Song.from_fields("sets", asset_name, "usdComposition", asset_name, "usd")
        mat_song_obj = jukebox.song.Song.from_fields("sets", asset_name, "material", asset_name, "ma")
    return usd_song_obj, mat_song_obj

def replace_refs_with_usds(): 
    import multiverse as mv   
    from maya_jukebox.common import file_reference

    refs = file_reference.FileReference.ls_references()
    for ref in refs:
        if len(ref.top_nodes)>1:
            print("Using first top node for reference {}".format(ref))

        print ("Ref: {}".format(ref))
        print ("Ref Loaded: {}".format(ref.is_loaded))
        print ("Ref nodes: {}".format(ref.top_nodes))

        try:
            xform_matrix = cmds.xform(ref.nodes[0], q=True, matrix=True)
        except IndexError:
            print(ref.filepath)
            continue
        #tape_obj = jukebox.tape.AssetTape.from_filepath(ref.filepath)
        asset_name = os.path.basename(os.path.dirname(ref.filepath))
        print("---- Loading USD for {} ----- ".format(asset_name))
        song_obj, mat_song_obj = get_songs(asset_name)
        print("song:", song_obj)
        print("mat:", mat_song_obj)
        if not song_obj:
            continue
        print("Resolved filepath: {}".format(song_obj.filepath))
        usd_compound = cmds.listRelatives(mv.CreateUsdCompound(song_obj.filepath), parent=True)
        cmds.xform(usd_compound, matrix=xform_matrix)
        print("~*"*50)
        print(xform_matrix)

    # for ref in refs:
    #     cmds.file(removeReference=ref.filepath, force=True)
    gpu_shapes = cmds.ls(type="gpuCache")
    if not gpu_shapes:
        return
    gpu_caches = [(cmds.listRelatives(gpu_shape, parent=True)[0], cmds.getAttr("{}.cacheFileName".format(gpu_shape))) for gpu_shape in gpu_shapes]
    for transform, filepath in gpu_caches:
        if not filepath:
            continue
        xform_matrix = cmds.xform(transform, q=True, matrix=True)
        #tape_obj = jukebox.tape.AssetTape.from_filepath(filepath)
        asset_name = os.path.basename(os.path.dirname(ref.filepath))
        song_obj, mat_song_obj = get_songs(asset_name)
        print ("Loading usd: {}".format(song_obj.filepath))
        # Load USD
        usd_compound = cmds.listRelatives(mv.CreateUsdCompound(song_obj.filepath), parent=True)
        # Load Material
        cmds.file(mat_song_obj.filepath, reference=True)
        # Set material namespace
        mvSetNode = cmds.createNode("mvSet", name="mvSet_{}".format(usd_compound))
        cmds.setAttr("{}.materialNamespaceEnable".format(mvSetNode), 1.0)
        cmds.setAttr("{}.materialNamespace".format(mvSetNode), asset_name)
        cmds.connectAttr("{}.message".format(mvSetNode), "{}Shape.ItemOverrides.ItemAttribute".format(usd_compound))
        cmds.xform(usd_compound, matrix=xform_matrix)

    try:
        cmds.delete(gpu_shapes)
    except:
        pass


def launch():
    # app = QtWidgets.QApplication(sys.argv)
    maya.standalone.initialize()
    cmds.loadPlugin("objExport")
    cmds.loadPlugin("gpuCache")
    cmds.loadPlugin("mtoa")
    cmds.loadPlugin("MultiverseForMaya")
    import multiverse as mv

    from maya_jukebox.usd_jukebox import publish
    from maya_jukebox.lib import utils
    
    for dirpath, dirnames, files in os.walk(ROOT_FOLDER):
        dirnames[:] = [d for d in dirnames if d not in ("incrementalSave")]
        for file in files:
            if not file.endswith(("ma", "mb")):
                continue
            filepath = os.path.join(dirpath, file)
            filepath = filepath.replace("\\", "/")
            print("Processing {}".format(filepath))
            cmds.file(new=True, force=True)  # clear scene
            cmds.file(filepath, open=True, force=True, loadReferenceDepth="all")
            utils.relative_repath()

            ## Asset
            publish.publishAsset(mayaFile=filepath)

            ## Composition
            # replace_refs_with_usds()
            # cmds.file(rename=r"C:\Users\their\Desktop\block01_A.ma")
            # cmds.file(save=True, type="mayaAscii", force=True)
            # publish.publishComposition(mayaFile=filepath)

            mel.eval("cleanUpScene 3")
            #maya_lib.utils.remove_student_license(filepath)


    # window = ui.Dialog()
    # window.show()
    # app.exec_()
    print("uninitiliasing")
    maya.standalone.uninitialize()

    return 0


if __name__ == "__main__":
    sys.exit(launch())


