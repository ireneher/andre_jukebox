import os
import sys

import maya.cmds as cmds
from maya.api import OpenMaya as om2

import maya_jukebox
from maya_jukebox.common import os_maya as os_lib

PROJECT_PLUGINS: (
    "cvwrap",
    "grim_IK",
    "meshSnapCommand",
    "mgear_solvers",
)


def set_project():
    
    project_root = os_lib.find_project_root(os.path.abspath(__file__))

    try:
        cmds.workspace(project_root, openWorkspace=True)
    except RuntimeError:
        cmds.workspace(project_root, newWorkspace=True)
    finally:
        cmds.workspace(dir=project_root)


def load_rig_plugins():
    if not cmds.about(q=True, version=True) == "2018":
        om2.MGlobal.displayInfo("Maya Version not compatible with Jukebox project plugins. Skipping load...")
        return

    for plugin in PROJECT_PLUGINS:
        cmds.evalDeferred('if not cmds.pluginInfo("{0}", q=True, loaded=True): cmds.loadPlugin("{0}")'.format(plugin))


def append_to_path():
    print("Appending {}".format(os.path.dirname(maya_jukebox.__path__)))
    sys.path.append(os.path.dirname(maya_jukebox.__path__))  # Adds andre_jukebox dir to the path