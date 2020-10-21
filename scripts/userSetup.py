print("****INITIALIZING MAYA_JUKEBOX****")
import maya.api.OpenMaya as OpenMaya
import maya.cmds as cmds

from maya_jukebox.lib import utils
import maya_jukebox.maya_startup as maya_startup

OpenMaya.MSceneMessage.addCheckFileCallback(OpenMaya.MSceneMessage.kBeforeReferenceCheck, utils.reference_check_callback)
OpenMaya.MSceneMessage.addCallback(OpenMaya.MSceneMessage.kAfterOpen, utils.relative_repath)

cmds.evalDeferred(maya_startup.set_project)
cmds.evalDeferred(maya_startup.load_project_plugins)
cmds.evalDeferred(maya_startup.append_to_path)


