import os
import glob
import logging

from python_lib import parse
from core_jukebox import os_common, templates


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
            # logging.warning("No Track found in: {} ".format(filepath))
            return

        asset_parse = parse.search(templates.ASSET_OUTPUT, filepath)
        if asset_parse:
            return cls(asset_parse.get("asset"), filepath)

        shot_parse = parse.search(templates.SHOT_OUTPUT, filepath)
        if shot_parse:
            return cls(shot_parse.named.get("instance"), filepath)

    def __init__(self, name, filepath):
        self.name = name
        self.filepath = filepath
        self.root = os.path.dirname(self.filepath)
        self.archive = os.path.join(self.root, "archive")
        self.datatype = os.path.dirname(self.filepath)
        self.representation = os.path.splitext(self.filepath)

    # @property
    # def filepath(self):
    #     # TODO : Standardized this with the template
    #     """This has to return the right filepath even if the file is not published
    #     """
    #     return os.path.join(self.root, self.name, self.representation)

    # @property
    # def archive(self):
    #     # TODO : Standardized this with the template
    #     return os.path.join(self.root, "/archive")

    @property
    def current_version(self):
        if self.get_versions():
            return self.get_versions()[-1]

    @property
    def current_version_number(self):
        if self.current_version:
            return self.get_version_from_name(self.current_version)

    def get_versions(self):
        versions = []
        for version in os.listdir(self.archive):
            asset, v, rep = parse.parse(templates.VersionFile.TEMPLATE, version)
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
        return parse.parse(templates.VersionFile.TEMPLATE, filename)[
            templates.VersionFile.version
        ]
