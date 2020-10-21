import os

import multiverse
import maya.cmds as cmds
import core_jukebox.jukebox.tape as tape
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

def publishMaterials(tapeEntity, workfileName, recorder=None):   
    # songEntity = song.Song.from_fields(tapeEntity.asset_type,
    #                                 tapeEntity.name,
    #                                 "material",
    #                                 dcc_root=tapeEntity.dcc_root)
    resolver = resolve.Resolver()
    songPath = resolver.filepath_from_asset(tapeEntity, 
                                            tapeEntity.task,
                                            "material",
                                            workfileName,
                                            "usd"
                                            )
    print("~~~~~~~~~~~~")
    print(songPath)
    versionNumber = resolver.get_next_version_number(songPath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(songPath, versionNumber):
       writeMaterials(songPath)

def publishUsdAsset(tapeEntity, workfileName, recorder=None):   
    # songEntity = song.Song.from_fields(tapeEntity.asset_type,
    #                                 tapeEntity.name,
    #                                 "usd",
    #                                 dcc_root=tapeEntity.dcc_root)
    resolver = resolve.Resolver()
    songPath = resolver.filepath_from_asset(tapeEntity, 
                                            tapeEntity.task,
                                            "usd",
                                            workfileName,
                                            "usd"
                                            )
    versionNumber = resolver.get_next_version_number(songEntity.filepath)

    recorder = recorder or record.Recorder()
    with recorder.publish_record(songPath, versionNumber):
       writeUsdAsset(songPath)   


def publishUsdComposition(tapeEntity, recorder=None):   
    # songEntity = song.Song.from_fields(tapeEntity.asset_type,
    #                                 tapeEntity.name,
    #                                 "usdComposition",
    #                                 dcc_root=tapeEntity.dcc_root)
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

def publishAsset():
    mayaFile = cmds.file(query=True, l=True)[0]
    workfileName = os.path.splitext(os.path.basename(mayaFile))[0]
    tapeEntity = tape.Tape.from_filepath(mayaFile)
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    print(workfileArchivePath)
    recorder = record.Recorder()
    
    recorder.archive_workfile(workfileArchivePath, mayaFile)
    publishMaterials(tapeEntity, workfileName, recorder=recorder)
    publishUsdAsset(tapeEntity, workfileName, recorder=recorder)

def publishComposition():
    mayaFile = cmds.file(query=True, l=True)[0]
    workfileName = os.path.splitext(os.path.basename(mayaFile))[0]
    tapeEntity = tape.Tape.from_filepath(mayaFile)
    workfileArchivePath = tapeEntity.get_workfile_archive_path()
    recorder = record.Recorder()
    
    recorder.archive_workfile(workfileArchivePath, mayaFile)
    publishUsdComposition(tapeEntity, workfileName, recorder=recorder)