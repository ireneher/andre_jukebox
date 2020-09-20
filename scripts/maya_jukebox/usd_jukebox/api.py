import multiverse
import maya.cmds as cmds

import maya_jukebox.lib.utils as maya_utils

def publishMaterials():
    mats = []
    for mat, sg in maya_utils.get_scene_materials():
        mats.append(mat)
    # ok to select and export to file?
    cmds.select(mats)
    outPath=""
    cmds.file(outPath, exportSelected=True)

def publishUsdAsset():   
    assemblies = cmds.ls(assemblies=True)
    root_loc = cmds.listRelatives(assemblies, type="locator")

    opts = multiverse.AssetWriteOptions()
    opts.writeNormals = True
    opts.writeUVs = True
    opts.writeMaterialAssignment = True

    outPath = ""
    multiverse.WriteAsset('/path/to/sphere.usd', root_loc, opts)

def publishAsset():
    publishMaterials()
    publishUsdAsset()