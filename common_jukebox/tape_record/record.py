import os
import shutil

from common_jukebox.track import track

class Recorder(object):

    
    def __init__(self, track, debug_mode=False):
        """ Main generic engine to publish files.

        Args:
            track (Track): Object that represents an output folder for a certain asset of a specific datatype.
            debug_mode (bool, optional): Prints all returns without actually running. Defaults to False.
        """
        self.track = track
        self.debug_mode = debug_mode
    

    @staticmethod
    def ensure_path(self, name):
        track.Track()

    def start_recording(self):
        pass

    def publish_record(self):

        self.archive_file(self.track.archive, self.)
        if self.debug_mode:
            print ("Recorded")

    def archive_file(self, archive_dir, filepath):
        archive_filepath = get_versioned_path(archive_dir, filepath)
        shutil.copyfile(filepath, archive_filepath)

    def get_versioned_path(self, archive_path):
        # TODO: Should this take the archive, track or path to asset?
        next_version = self.track.get_next_version_number()
        # TODO: Should this initiate a new track to work as a static method?
        versioned_asset = track.VersionName.TEMPLATE.format(self.track.name, next_version, self.track.extension)
        return os.path.join(archive_path, versioned_asset)

    def create_dir(self, root, directory):
        path = os.path.join(root, directory)
        if not os.path.exists(path):
            os.makedirs(path)
        return path