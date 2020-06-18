
import os
import glob
import logging
import yaml

from common_jukebox import os_common, parse, path_template

from common_jukebox.track import constants

class VersionName(object):

    TEMPLATE = "{asset}.{:04}.{rep}"
    asset = 0
    version = 1
    extension = 2


class Track(object):
    @classmethod
    def from_filepath(cls, filepath):
        if not os.path.exists(filepath):
            logging.warning("No Track found in: {} ".format(filepath)) 
            return
        
        if os.path.isfile(filepath):
            filename = os.path.basename(filepath)
            asset = filename.split(".")[0]
            
        elif os.path.isdir(filepath):
            if parse 
        return cls()
    
    def __init__(self, filepath):
        self.name = name
        self.archive = ""
        self.filepath = ""
        self.root = ""
        self.extension = ""
    
    @property
    def current_version(self):
        if self.get_versions: 
            return self.get_versions[-1]

    @property
    def current_version_number(self):
        if self.current_version:
            return self.get_version_from_name(self.current_version)

    def get_versions(self):
        versions = []
        for version in os.listdir(self.archive):
            asset, v, rep = parse.parse(VersionName.TEMPLATE, version)
            if not asset == self.name or not rep == self.extension: 
                continue
            versions.append(version)
        return sorted(versions)

    def get_version_from_name(self, filepath):
        """Returns the version number based on a path or an file name.
        Args
            filepath (str): Full path or file name.
        Returns:
            str: 4 digit version
        """
        filename = os.path.basename(filepath)
        return parse.parse(VersionName.TEMPLATE, filename)[VersionName.version]
            

    def get_next_version_number(self):
        return self.current_version_number + 1 if self.current_version_number else 1


