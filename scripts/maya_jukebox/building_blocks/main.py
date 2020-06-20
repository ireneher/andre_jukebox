import os
import json
import sys

import maya.cmds as cmds

from maya_jukebox.building_blocks import api


def build(bboxes_json=None):
    bboxes_json = bboxes_json or os.path.join(os.path.dirname(os.path.realpath(__file__)),
                                              "boundingboxes.json")
    with open(bboxes_json) as f:
        bboxes_data = json.load(f)
        # print(bboxes_data)
    selected = cmds.ls(selection=True)
    children = cmds.listRelatives(selected, allDescendents=True, type="transform") or selected
    transforms = cmds.ls(children, transforms=True)
    for transform in transforms:
        scene_bbox = api.get_local_bounding_box(transform)
        closest_asset_bbox = api.get_best_fitting_bbox(scene_bbox, bboxes_data)
        print(closest_asset_bbox)
        # Bring in closest_asset_bbox file as reference
        rotate_pivot = cmds.xform(transform, query=True, worldSpace=True, rotatePivot=True)
        building = cmds.file(closest_asset_bbox, reference=True, returnNewNodes=True)[0]
        print(building)
        cmds.xform(building, rotatePivot=rotate_pivot)


if __name__ == "__main__":
    sys.exit(build())
