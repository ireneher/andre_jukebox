import os

from maya import cmds

import core_jukebox.jukebox.tape as tape
from core_jukebox.tape_record import resolve
from core_jukebox.tape_record import record
from core_jukebox import jukebox

import maya_jukebox.lib.utils as maya_utils

def writeMaterials(outPath):
    mats = []
    for mat, sg in maya_utils.get_scene_materials():
        mats.extend([mat, sg])
    if not mats:
        return
    cmds.select(mats, replace=True, allDagObjects=False, noExpand=True)
    cmds.file(outPath, exportSelected=True, type="mayaAscii", force=True)

def writeUsdAsset(outPath):  
    import multiverse
    assemblies = cmds.ls(assemblies=True)
    [assemblies.remove(cmds.listRelatives(cam, parent=True)[0]) for cam in cmds.ls(type="camera")][0]
    rootNode = assemblies[0]

    opts = multiverse.AssetWriteOptions()
    opts.writeNormals = True

    opts.writeUVs = True
    opts.writeMaterialAssignment = True
    multiverse.WriteAsset(outPath, rootNode, opts)


def writeUsdComposition(outPath): 
    import multiverse 
    opts = multiverse.CompositionWriteOptions() 
    usdNodes = cmds.listRelatives(cmds.ls(type="mvUsdCompoundShape"),parent=True)
    print("*"*50)
    print(usdNodes)
    multiverse.WriteComposition(outPath, usdNodes, opts)

def publishMaterials(tapeEntity, workfileName, recorder=None):   
    resolver = resolve.Resolver()
    songPath = resolver.filepath_from_asset(tapeEntity, 
                                            tapeEntity.task,
                                            "material",
                                            workfileName,
                                            "ma"
                                            )
    versionNumber = resolver.get_next_version_number(songPath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(songPath, versionNumber):
       writeMaterials(songPath)
       recorder.status = record.Status.PUBLISHED

def publishUsdAsset(tapeEntity, workfileName, recorder=None):   
    resolver = resolve.Resolver()
    songPath = resolver.filepath_from_asset(tapeEntity, 
                                            tapeEntity.task,
                                            "usd",
                                            workfileName,
                                            "usd"
                                            )
    versionNumber = resolver.get_next_version_number(songPath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(songPath, versionNumber):
       writeUsdAsset(songPath)   
       recorder.status = record.Status.PUBLISHED


def publishUsdComposition(tapeEntity, workfileName, recorder=None):   
    resolver = resolve.Resolver()
    songPath = resolver.filepath_from_asset(tapeEntity, 
                                            tapeEntity.task,
                                            "usdComposition",
                                            workfileName,
                                            "usd"
                                            )
    versionNumber = resolver.get_next_version_number(songPath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(songPath, versionNumber):
       writeUsdComposition(songPath)   
       recorder.status = record.Status.PUBLISHED

def publishAsset(mayaFile=None, batch=False):
    if batch:
        cmds.file(new=True, force=True)  # clear scene
        cmds.file(mayaFile, force=True, o=True)

    mayaFile = mayaFile or cmds.file(query=True, l=True)[0]
    mayaFile = mayaFile.replace("\\", "/")
    workfileName = os.path.splitext(os.path.basename(mayaFile))[0]
    tapeEntity = tape.Tape.from_filepath(mayaFile)
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    recorder = record.Recorder()
    
    recorder.archive_workfile(workfileArchivePath, mayaFile)
    publishMaterials(tapeEntity, tapeEntity.name, recorder=recorder)
    publishUsdAsset(tapeEntity, tapeEntity.name, recorder=recorder)

def publishComposition(mayaFile=None, batch=False):
    if batch:
        cmds.file(new=True, force=True)  # clear scene
        cmds.file(mayaFile, force=True, o=True)

    mayaFile = mayaFile or cmds.file(query=True, l=True)[0]
    mayaFile = mayaFile.replace("\\", "/")
    workfileName = os.path.splitext(os.path.basename(mayaFile))[0]
    tapeEntity = tape.Tape.from_filepath(mayaFile)
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    recorder = record.Recorder()
    
    recorder.archive_workfile(workfileArchivePath, mayaFile)
    publishUsdComposition(tapeEntity, tapeEntity.name, recorder=recorder)