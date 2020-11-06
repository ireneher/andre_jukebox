import os
import sys

import maya.cmds as cmds

import maya_jukebox
from maya_jukebox.common import os_maya

PROJECT_PLUGINS = (
    "cvwrap",
    "grim_IK",
    "meshSnapCommand",
    "mgear_solvers",
    "multiverse"
)


def set_project():

    project_root = os_maya.find_project_root(os.path.dirname(os.path.abspath(__file__)))
    project_root = r"C:\Users\their\Documents\AJ_test\MAYA"
    try:
        cmds.workspace(project_root, openWorkspace=True)
    except:
        print("No Andre Jukebox project found. Resorting to default")
        pass


def load_project_plugins():
    if not cmds.about(q=True, version=True) == "2018":
        print(
            "Maya Version not compatible with Jukebox project plugins. Skipping loading..."
        )
        return

    for plugin in PROJECT_PLUGINS:
        cmds.evalDeferred(
            "if not cmds.pluginInfo({0}, q=True, loaded=True): cmds.loadPlugin({0});cmds.pluginInfo({0}, edit=True, autoload=True)".format(
                plugin
            )
        )
    print("Sucessfully Loaded plugins: {}".format(PROJECT_PLUGINS))


def append_to_path():
    maya_jukebox_path = maya_jukebox.__path__[0]
    print("Appending {}".format(os.path.dirname(maya_jukebox_path)))
    sys.path.append(
        os.path.dirname(maya_jukebox_path)
    )  # Adds andre_jukebox dir to the path
    os.environ["PYTHONPATH"] += os.pathsep + os.path.dirname(maya_jukebox_path)

