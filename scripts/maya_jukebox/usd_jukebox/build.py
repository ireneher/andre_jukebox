import os

import multiverse as mv
import maya.cmds as cmds

from core_jukebox import jukebox
from maya_jukebox.usd_jukebox import query

def buildSet(assetName, assetType="sets"):
    setSong = jukebox.song.Song.from_fields(assetType, assetName, "usdComposition", assetName, repr="usd")
    usdCompound = mv.CreateUsdCompound(setSong.filepath)
    usdCompositionNode = cmds.listRelatives(usdCompound, parent=True)
    usdMetadata = mv.GetUsdMetadata(usdCompound)
    for data in usdMetadata:
        componentPath = data["identifier"]
        if componentPath.lower() == setSong.filepath.lower():
            continue
        # Get song from filepath
        usdSong = jukebox.song.Song.from_filepath(componentPath)
        matSong = query.getUsdDependencies(usdSong.asset, assetType=usdSong.asset_type)["material"]
        # Load Material
        cmds.file(matSong.filepath, reference=True, namespace=usdSong.asset)
        # Set material namespace
        mvSetNode = cmds.createNode("mvSet", name="mvSet_{}".format(usdSong.asset))
        cmds.setAttr("{}.materialNamespaceEnable".format(mvSetNode), 1.0)
        cmds.setAttr("{}.materialNamespace".format(mvSetNode), usdSong.asset, type="string")
        mv.AddAttributeSetOverride(usdCompound, '/{}'.format(usdSong.asset), mvSetNode)

def buildAsset(assetName, assetType="prop"):
    propSong = jukebox.song.Song.from_fields(assetType, assetName, "usd", assetName, repr="usd")
    usdCompound = mv.CreateUsdCompound(propSong.filepath)
    usdCompositionNode = cmds.listRelatives(usdCompound, parent=True)
    usdMetadata = mv.GetUsdMetadata(usdCompound)
    for data in usdMetadata:
        componentPath = data["identifier"]
        if componentPath.lower() == propSong.filepath.lower():
            continue
        # Get song from filepath
        usdSong = jukebox.song.Song.from_filepath(componentPath)
        matSong = query.getUsdDependencies(usdSong.asset, assetType=usdSong.asset_type)["material"]
        # Load Material
        cmds.file(matSong.filepath, reference=True, namespace=usdSong.asset)
        # Set material namespace
        mvSetNode = cmds.createNode("mvSet", name="mvSet_{}".format(usdSong.asset))
        cmds.setAttr("{}.materialNamespaceEnable".format(mvSetNode), 1.0)
        cmds.setAttr("{}.materialNamespace".format(mvSetNode), usdSong.asset, type="string")
        mv.AddAttributeSetOverride(usdCompound, '/{}'.format(usdSong.asset), mvSetNode)

        # Add animation layer
        # TODO query 
        mv.AddUsdCompoundAssetPath(usdCompositionNode, usdAnimPath)
        # Add lattice layer
        # TODO query 
         mv.AddUsdCompoundAssetPath(usdCompositionNode, usdModifierPath)

    

