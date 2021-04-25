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

    def publish(self, instances=None, archive=True, mayaFile=None):
        if archive:
            mayaFile = mayaFile or cmds.file(q=True, sn=True)
            self.publish_workfile(mayaFile=mayaFile)

        instances = instances or self.instances
        # Ensure file is saved
        cmds.file(save=True, force=True)

        self.publish_workfile()
        for instance_obj in instances:
            self.publish_alembic(instance_obj)

    @property
    def shot_name(self):
        return self.shot_tape.name

    @property
    def shot_tape(self):
        filepath = cmds.file(q=True, sceneName=True)
        # This is even more:
        # Just return the upper folder
        return tape.ShotTape.from_filepath(filepath)

    def publish_alembic(self, instance_obj):
        output_path = resolve.Resolver().filepath_from_id(
            self.shot_tape, "caches", instance_obj.instance, mapping.Datatypes.CACHE
        )
        version_number = resolve.Resolver().get_next_version_number(output_path)

        instance_geo = [
            instance_obj.geo_node(long=True) or instance_obj.root_node(long=True)
        ]

        recorder = record.Recorder()
        with recorder.publish_record(filepath, version_number):
            exporter = main_export.Exporter(
                instance_geo, frame_range=self.scene_frame_range
            )
            om.MGlobal.displayInfo("Recording {}...".format(instance_obj.instance))
            exporter.export(
                alembic_engine.AbcEngine(),
                filepath,
                exports=instance_geo,
                frame_range=self.scene_frame_range,
            )
            recorder.status = record.Status.PUBLISHED

    def publish_workfile(self, mayaFile=None):
        maya_file = mayaFile or cmds.file(q=True, sn=True)      
        workfile_path = resolve.Resolver().get_workfile_archive_path(maya_file)
        recorder.archive_workfile(workfile_path, maya_file)

