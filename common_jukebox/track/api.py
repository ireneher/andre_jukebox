
from common_jukebox import os as os_lib

class Track(object):
    
    @classmethod
    def from_path(cls, filepath):
        return cls()

    def __init__(self, name):
        self.name = name
        self.archive = ""
        self.path = ""
    
    @property
    def latest_version(self):
        pass

    @property
    def latest_versioned(self):
        pass
        # return os_lib.get_versioned_path(archive_path, asset_path)

    @property
    def latest_version_number(self):
        pass

    def get_products(self):
        pass
    
    def get_versions(self):
        pass

    def get_next_version(self):
        return os_lib.get_next_version(self.archive)
    

class AssetTrack(Track):
    
    def __init__(self, name, asset_type=None):
        super(AssetTrack, self).__init__(name)
        self.name = name
        self.type = asset_type

class ShotTrack(Track):
    
    def __init__(self, name, task=None):
        super(AssetTrack, self).__init__(name)
        self.name = name
        self.task = task 
    