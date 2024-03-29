import datetime
import glob
import os
import logging

from python_lib import parse
from core_jukebox import os_common, templates
from core_jukebox import jukebox

logger = logging.getLogger(__name__)

class Tape(object):
    @classmethod
    def from_filepath(cls, filepath):
        if not os.path.exists(filepath):
            logging.warning("No Tape found in: {} ".format(filepath))
            return
        asset_parse = parse.search(templates.ASSET_WORKAREA, filepath)
        if asset_parse:
            return AssetTape(asset_parse.named.get("asset"), 
                            asset_type=asset_parse.named.get("asset_type", None),
                            task=asset_parse.named.get("task", None),
                            workfile=os.path.splitext(os.path.basename(filepath))[0])

        shot_parse = parse.search(templates.SHOT_WORKAREA, filepath)
        if shot_parse:
            return ShotTape(shot_parse.named.get("instance"), task=shot_parse.named.get("task", None))

    def __init__(self, name):
        self.name = name


class AssetTape(Tape):
    @classmethod
    def from_filepath(cls, filepath):
        parsed = parse.search(templates.ASSET_WORKAREA, filepath)
        if not parsed:
            logger.warning(
                "Invalid filepath: {} Expected: {}".format(filepath, templates.ASSET)
            )
        else:
            return cls(
                parsed.named.get("asset"),
                asset_type=parsed.named.get("asset_type"),
                task=parsed.named.get("task"),
                project_root=jukebox.project.find_project_from_path(os.path.dirname(filepath)),
                workfile=os.path.splitext(os.path.basename(filepath))[0]
            )

    def __init__(
        self,
        name,
        asset_type=None,
        task=None,
        dcc_root=templates.MAYA_PROJECT_ROOT,
        project_root=None,
        workfile=None
    ):
        super(AssetTape, self).__init__(name)        
        self.is_shot = False
        self.asset_type = asset_type
        self.dcc_root = dcc_root
        self.task = task
        self.root = templates.ASSET_WORKAREA.format(
            DCC_ROOT=self.dcc_root,
            asset_type=self.asset_type,
            asset=self.name,
            task=self.task,
        )
        self.project_root = project_root or jukebox.project.get_project_root()
        self.project_root = r"C:/Users/their/Documents/AJ_test"
        self.absolute_path = os.path.join(self.project_root, self.root) if self.project_root and self.root else None
        self.workfile = workfile

    def get_workfile_archive_path(self):
        timestamp=datetime.datetime.utcnow().strftime('%Y%m%d_%H%M')
        path = templates.ASSET_WORKFILE_ARCHIVE.format(DCC_ROOT=self.dcc_root,
                                                        asset_type=self.asset_type,
                                                        asset=self.name,
                                                        task=self.task,
                                                        name=self.workfile,
                                                        representation="ma",
                                                        timestamp=timestamp)
        return os.path.join(self.project_root, path)

class ShotTape(Tape):
    @classmethod
    def from_filepath(cls, filepath):
        parsed = parse.search(templates.SHOT_WORKAREA, filepath)
        if not parsed:
            logger.warning(
                "Invalid filepath: {} Expected: {}".format(filepath, templates.SHOT)
            )
        else:
            return cls(
                parsed.named.get("shot"),
                task=parsed.named.get("task"),
                project_root=jukebox.project.find_project_from_path(os.path.dirname(filepath)),
                workfile=os.path.splitext(os.path.basename(filepath))[0]
            )

    def __init__(
        self, name, task=None, dcc_root=templates.MAYA_PROJECT_ROOT, project_root=None, workfile=None
    ):
        super(ShotTape, self).__init__(name)
        self.is_shot = True
        self.name = name
        self.task = task
        self.dcc_root = dcc_root
        self.root = templates.SHOT.format(
            DCC_ROOT=self.dcc_root, shot=self.name, task=self.task
        )
        self.project_root = project_root or jukebox.project.get_project_root()
        self.absolute_path = os.path.join(self.project_root, self.root)
        self.workfile=workfile

    def get_workfile_archive_path(self):
        timestamp=datetime.date.today().strftime('%Y%m%d')
        path = templates.SHOT_WORKFILE_ARCHIVE.format(DCC_ROOT=self.dcc_root,
                                                shot=self.name,
                                                task=self.task,
                                                name=self.workfile,
                                                representation="ma",
                                                timestamp=timestamp)
        return os.path.join(self.project_root, path)

    def get_outputs(self, datatype=None):
        # TODO: Use the template
        path = os.path.join(self.root, "outputs/")
        if datatype:
            path = os.path.join(datatype)
        return [
            jukebox.song.Song(output)
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
                project_root=jukebox.project.find_project_from_path(os.path.dirname(filepath)),
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


def retrieve_tapes_with_types(project_root, dcc_root=templates.MAYA_PROJECT_ROOT):
    """
    Returns dict of type: Tape object
    """
    assets_path = os.path.join(project_root,
                               templates.ASSETS_ROOT.format(dcc_root)
                               )
    assets = {}
    for asset_dir_name in os.listdir(assets_path):
        asset_dir = os.path.join(assets_path, asset_dir_name)
        for asset_filename in os.listdir(asset_dir):
            filepath = os.path.join(asset_dir, asset_filename)
            if os.path.isfile(filepath):
                if asset_dir_name not in assets:
                    assets[asset_dir_name] = tape.Tape.from_filepath(filepath)
                else:
                    assets[asset_dir_name].append(tape.Tape.from_filepath(filepath))

    return assets