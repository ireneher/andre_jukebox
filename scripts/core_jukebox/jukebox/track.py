import collections
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
    def from_fields(cls, asset_type, asset, datatype, dcc_root=None):
        dcc_root = dcc_root or templates.MAYA_PROJECT_ROOT
        filepath = templates.ASSET_OUTPUT.parse(DCC_ROOT=dcc_root,
                                                asset_type=asset_type,
                                                asset=asset,
                                                datatype=datatype)
        files = [f for f in os.listdir(filepath) if os.path.isfile(os.path.join(filepath, f))]
        if not files:
            print("No Track found in: {}".format(filepath))
        if len(files)>1:
            print("More than 1 Tape found. Using first")
        file_ = files[0]
        return cls(file_)

    @classmethod
    def from_filepath(cls, filepath):
        if not os.path.exists(filepath):
            print("No Track found in: {} ".format(filepath))
        return cls(filepath)

    def __init__(
        self,
        name,
        filepath,
        task=None,
        shot=None,
        datatype=None,
        instance=None,
        asset=None,
    ):          
        self.filepath = filepath
        self.name = os.path.splitext(os.path.basename(file_)[0]
        self.task = task
        self.asset = asset
        self.shot = shot
        self.datatype = datatype
        self.instance = instance        
        self.root = os.path.dirname(self.filepath)
        self.archive = os.path.join(self.root, "archive")
        self.datatype = os.path.dirname(self.root)        
        self.representation = os.path.splitext(self.filepath)[-1]


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
        if self._get_versions():
            return self.get_versions_dict().keys()[-1]

    @property
    def current_version_number(self):
        if self.current_version:
            return self.get_versions_dict().values()[-1]
            

    def _get_versions(self):
        versions = []
        for version in os.listdir(self.archive):
            # Ignore if it's not the same representation or it doesn't have any version
            rep = parse.parse(templates.VersionFile.TEMPLATE, version).named.get("rep")
            if (
                not self.representation == str(rep)
                or not parse.parse(templates.VersionFile.TEMPLATE, version)[
                    templates.VersionFile.version
                ]
            ):
                continue

            versions.append(version)
        # Sort based on version, not the alphabetical order
        return versions

    def get_versions_dict(self):
        """Map of filepaths and versions in the archive

        Returns:
            OrderedDict: filepath(str) : version(int)
        """
        initial_dict = {}
        for version in self._get_versions():
            initial_dict[version] = int(
                parse.parse(templates.VersionFile.TEMPLATE, version)[
                    templates.VersionFile.version
                ]
            )
        return collections.OrderedDict(sorted(initial_dict.items(), key=lambda t: t[1]))

    def get_version_from_name(self, filepath):
        """Returns the version number based on a path or an file name.
        Args
            filepath (str): Full path or file name.
        Returns:
            str: 4 digit version
        """
        filename = os.path.basename(filepath)
        return int(
            parse.parse(templates.VersionFile.TEMPLATE, filename)[
                templates.VersionFile.version
            ]
        )
