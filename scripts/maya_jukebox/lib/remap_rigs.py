from os import sys, path

sys.path.append(path.dirname(path.dirname(path.dirname(path.abspath(__file__)))))


from core_jukebox.jukebox import tape, project
from maya_jukebox.common import file_reference, os_maya

import os
import maya.cmds as cmds
import maya.standalone as standalone
import fnmatch

BLACKLIST = ["LAY", "BG"]
PROJECT_ROOT = os_maya.find_project_root(os.path.dirname(os.path.abspath(__file__)))
PROJECT_ROOT = r"C:\Users\their\Dropbox\AJ_anim\MAYA"
SHOTS_FOLDER = r"{}\scenes\Concept_Animatic\SHOTS".format(PROJECT_ROOT)

NAMESPACE_DICT = {
    "CHAR": {"andre_0": r"\scenes\assets\char\andre\outputs\rig\andre_rig.ma"},
    "AMP": {"vox_0": r"\scenes\assets\props\vox\outputs\rig\vox_rig.mb"},
    "PEDAL": {"pedal_0": r"\scenes\assets\props\pedal\outputs\rig\pedal_rig.mb"},
    "PLANE": {"plane_0" r"\scenes\assets\props\plane\outputs\rig\plane_rig.mb"},
    "MIC": {"mic_0": r"\scenes\assets\props\mic\outputs\rig\mic_rig.mb"},
}


def remap_references():

    remaped = []
    not_found = []

    for reference in file_reference.FileReference.ls_references():
        if (
            reference.namespace in NAMESPACE_DICT.keys()
            and not reference.namespace in BLACKLIST
        ):
            reference.namespace = NAMESPACE_DICT.get(reference.namespace).keys()[0]
            reference.filepath = NAMESPACE_DICT.get(reference.namespace).values()[0]
            remaped.append(reference)
        else:
            not_found.append(reference)

    if not_found:
        print(
            "Reference: {} not found in the project folder skipping asset.".format(
                not_found
            )
        )
    return remaped


def remap_files():

    standalone.initialize()

    anim_scenes = []
    print(SHOTS_FOLDER)
    for root, dirnames, filenames in os.walk(SHOTS_FOLDER):
        for filename in fnmatch.filter(filenames, "SHOT_*.ma"):
            anim_scenes.append(os.path.join(root, filename))
    print(anim_scenes)
    for scene in anim_scenes:
        cmds.workspace(PROJECT_ROOT, openWorkspace=True)
        # cmds.file(new=True, force=True)
        cmds.file(scene, o=True, ignoreVersion=True, force=True)

        remap_references()

        cmds.file(save=True, force=True)

    standalone.uninitialize()


remap_files()
