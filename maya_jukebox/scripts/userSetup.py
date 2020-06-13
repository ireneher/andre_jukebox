print("INITIALIZING MAYA_JUKEBOX")


import sys
sys.dont_write_bytecode = True
# import os
# os.remove("*.pyc")


import maya_startup

# cmds.evalDeferred(maya_startup.set_project)
cmds.evalDeferred(maya_startup.load_rig_plugins)