# import maya.cmds as cmds
import maya.OpenMaya as om

from scripts.common_jukebox.jukebox import tape
from scripts.maya_jukebox.common import file_reference


class AnimInstance(object):
    """
    """

    def __init__(self, file_reference, asset_tape=None):
        # super(AnimInstance, self).__init__(refnode)

        self.file_ref = file_reference
        self.asset_tape = asset_tape or tape.AssetTape.from_filepath(
            file_reference.filepath
        )

    @property
    def instance(self):
        return self.file_ref.namespace

    @instance.setter
    def instance(self, new_instance):
        self.file_ref.namespace = new_instance
