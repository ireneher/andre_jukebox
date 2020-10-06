print("****INITIALIZING MAYA_JUKEBOX****")
import maya.api.OpenMaya as OpenM
import maya.cmds as cmds

from maya_jukebox import lib as maya_lib
import maya_jukebox.maya_startup as maya_startup

OpenM.MEventMessage.addEventCallback("PreFileOpened", maya_lib.utils.relative_repath)

# cmds.evalDeferred(maya_startup.set_project)
# cmds.evalDeferred(maya_startup.load_project_plugins)
# cmds.evalDeferred(maya_startup.append_to_path)




