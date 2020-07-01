import contextlib
import os
import shutil
import logging

from core_jukebox.jukebox import project, track

# from core_jukebox import templates

logger = logging.getLogger(__name__)


class Status(object):
    COMPLETE = "complete"
    FAILED = "failed"
    PENDING = "pending"


ARCHIVE_FOLDER = "archive"

class Recorder(object):
    def __init__(self, track, debug_mode=False):
        """ Main engine to copy and archive the new published files.

        Args:
            track (Track): Object that represents an output folder for a certain asset of a specific datatype.
            debug_mode (bool, optional): Prints all returns without actually running. Defaults to False.
        """
        self.track = track
        self.debug_mode = debug_mode

        self.status = Status.PENDING

    def archive_file(self, archive_dir, filepath):
        archive_filepath = get_versioned_path(archive_dir, filepath)
        return shutil.copyfile(filepath, archive_filepath)

    def get_versioned_path(self, archive_path):
        # TODO: Should this take the archive, track or path to asset?
        next_version = self.track.get_next_version_number()
        # TODO: Should this initiate a new track to work as a static method?
        versioned_asset = track.VersionName.TEMPLATE.format(
            self.track.name, next_version, self.track.extension
        )
        return os.path.join(archive_path, versioned_asset)
        # @staticmethod


    def ensure_output_path(self, filepath):
        """ Ensures that the filepath provided will exist 

        Args:
            filepath ([type]): [description]
            track_type ([type], optional): [description]. Defaults to TrackTypes.SHOT.

        Returns:
            [type]: [description]
        """
        if not track.Track.from_filepath(filepath):
            self.create_dirs(filepath)

        return filepath

    def ensure_archive_path(self, filepath):
        """ Ensures that the filepath provided will exist 

        Args:
            filepath ([type]): [description]
            track_type ([type], optional): [description]. Defaults to TrackTypes.SHOT.

        Returns:
            [type]: [description]
        """
        # TODO : This currently doesn't check for the track or even queries the template
        archive_path = os.path.join(os.path.dirname(filepath), ARCHIVE_FOLDER)
        self.create_dirs(archive_path)

        return archive_path

    def create_dirs(self, filepath):
        if not os.path.exists(filepath):
            os.makedirs(filepath)
        return filepath

    @contextlib.contextmanager
    def publish_record(self, filepath, version_number):
        try:
            if not self.debug_mode:
                self.archive_file(self.track.archive, filepath)

            logger.info(
                "Sucessfully Recorded: {} at {}".format(filepath, self.archive_file)
            )

        except:
            self.status = Status.FAILED
            logger.error(
                "Failed to record: {} at {}".format(filepath, self.archive_file)
            )

        else:
            archive_path = self.ensure_archive_path(filepath)

            _, filename = os.path.split(filepath)
            asset, rep = os.path.splitext(filename)

            archive_file = track.InstanceName.TEMPLATE.format(version_number, asset=asset, rep=rep)
            versioned_path = os.path.join(archive_path, archive_file)

            shutil.copyfile(filepath, versioned_path)

            self.status = Status.COMPLETE