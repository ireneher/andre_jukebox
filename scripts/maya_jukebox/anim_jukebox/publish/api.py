import os
import maya.cmds as cmds

from core_jukebox.tape_record import resolve, record
from maya_jukebox.export import main as main_export
from maya_jukebox.export.engines import alembic_engine

from maya_jukebox.anim_jukebox.scene import anim_instance, scene


class Manager(object):
    def __init__(self, anim_instances=None):
        self.instances = anim_instances or scene.instances_from_scene()

        self.scene_frame_range = (
            cmds.playbackOptions(query=True, minTime=True),
            cmds.playbackOptions(query=True, maxTime=True),
        )

    def publish(self, instances=None):
        instances = instances or self.instances
        # TODO :look how to run these in parallel
        for instance in instances:
            track = resolve.ensure_track()
            # Might not need this later
            filepath = os.path.join(track.root, track.name, track.representation)

            with record.publish_record(filepath):
                exporter = main_export.Exporter(
                    instance.root_node, frame_range=self.scene_frame_range
                )
                exporter.export(alembic_engine.AbcEngine(), filepath)

