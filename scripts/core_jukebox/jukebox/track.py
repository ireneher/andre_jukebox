import os
import glob
import logging

from python_lib import parse
from core_jukebox import os_common, path_templates


class VersionName(object):

    TEMPLATE = "{asset}.{:04}.{rep}"
    asset = 0
    version = 1
    representation = 2


class Track(object):
    """This is the main object to describe an output entity.
    The expected hierarchy is:
        -archive
            -output.0001.abc
            -output.0002.abc
        -output.abc
    """

    @classmethod
    def from_filepath(cls, filepath):
        if not os.path.exists(filepath):
            logging.warning("No Track found in: {} ".format(filepath))
            return

        asset_parse = parse.search(path_templates.ASSET_OUTPUT, filepath)
        if asset_parse:
            return cls(asset_parse.asset, filepath)

        shot_parse = parse.search(path_templates.SHOT_OUTPUT, filepath)
        if shot_parse:
            return cls(asset_parse.instance, filepath)

    def __init__(self, name, filepath):
        self.name = name
        self.archive = ""
        self.filepath = ""
        self.root = ""
        # TODO : There's a better way of doing this
        self.representation = filepath.split(".")[-1]

    @property
    def filepath(self):
        # TODO : Standardized this
        """This has to return the right filepath even if the file is not published 
        """
        return os.path.join(self.root, self.name, self.representation)

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
            if not asset == self.name or not rep == self.representation:
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

