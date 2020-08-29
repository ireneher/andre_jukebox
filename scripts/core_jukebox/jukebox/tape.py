import glob
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
                parsed.named.get("asset"),
                asset_type=parsed.named.get("asset_type"),
                task=parsed.named.get("task"),
                project_root=project.find_project_from_path(os.path.dirname(filepath)),
            )

    @classmethod
    def from_name(cls, name):
        filepath = templates.ASSET.format()

    def __init__(
        self,
        name,
        asset_type=None,
        task=None,
        dcc_root=templates.MAYA_PROJECT_ROOT,
        project_root=None,
    ):
        super(AssetTape, self).__init__(name)
        self.name = name
        self.asset_type = asset_type
        self.dcc_root = dcc_root
        self.task = task
        self.root = templates.ASSET.format(
            DCC_ROOT=self.dcc_root,
            asset_type=self.asset_type,
            asset=self.name,
            task=self.task,
        )
        self.project_root = project_root or project.get_project_root()
        self.absolute_path = os.path.join(self.project_root, self.root)


class ShotTape(Tape):
    @classmethod
    def from_filepath(cls, filepath):
        parsed = parse.search(templates.SHOT, filepath)
        if not parsed:
            logger.warning(
                "Invalid filepath: {} Expected: {}".format(filepath, templates.SHOT)
            )
        else:
            return cls(
                parsed.named.get("shot"),
                task=parsed.named.get("task"),
                project_root=project.find_project_from_path(os.path.dirname(filepath)),
            )

    def __init__(
        self, name, task=None, dcc_root=templates.MAYA_PROJECT_ROOT, project_root=None
    ):
        super(ShotTape, self).__init__(name)
        self.name = name
        self.task = task
        self.dcc_root = dcc_root
        self.root = templates.SHOT.format(
            DCC_ROOT=self.dcc_root, shot=self.name, task=self.task
        )
        self.project_root = project_root or project.get_project_root()
        self.absolute_path = os.path.join(self.project_root, self.root)

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


class SequenceTape(Tape):
    @classmethod
    def from_filepath(cls, filepath):
        parsed = parse.search(templates.SHOT, filepath)
        if not parsed:
            logger.warning(
                "Invalid filepath: {} Expected: {}".format(filepath, templates.SHOT)
            )
        else:
            return cls(
                parsed.named.get("shot"),
                task=parsed.named.get("task"),
                project_root=project.find_project_from_path(os.path.dirname(filepath)),
            )

    def __init__(
        self, name, task=None, dcc_root=templates.MAYA_PROJECT_ROOT, project_root=None, filepath=None
    ):
        super(ShotTape, self).__init__(name)
        self.name = name
        self.task = task
        self.filepath = filepath

    def get_shots():
        shots = subfolders = [ f.path for f in os.scandir(self.filepath) if f.is_dir() and f.name.startswith("SHOT_")]
        return [ShotTape.from_filepath(shot) for shot in shots]
