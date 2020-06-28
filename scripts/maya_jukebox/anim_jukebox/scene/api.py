# import maya.cmds as cmds
import maya.OpenMaya as om

from core_jukebox.jukebox import tape
from maya_jukebox.common import file_reference


def instances_from_scene():
    """
    Returns:
        list: List of anim_instance.AnimInstances()
    """
    instances = []
    not_found = []

    for reference in file_reference.FileReference.ls_references():
        tape_obj = tape.AssetTape.from_filepath(reference.filepath)
        if tape_obj:
            instances.append(tape_obj)

    if not_found:
        # Might need to add a filter if sets or other references make this to noisy
        om.MGlobal.displayWarning(
            "Reference: {} not found in the project folder skipping asset.".format(
                not_found
            )
        )
    return instances
