import os
import shutil
import maya.OpenMaya as om
import maya.cmds as cmds

from core_jukebox.jukebox import tape
from core_jukebox.tape_record import resolve, record

from maya_jukebox.lib import attributes

PROJECT_ROOT = "AJ_anim/MAYA"

ASSET_ATTRIBUTE = "AJ_Asset"
RIG_VERSION_ATTRIBUTE = "AJ_Rig_Version"

class Manager(object):
    def __init__(self, root_node=None):
        
        print ("Launching rigging manager...")
        self.root_node = ""
        self.set_root(root_node)
        
    def publish(self):

        # Ensure file is saved
        # cmds.file(save=True, force=True)

        self.publish_workfile()
        self.publish_rig()
    
    def set_root(self, node=None):

        if node:
            self.root_node = node
            return self.root_node

        else:
            selection = cmds.ls(selection=True)
            
            if not len(selection) == 1:
                om.MGlobal.displayWarning("Please select one top group")
                return

            self.root_node = selection[0]

            return self.root_node

    @property
    def rig_name(self):
        return self.asset_tape.name

    @property
    def asset_tape(self):
        filepath = cmds.file(q=True, sceneName=True)
        # This is even more:
        # Just return the upper folder
        return tape.AssetTape.from_filepath(filepath)

    def publish_workfile(self):

        maya_file = cmds.file(q=True, sn=True)
        # TODO: move this to core as "archive_workfile"
        output_path = resolve.Resolver().filepath_from_instance(
            self.asset_tape, "workfile", "workfile"
        )
        filepath = os.path.join(
            output_path, os.path.basename(maya_file)
        )
        version_number = resolve.Resolver().get_next_version_number(filepath)
        recorder = record.Recorder()

        with recorder.publish_record(filepath, version_number):
            shutil.copyfile(maya_file, filepath)
            om.MGlobal.displayInfo(
                "Archiving workfile {}...".format(maya_file)
            )

            recorder.status = record.Status.PUBLISHED

    def publish_rig(self):

        maya_file = cmds.file(q=True, sn=True)
        # Ignore incremental versions
        basename = maya_file.split(".")[0]

        # TODO: move this to core as "archive_workfile"
        output_path = resolve.Resolver().filepath_from_asset(
            self.asset_tape, "rigging", "rig"
        )
        filepath = os.path.join(
            output_path, basename
        )
        version_number = resolve.Resolver().get_next_version_number(filepath)

        self.tag_rig(self.asset_tape.name, version_number)

        recorder = record.Recorder()

        with recorder.publish_record(filepath, version_number):
            # shutil.copyfile(maya_file, filepath)
            print (filepath)
            om.MGlobal.displayInfo(
                "Publishing rig {}...".format(maya_file)
            )

            recorder.status = record.Status.PUBLISHED


    def tag_rig(self, asset, version_number):
        attributes.set_string_attr(self.root_node, ASSET_ATTRIBUTE, asset, lock=True)
        attributes.set_string_attr(self.root_node, RIG_VERSION_ATTRIBUTE, version_number, lock=True)