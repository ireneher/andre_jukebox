import os
import maya.cmds as cmds

from core_jukebox.jukebox import tape
from core_jukebox.tape_record import resolve, record
from maya_jukebox.export import main as main_export
from maya_jukebox.export.engines import alembic_engine

from maya_jukebox.anim_jukebox.scene import anim_instance, api

PROJECT_ROOT = "AJ_anim/MAYA"


class Manager(object):
    def __init__(self, anim_instances=None):
        self.instances = anim_instances or api.instances_from_scene()
        self.scene_frame_range = (
            cmds.playbackOptions(query=True, minTime=True),
            cmds.playbackOptions(query=True, maxTime=True),
        )

    def publish(self, instances=None):
        print (self.shot_tape)
        return
        instances = instances or self.instances
        for anim_instance in instances:

            output_path = resolve.Resolver().filepath_from_instance(
                self.shot_tape, "caches", anim_instance.instance
            )
            filepath = os.path.join(output_path, anim_instance.instance, ".abc")
            version_number = resolve.Resolver().get_next_version_number(filepath)

            with record.Recorder().publish_record(filepath, version_number):
                exporter = main_export.Exporter(
                    anim_instance.root_node, frame_range=self.scene_frame_range
                )
                exporter.export(alembic_engine.AbcEngine(), filepath)

    @property
    def shot_tape(self):
        filepath = cmds.file(q=True, sceneName=True)
        # This is even more:
        # Just return the upper folder
        return tape.ShotTape.from_filepath(filepath)      

    @property
    def shot_name(self):
        # TODO : This is pretty hacky...
        filepath = cmds.file(q=True, sceneName=True)
        # This is even more:
        # Just return the upper folder
        shot = os.path.basename(os.path.dirname(filepath))
        return shot
