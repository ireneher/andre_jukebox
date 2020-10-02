import contextlib
import os
import shutil
import logging

from python_lib import enum, parse
from core_jukebox import jukebox
from core_jukebox import templates

logger = logging.getLogger(__name__)


class Resolver(object):
    def __init__(self):
        """ Resolver to ensure and return the filepaths where to publish to. 
        """
        pass
    
    @staticmethod
    def filepath_from_asset(tape, task, datatype):
        """Fills the template to get a filepath for an asset entity 

        Args:
            asset (AssetTape): [description]
        """
        output_template = templates.ASSET_OUTPUT.format(
            DCC_ROOT=tape.dcc_root,
            asset_type=tape.asset_type,
            asset=tape.name,
            task=task,
            datatype=datatype,
        )
        return os.path.join(jukebox.project.get_project_root(), output_template)

    def filepath_from_instance(self, tape, datatype, instance):
        """Fills the template to get a filepath for a shot entity 

        Args:
            shot (ShotTape): [description]
            instance ([type]): [description]
        """
        output_template = templates.SHOT_OUTPUT.format(
            DCC_ROOT=tape.dcc_root,
            shot=tape.name,
            task=tape.task,
            datatype=datatype,
            instance=instance,
        )
        return os.path.join(jukebox.project.get_project_root(), output_template)

    @staticmethod
    def asset_from_instance(instance_name):
        """Splits the instance name based on the default instance template
        Args:
            instance_name (str)
        Returns:
            parse.Result: (asset, instance) Acts as a tuple by default or dict
        """
        return parse.parse(templates.Instance.TEMPLATE, instance_name)

    def get_next_version_number(self, filepath):
        track_obj = jukebox.track.Track.from_filepath(filepath)
        if track_obj and track_obj.current_version_number:
            return track_obj.current_version_number + 1
        else:
            return 1

