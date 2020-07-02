import os
import logging

from python_lib import parse
from core_jukebox import os_common, templates
from core_jukebox.jukebox import track, project

logger = logging.getLogger(__name__)


class Tape(object):
    @classmethod
    def from_filepath(cls, filepath):
        return cls()

    def __init__(self, name):
        self.name = name


class AssetTape(Tape):
    @classmethod
    def from_filepath(cls, filepath):
        parsed = parse.search(templates.ASSET, filepath)
        if not parsed:
            logger.warning(
                "Invalid filepath: {} Expected: {}".format(filepath, templates.ASSET)
            )
        else:
            return cls(
                parsed.named.get("asset"), asset_type=parsed.named.get("asset_type")
            )

    def __init__(self, name, asset_type=None):
        super(AssetTape, self).__init__(name)
        self.name = name
        self.type = asset_type


class ShotTape(Tape):
    @classmethod
    def from_filepath(cls, filepath):
        parsed = parse.search(templates.SHOT, filepath)
        if not parsed:
            logger.warning(
                "Invalid filepath: {} Expected: {}".format(filepath, templates.SHOT)
            )
        else:
            return cls(parsed.named.get("shot"), task=parsed.named.get("task"))

    def __init__(self, name, task=None, dcc_root=templates.MAYA_PROJECT_ROOT):
        super(ShotTape, self).__init__(name)
        self.name = name
        self.task = task
        self.dcc_root = dcc_root
        self.root = templates.SHOT.format(DCC_ROOT=self.dcc_root, shot=self.name, task=self.task)
        self.absolute_path = os.path.join(project.get_project_root(), self.root)

    def get_outputs(self, datatype=None):
        # TODO: Use the template
        path = os.path.join(self.root, "outputs/")
        if datatype:
            path = os.path.join(datatype)
        return [
            track.Track(output)
            for sub_folder in os.listdir(path)
            for output in os.listdir(sub_folder)
        ]

