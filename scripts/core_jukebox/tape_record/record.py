import contextlib
import os
import shutil
import logging

from core_jukebox.jukebox import project, track
from core_jukebox import templates

# from core_jukebox import templates

logger = logging.getLogger(__name__)


class Status(object):
    PENDING = "pending"
    FAILED = "failed"
    PUBLISHED = "published"
    ARCHIVED = "archived"
    COMPLETE = "complete"


ARCHIVE_FOLDER = "archive"


class Recorder(object):
    def __init__(self, debug_mode=False):
        """ Main engine to copy and archive the new published files.

        Args:
            track (Track): Object that represents an output folder for a certain asset of a specific datatype.
            debug_mode (bool, optional): Prints all returns without actually running. Defaults to False.
        """
        self.debug_mode = debug_mode

        self.status = Status.PENDING

    def archive_file(self, archive_path, filepath, version_number):
        _, filename = os.path.split(filepath)
        asset, rep = os.path.splitext(filename)

        archive_file = templates.VersionFile.TEMPLATE.format(
            version_number, asset=asset, rep=rep
        )
        versioned_path = os.path.join(archive_path, archive_file)

        return shutil.copyfile(filepath, versioned_path)

    def ensure_output_path(self, filepath):
        """ Ensures that the filepath provided will exist 

        Args:
            filepath ([type]): [description]
            track_type ([type], optional): [description]. Defaults to TrackTypes.SHOT.

        Returns:
            [type]: [description]
        """
        if not track.Track.from_filepath(filepath):
            self.create_dirs(os.path.dirname(filepath))

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
            # if self.debug_mode:
            #     pass
            self.ensure_output_path(filepath)
            self.archive_path = self.ensure_archive_path(filepath)
            yield filepath, version_number

        except Exception as e:
            self.status = Status.FAILED
            logger.error("Failed to record: {}".format(filepath))
            raise e
        else:
            if self.status == Status.PUBLISHED and track.Track.from_filepath(filepath):
                self.archive_file(self.archive_path, filepath, version_number)

                self.status = Status.COMPLETE

                logger.info(
                    "Sucessfully Recorded: {} at {}".format(filepath, self.archive_file)
                )
