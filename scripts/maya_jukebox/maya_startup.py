import os
import sys

import maya.cmds as cmds

import maya_jukebox
from maya_jukebox.common import os_maya

PROJECT_PLUGINS = (
    "cvwrap.mll",
    "grim_IK.mll",
    "meshSnapCommand.mll",
    "mgear_solvers.mll",
)


def set_project():

    project_root = os_maya.find_project_root(os.path.dirname(os.path.abspath(__file__)))

    try:
        cmds.workspace(project_root, openWorkspace=True)
    except:
        print ("No Andre Jukebox project found. Resorting to default")
        pass

def load_project_plugins():
    if not cmds.about(q=True, version=True) == "2018":
        print(
            "Maya Version not compatible with Jukebox project plugins. Skipping loading..."
        )
        return

    for plugin in PROJECT_PLUGINS:
        cmds.evalDeferred(
            "if not cmds.pluginInfo({0}, q=True, loaded=True): cmds.loadPlugin({0})".format(
                plugin
            )
        )
    print ("Sucessfully Loaded plugins: {}".format(PROJECT_PLUGINS))


def append_to_path():
    print("Appending {}".format(os.path.dirname(maya_jukebox.__path__)))
    sys.path.append(
        os.path.dirname(maya_jukebox.__path__)
    )  # Adds andre_jukebox dir to the path

