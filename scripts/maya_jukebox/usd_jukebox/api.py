import multiverse
import maya.cmds as cmds
from core_jukebox.tape_record import resolve
from core_jukebox.tape_record import record
from core_jukebox import jukebox


import maya_jukebox.lib.utils as maya_utils

def writeMaterials(outPath):
    mats = []
    for mat, sg in maya_utils.get_scene_materials():
        mats.append(mat)
    cmds.select(mats)

    cmds.file(outPath, exportSelected=True)

def writeUsdAsset(outPath):   
    assemblies = cmds.ls(assemblies=True)
    rootLoc = cmds.listRelatives(assemblies, type="locator")

    opts = multiverse.AssetWriteOptions()
    opts.writeNormals = True


    opts.writeUVs = True
    opts.writeMaterialAssignment = True
    multiverse.WriteAsset(outPath, rootLoc, opts)


def writeUsdComposition(outPath):   
    usdNodes = cmds.ls(type="mvUsdCompoundShape")
    opts = multiverse.CompositionWriteOptions()
    multiverse.WriteComposition(outPath, usdNodes, opts)

def publishMaterials(tapeEntity, recorder=None):   
    trackEntity = jukebox.track.from_fields(tapeEntity.asset_type,
                                    tapeEntity.asset,
                                    "material",
                                    dcc_root=tapeEntity.dcc_root)

    versionNumber = resolve.Resolver().get_next_version_number(trackEntity.filepath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(outPath, versionNumber):
       writeMaterials(outPath)

def publishUsdAsset(tapeEntity, recorder=None):   
    trackEntity = jukebox.track.from_fields(tapeEntity.asset_type,
                                    tapeEntity.asset,
                                    "usd",
                                    dcc_root=tapeEntity.dcc_root)

    versionNumber = resolve.Resolver().get_next_version_number(trackEntity.filepath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(outPath, versionNumber):
       writeUsdAsset(outPath)   


def publishUsdComposition(tapeEntity, recorder=None):   
    trackEntity = jukebox.track.from_fields(tapeEntity.asset_type,
                                    tapeEntity.asset,
                                    "usdComposition",
                                    dcc_root=tapeEntity.dcc_root)

    versionNumber = resolve.Resolver().get_next_version_number(trackEntity.filepath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(outPath, versionNumber):
       writeUsdComposition(outPath)   

def publishAsset():
    mayaFile = cmds.file(q=True, sceneName=True)
    print(mayaFile)
    tapeEntity = jukebox.tape.Tape.from_filepath(mayaFile)
    print(tapeEntity)
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    recorder = record.Recorder()
    
    recorder.archive_workfile(workfileArchivePath, mayaFile)
    publishMaterials(tapeEntity, recorder=recorder)
    publishUsdAsset(tapeEntity, recorder=recorder)

def publishComposition():
    mayaFile = cmds.file(q=True, sceneName=True)
    tapeEntity = jukebox.tape.Tape.from_filepath(mayaFile)
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    recorder = record.Recorder()
    
    recorder.archive_workfile(workfileArchivePath, mayaFile)
    publishUsdComposition(tapeEntity, recorder=recorder)