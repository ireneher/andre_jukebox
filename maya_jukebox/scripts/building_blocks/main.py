import os
import json

import maya.cmds as cmds

from maya_jukebox.scripts.building_blocks import api


def build(bboxes_json="boundingboxes.json"):
    with open(os.path.join(cmds.workspace(), bboxes_json)) as f:
        bboxes_data = json.load(f)
        print(bboxes_data)
    selected = cmds.ls(selection=True)
    shapes = cmds.listRelatives(selected, s=True)
    for shape in shapes:
        scene_bbox = api.get_bounding_box(shape)
        closest_asset_bbox = api.get_best_fitting_bbox(scene_bbox, bboxes_data)
        print(closest_asset_bbox)
        # Bring in closest_asset_bbox(0) as reference