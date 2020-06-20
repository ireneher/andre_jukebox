

import os
import yaml
from common_jukebox import os_common
from common_jukebox.track import track


class Tape(object):
    @classmethod
    def from_filepath(cls, filepath):
        return cls()
    
    def __init__(self, name):
        self.name = name

class AssetTape(Tape):
    
    def __init__(self, name, asset_type=None):
        super(AssetTape, self).__init__(name)
        self.name = name
        self.type = asset_type

class ShotTape(Tape):
    
    def __init__(self, name, task=None):
        super(ShotTape, self).__init__(name)
        self.name = name
        self.root = os_lib.getshot
        self.task = task 
    
    
    def get_outputs(self, datatype=None):
        path = os.path.join(self.root, )
        if datatype:
            path = os.path.join(datatype)
            
        return [track.Track(output) for sub_folder in os.listdir(path) for output in os.listdir(sub_folder)]
