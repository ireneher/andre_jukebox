# import maya.cmds as cmds
import maya.OpenMaya as om
import maya.cmds as cmds

from scripts.core_jukebox.jukebox import tape
from scripts.maya_jukebox.common import file_reference


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
        return tape.AssetTape.from_filepath(
            file_reference.filepath
        )
        
    @property
    def root_node(self):
        # Kinda shady, might want to do this a better way...
        return  cmds.ls("{}:*".format(self.instance), assemblies=True)[0]         
