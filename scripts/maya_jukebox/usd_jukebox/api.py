import multiverse
import maya.cmds as cmds
from core_jukebox.tape_record import resolve, record
from core_jukebox.jukebox import tape, track

import maya_jukebox.lib.utils as maya_utils

def writeMaterials(outPath):
    mats = []
    for mat, sg in maya_utils.get_scene_materials():
        mats.append(mat)
    cmds.select(mats)

    cmds.file(outPath, exportSelected=True)

def writeUsdAsset(outPath):   
    assemblies = cmds.ls(assemblies=True)
    root_loc = cmds.listRelatives(assemblies, type="locator")

    opts = multiverse.AssetWriteOptions()
    opts.writeNormals = True


    opts.writeUVs = True
    opts.writeMaterialAssignment = True
    multiverse.WriteAsset(outPath, root_loc, opts)

def publishMaterials(tapeEntity):   
    trackEntity = track.from_fields(tapeEntity.asset_type,
                                    tapeEntity.asset,
                                    "material",
                                    dcc_root=tapeEntity.dcc_root)

    versionNumber = resolve.Resolver().get_next_version_number(trackEntity.filepath)

    recoder = record.Recorder()
    with recoder.publish_record(outPath, versionNumber):
       writeMaterials(outPath)

def publishUsdAsset(tapeEntity):   
    trackEntity = track.from_fields(tapeEntity.asset_type,
                                    tapeEntity.asset,
                                    "usd",
                                    dcc_root=tapeEntity.dcc_root)

    versionNumber = resolve.Resolver().get_next_version_number(trackEntity.filepath)

    recoder = record.Recorder()
    with recoder.publish_record(outPath, versionNumber):
       writeUsdAsset(outPath)    

def publishAsset():
    mayaFile = cmds.file(q=True, sceneName=True)
    tapeEntity = tape.Tape.from_filepath(mayaFile)
    # TODO: move this somewhere appropiate
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    shutil.copyfile(mayaFile, os.path.join(workfileArchivePath,datetime.today().strftime('%Y%m%d')))

    publishMaterials(usdOutPath)
    publishUsdAsset(matOutPath)