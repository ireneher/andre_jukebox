# import maya.cmds as cmds
import maya.OpenMaya as om
import maya.cmds as cmds

from core_jukebox.jukebox import tape
from maya_jukebox.common import file_reference


class AnimInstance(object):
    """
    """

    def __init__(self, file_reference):
        # super(AnimInstance, self).__init__(refnode)

        self.file_ref = file_reference

    @property
    def instance(self):
        return self.file_ref.namespace

    @instance.setter
    def instance(self, new_instance):
        self.file_ref.namespace = new_instance

    @property
    def asset_tape(self):
        return tape.AssetTape.from_filepath(self.file_ref.filepath)

    def root_node(self, long=False):
        # Kinda shady, might want to do this a better way...
        root_node = cmds.ls("{}:*".format(self.instance), assemblies=True, long=long)
        if root_node:
            return root_node[0]

    def geo_node(self, long=False):
        # Kinda shady, might want to do this a better way...
        geo_node = cmds.ls("{}:geo".format(self.instance), long=long)
        if geo_node:
            return geo_node[0]
