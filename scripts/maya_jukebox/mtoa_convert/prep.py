import maya.standalone
import maya.cmds as cmds
import fnmatch
import os
import json

import constants

def export_interior_mappings(fbx_source_folder="C:\\Users\\their\\Documents\\AndreJukebox\\fbx_refs",
                             json_out_dir="C:\\Users\\their\\dev\\andre_jukebox\\scripts\\maya_jukebox\\mtoa_convert"):

    maya. standalone.initialize()
    cmds.loadPlugin("fbxmaya")
    cmds.loadPlugin("mtoa")
    interior_mapping = {}
    fbx_paths = []
    for root, dirnames, filenames in os.walk(fbx_source_folder):
        for filename in fnmatch.filter(filenames, '*.fbx'):
            fbx_paths.append(os.path.join(root, filename))
    nonclean={}
    for fbx_path in fbx_paths:
        print(fbx_path)
        cmds.file(new=True, force=True)
        cmds.file(fbx_path, o=True, ignoreVersion=True)
        for interior_name_pattern in constants.interior_naming:
            for transform in cmds.ls(interior_name_pattern, transforms=True):
                shader_engine = cmds.listConnections(cmds.listHistory(transform), type = 'shadingEngine')
                shaders = cmds.ls(cmds.listConnections(shader_engine), materials= True)
                if shaders:
                    shader = shaders[0]
                    nonclean[transform] = shaders[0]
                    if "_exposition_" not in transform and "_Shop_interior_" not in transform:
                        transform = ("_").join(transform.split("_")[0:-1])
                        shader_root = shader.split("_")[0].lower()
                        shader = ("_").join((shader_root,("_").join(shader.split("_")[1:-1])))
                    else:
                        shader_root = shader.split("_")[0].upper()
                        shader = ("_").join((shader_root,("_").join(shader.split("_")[1:])))
                    interior_mapping[transform] = shader
    
    outfile = os.path.join(json_out_dir, "interior_mappings.json")
    with open(outfile, "w") as outfile:
        json.dump(interior_mapping, outfile)

    print("_---------_")
    print(interior_mapping)
    maya.standalone.uninitialize()



export_interior_mappings()