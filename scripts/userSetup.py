print("INITIALIZING MAYA_JUKEBOX")
from maya_jukebox.scripts import maya_startup

cmds.evalDeferred(maya_startup.set_project)
cmds.evalDeferred(maya_startup.load_rig_plugins)
cmds.evalDeferred(maya_startup.append_to_path)
