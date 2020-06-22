import os
import json
import sys

import maya.cmds as cmds

from maya_jukebox.building_blocks import api


def build(bboxes_json=None):
    bboxes_json = bboxes_json or os.path.join(
        os.path.dirname(os.path.realpath(__file__)), "boundingboxes.json"
    )
    with open(bboxes_json) as f:
        bboxes_data = json.load(f)
    project_root = cmds.workspace(q=True, rd=True)
    selected = cmds.ls(selection=True)
    children = (
        cmds.listRelatives(selected, allDescendents=True, type="transform") or selected
    )
    transforms = cmds.ls(children, transforms=True)
    for transform in transforms:
        scene_bbox = api.get_local_bounding_box(transform)
        closest_asset_bbox = api.get_best_fitting_bbox(scene_bbox, bboxes_data)
        print("----- Selected asset {} as the closest match".format(closest_asset_bbox))
        asset_path = os.path.join(project_root, closest_asset_bbox)
        # Bring in closest_asset_bbox file as reference
<<<<<<< HEAD
        rotate_pivot = cmds.xform(
            transform, query=True, worldSpace=True, rotatePivot=True
        )
        print(closest_asset_bbox)
        # building = cmds.file(closest_asset_bbox, reference=True)
        # cmds.xform(building, rotatePivot=rotate_pivot)
=======
        new_ref_nodes = cmds.file(asset_path, reference=True, returnNewNodes=True)
        building = cmds.ls(new_ref_nodes, assemblies=True)
        print("----- Created new reference {}".format(str(building)))
        cmds.matchTransform(building, transform, position=True, rotation=True)
>>>>>>> 3f9ffc9591ab004b5dc2501d0a7b2026cf233630


if __name__ == "__main__":
    sys.exit(build())
