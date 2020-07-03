import os
import shutil
import maya.OpenMaya as om
import maya.cmds as cmds

from core_jukebox.jukebox import tape, mapping
from core_jukebox.tape_record import resolve, record
from maya_jukebox.export import main as main_export
from maya_jukebox.export.engines import alembic_engine

from maya_jukebox.anim_jukebox.scene import anim_instance
from maya_jukebox.anim_jukebox.scene import api as scene_api

PROJECT_ROOT = "AJ_anim/MAYA"


class Manager(object):
    def __init__(self, anim_instances=None):
        self.instances = anim_instances or scene_api.instances_from_scene()
        self.scene_frame_range = (
            cmds.playbackOptions(query=True, minTime=True),
            cmds.playbackOptions(query=True, maxTime=True),
        )

    def publish(self, instances=None):

        instances = instances or self.instances
        # Ensure file is saved
        cmds.file(save=True, force=True)

        # for anim_instance in instances:
        #     self.publish_alembic(instances=instances)
        self.publish_workfile()

    @property
    def shot_name(self):
        return self.shot_tape.name

    @property
    def shot_tape(self):
        filepath = cmds.file(q=True, sceneName=True)
        # This is even more:
        # Just return the upper folder
        return tape.ShotTape.from_filepath(filepath)

    def publish_alembic(self, instance):
        output_path = resolve.Resolver().filepath_from_instance(
            self.shot_tape, "caches", anim_instance.instance
        )
        filepath = os.path.join(output_path, "{}{}".format(anim_instance.instance,
                                                           mapping.Datatypes.CACHE))
        version_number = resolve.Resolver().get_next_version_number(filepath)

        instance_geo = [
            anim_instance.geo_node(long=True) or anim_instance.root_node(long=True)
        ]

        recorder = record.Recorder()
        with recorder.publish_record(filepath, version_number):
            exporter = main_export.Exporter(
                instance_geo, frame_range=self.scene_frame_range
            )
            om.MGlobal.displayInfo("Recording {}...".format(anim_instance.instance))
            exporter.export(
                alembic_engine.AbcEngine(),
                filepath,
                exports=instance_geo,
                frame_range=self.scene_frame_range,
            )
            recorder.status = record.Status.PUBLISHED

    def publish_workfile(self):

        maya_file = cmds.file(q=True, sn=True)
        # TODO: move this to core as "archive_workfile"
        output_path = resolve.Resolver().filepath_from_instance(
            self.shot_tape, "workfile", "workfile"
        )
        filepath = os.path.join(
            output_path, os.path.basename(maya_file)
        )
        version_number = resolve.Resolver().get_next_version_number(filepath)
        recorder = record.Recorder()
        with recorder.publish_record(filepath, version_number):
            shutil.copyfile(maya_file, filepath)
            om.MGlobal.displayInfo(
                "Archiving workfile {}...".format(maya_file)
            )

            recorder.status = record.Status.PUBLISHED
