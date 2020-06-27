import contextlib
import os
import shutil
import logging

from python_lib import enum
from core_jukebox.jukebox import track
from core_jukebox import path_templates

logger = logging.getLogger(__name__)


class TrackTypes(enum.Enum):
    ASSET = path_templates.ASSET_ARCHIVE
    SHOT = path_templates.SHOT_ARCHIVE


class Resolver(object):
    def __init__(self):
        """ Resolver to ensure and return the filepaths where to publish to. 
        """
        pass

    @staticmethod
    def ensure_track(self, filepath, track_type=TrackTypes.SHOT):
        """ Ensures that the filepath provided will create 

        Args:
            filepath ([type]): [description]
            track_type ([type], optional): [description]. Defaults to TrackTypes.SHOT.

        Returns:
            [type]: [description]
        """
        # jukebox.Track will return none without a valid filepath, so create one
        if not track.Track.from_filepath(filepath):
            # TODO: Get project root
            create_dirs("project_root", TrackTypes.SHOT)

        self.track = track.Track.from_filepath(filepath)
        if not self.track:
            logger.error("Failed to create path to track at: {}".format(filepath))
            return

        return self.track

    def create_dirs(self, root, directory):
        path = os.path.join(root, directory)
        if not os.path.exists(path):
            os.makedirs(path)
        return path
