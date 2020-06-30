import contextlib
import os
import shutil
import logging

from python_lib import enum, parse
from core_jukebox.jukebox import track
from core_jukebox import path_templates

logger = logging.getLogger(__name__)

# This is not really intuitive since this is the only place we make this distinction
# TODO: Try to make this more connected to the track api
class TrackTypes(enum.Enum):
    ASSET = path_templates.ASSET_ARCHIVE
    SHOT = path_templates.SHOT_ARCHIVE


# TODO : Find a more central place to put this
class InstanceName(object):

    TEMPLATE = "{asset}_{:d}"
    asset = 0
    count = 1

    def parse(self, instance_name):
        return parse.parse(self.TEMPLATE, instance_name)


class Resolver(object):
    def __init__(self):
        """ Resolver to ensure and return the filepaths where to publish to. 
        """
        pass

    @staticmethod
    def filepath_from_asset(self, asset):
        instance

    def filepath_from_instance(self, shot, datatype, instance):
        """Fills the path_template out to get a filepath for a shot entity 

        Args:
            shot ([type]): [description]
            instance ([type]): [description]
        """
        asset = self.asset_from_instance(instance).named.get("asset")
        # TODO: Centralize the mapping of datatype with engines and publishers
        return TrackTypes.SHOT.format(
            shot=shot, datatype=datatype, asset=asset, instance=instance
        )

    @staticmethod
    def asset_from_instance(instance_name):
        """Splits the instance name based on the default instance template
        Args:
            instance_name (str)
        Returns:
            parse.Result: (asset, instance) Acts as a tuple by default or dict
        """
        return InstanceName().parse(instance_name)

    # @staticmethod
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
            self.create_dirs("project_root", TrackTypes.SHOT)

        self.track = track.Track.from_filepath(filepath)
        if not self.track:
            logger.error("Failed to create path to track at: {}".format(filepath))
            return

        return self.track

    def create_dirs(self, root, directory):
        path = os.path.join(root, directory)
        if not os.path.exists(path):
            print path
            os.makedirs(path)
        return path
