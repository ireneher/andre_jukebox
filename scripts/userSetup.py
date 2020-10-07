print("****INITIALIZING MAYA_JUKEBOX****")
import maya.api.OpenMaya as OpenMaya
import maya.cmds as cmds

from maya_jukebox.lib import utils
import maya_jukebox.maya_startup as maya_startup

id = OpenMaya.MSceneMessage.addCheckFileCallback(OpenMaya.MSceneMessage.kBeforeReferenceCheck, utils.reference_check_callback)

# cmds.evalDeferred(maya_startup.set_project)
# cmds.evalDeferred(maya_startup.load_project_plugins)
# cmds.evalDeferred(maya_startup.append_to_path)


