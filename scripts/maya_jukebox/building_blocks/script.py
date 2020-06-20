import json
import os
import sys

import maya.standalone
import maya.cmds as cmds

from common_jukebox import os_common
from maya_jukebox.building_blocks import api, utils


def save_bbox_file(outdir="C:/Users/their/Documents/AndreJukebox/MAYA"):
    maya.standalone.initialize()
    asset_paths = os_common.retrieve_assets()
    # Store Bounding Box info for each building asset
    bboxes_info = {}
    for asset_path, asset_name in asset_paths.items():
        cmds.file(new=True, force=True)  # clear scene
        cmds.file(asset_path, o=True, force=True)
        utils.merge_shapes(asset_name)
        bboxes_info[asset_path] = api.get_local_bounding_box(asset_name)
        outfile = os.path.join(outdir, "boundingboxes.json")
    with open(outfile, 'w') as outfile:
        json.dump(bboxes_info, outfile)
    print("uninitiliasing")
    maya.standalone.uninitialize()


if __name__ == "__main__":
    sys.exit(save_bbox_file())
