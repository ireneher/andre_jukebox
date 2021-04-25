import maya.standalone
import maya.cmds as cmds
import fnmatch
import os
import re
import json

import constants

def export_interior_mappings(fbx_source_folder="C:\\Users\\their\\Documents\\AndreJukebox_Irene\\fbx_refs",
                             json_out_dir="C:\\Users\\their\\dev\\andre_jukebox\\scripts\\maya_jukebox\\mtoa_convert"):
    maya. standalone.initialize()
    cmds.loadPlugin("fbxmaya")
    cmds.loadPlugin("mtoa")
    interior_mapping = {}
    unmapped_shaders = {}
    fbx_paths = []
    for root, dirnames, filenames in os.walk(fbx_source_folder):
        for filename in fnmatch.filter(filenames, "*.fbx"):
            fbx_paths.append(os.path.join(root, filename))
    for fbx_path in fbx_paths:
        print(fbx_path)
        building = os.path.splitext(os.path.basename(fbx_path))[0]
        cmds.file(new=True, force=True)
        cmds.file(fbx_path, o=True, ignoreVersion=True)
        for interior_name_pattern in (constants.INTERIOR, constants.EXPOSITION):
            for transform in cmds.ls(interior_name_pattern, transforms=True):
                interior_name_key = interior_name_pattern
                shader_engine = cmds.listConnections(cmds.listHistory(transform), type = 'shadingEngine')
                shaders = cmds.ls(cmds.listConnections(shader_engine), materials=True, type="phong")
            if shaders:
                shader = shaders[0]
                if interior_name_pattern == constants.INTERIOR:
                    transform_id = transform.lower()
                    if "hop_" in transform:  #  "*hop_interior_*" only has one shader
                        interior_name_key = constants.SHOP_INTERIOR
                        transform = ("_").join(transform.split("_")[0:-1])
                        version = 1
                    elif not shader.startswith(("am215", "AM215")):
                        if unmapped_shaders.has_key(building):
                            unmapped_shaders[building].update({transform: shader})
                        else:
                            unmapped_shaders[building] = {transform: shader}
                        continue
                    else:
                        transform = ("_").join(transform.split("_")[0:-1])
                        version_tail = re.split("_V", shader, flags=re.IGNORECASE)[-1]
                        version = int(version_tail.split("_")[0])

                elif interior_name_pattern == constants.EXPOSITION:
                    if not shader.startswith(("am215", "AM215")):
                        if unmapped_shaders.has_key(building):
                            unmapped_shaders[building].update({transform: shader})
                        else:
                            unmapped_shaders[building] = {transform: shader}
                        continue
                    transform_id = cmds.polyEvaluate(transform, v=True)  # vertex count
                    file_node = cmds.listConnections("{}".format(shader), type="file")
                    if not file_node:
                        continue
                    file_map = cmds.getAttr("{}.fileTextureName".format(file_node[0]))
                    version = int(os.path.splitext(file_map)[0].split("_V")[-1])
                    
                if interior_mapping.has_key(building) and transform_id not in interior_mapping[building].keys():
                    interior_mapping[building].update({transform_id: constants.interior_mapping[interior_name_key].format(version)})
                elif not interior_mapping.has_key(building):
                    interior_mapping[building] = {transform_id: constants.interior_mapping[interior_name_key].format(version)}
                        
    outfile = os.path.join(json_out_dir, "interior_mappings.json")
    with open(outfile, "w") as outfile:
        json.dump(interior_mapping, outfile)

    unmapped_outfile = os.path.join(json_out_dir, "unmapped_shaders.json")
    with open(unmapped_outfile, "w") as unmapped_outfile:
        json.dump(unmapped_shaders, unmapped_outfile)

    print("_---------_")
    print(interior_mapping)

    maya.standalone.uninitialize()
 
export_interior_mappings()
