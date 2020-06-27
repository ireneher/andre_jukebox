import json
import os
import sys

import maya.standalone
import maya.cmds as cmds

from scripts.core_jukebox import os_common
from scripts.maya_jukebox.building_blocks import api, utils


def save_bbox_file(
    outdir="C:/Users/their/dev/andre_jukebox/scripts/maya_jukebox/building_blocks",
    project_root="C:/Users/their/Documents/AndreJukebox/MAYA",
):
    maya.standalone.initialize()
    cmds.loadPlugin("mtoa")
    asset_paths = os_common.retrieve_assets()
    # Store Bounding Box info for each building asset
    bboxes_info = {}
    for asset_path, asset_name in asset_paths.items():
        cmds.file(new=True, force=True)  # clear scene
        cmds.file(asset_path, o=True, force=True)
        utils.merge_shapes(asset_name)
        rel_asset_path = os.path.relpath(asset_path, project_root)
        bboxes_info[rel_asset_path] = api.get_local_bounding_box(asset_name)
    outfile = os.path.join(outdir, "boundingboxes.json")
    with open(outfile, "w") as outfile:
        json.dump(bboxes_info, outfile)
    print("uninitiliasing")
    maya.standalone.uninitialize()


if __name__ == "__main__":
    sys.exit(save_bbox_file())
