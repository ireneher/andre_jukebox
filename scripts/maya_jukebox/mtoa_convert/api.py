import os
import re
import json

import maya.cmds as cmds
import maya.mel as mel

import constants
import utils


def set_up_dirs(project_root):
    assets_dir = utils.create_dir(project_root, constants.assets_dir_rel)
    refs_dir = utils.create_dir(project_root, constants.refs_dir_rel)
    textures_dir = os.path.join(project_root, constants.textures_dir_rel)

    return assets_dir, refs_dir, textures_dir


def retrieve_objs_mtls(path):
    objs = {}  # {asset_name: obj_path}
    materials = {}  # {asset_name: mtl_path}
    for file in os.listdir(path):
        filename, extension = os.path.splitext(file)
        asset_name = filename.lower()
        filepath = os.path.join(path, file)
        if extension == ".obj":
            objs[asset_name] = filepath
        elif extension == ".mtl":
            materials[asset_name] = filepath

    return objs, materials


def publish_objs(objs_dict, assets_dir, refs_dir, textures_dir):
    total_objs = len(objs_dict)
    idx = 0
    for asset_name, obj_path in objs_dict.items():
        idx += 1
        print("*")*250
        print("Processing OBJ for {}. \n {} out of {}".format(asset_name, idx, total_objs))
        print("*")*250
        asset_archive = utils.create_dir(assets_dir, os.path.join(asset_name, constants.archive_dir_rel))
        asset_file = os.path.join(os.path.dirname(asset_archive), "{}.ma".format(asset_name))
        cmds.file(new=True, force=True)  # clear scene
        cmds.file(obj_path, i=True, groupReference=True, groupName=asset_name, force=True)
        asset_locator = cmds.spaceLocator(name="{}_loc".format(asset_name), position=(0, 0, 0))
        if cmds.objExists(asset_name):
            cmds.parent(asset_name, asset_locator)
        cmds.file(rename=asset_file)

        convert_materials_to_arnold(textures_dir)
        map_interiors(asset_name.upper())
        mel.eval("cleanUpScene 3")
        cmds.file(save=True, type="mayaAscii")
        utils.remove_student_license(asset_file)
        utils.archive_file(asset_archive, asset_file)        

        if idx == total_objs:
            print("-") * 250
            print("Done! Processed {} OBJs.".format(total_objs))
            print("-") * 250


def convert_materials_to_arnold(textures_dir):
    for material, original_shading_group in utils.get_scene_materials():
        shader = cmds.shadingNode("aiStandardSurface", asShader=True, name="{}_SHD".format(material))
        texture_root = utils.get_material_texture_root(material)

        # Set up hypershader graph with texture maps
        for component, (map, colourspace) in constants.texture_mappings.items():
            map_filepath = os.path.join(textures_dir, "{}_{}.png".format(texture_root, map))
            if not os.path.exists(map_filepath):
                continue
            uv_node = cmds.shadingNode("place2dTexture", asUtility=True)
            file_node = cmds.shadingNode("file", asTexture=True)
            file_node = cmds.rename(file_node, os.path.splitext(os.path.basename(map_filepath))[0])
            cmds.setAttr('{}.fileTextureName'.format(file_node), map_filepath, type='string')
            cmds.connectAttr('{}.outUV'.format(uv_node), '{}.uvCoord'.format(file_node))
            cmds.setAttr('{}.colorSpace'.format(file_node), colourspace, type='string')
            cmds.setAttr('{}.ignoreColorSpaceFileRules'.format(file_node), 1)

            alpha_flag = component in constants.alpha_invert  # Alpha is luminance, invert
            out_attr = "outAlpha" if alpha_flag else "outColor"
            if component == "normalCamera":
                # add aiNormalMap node
                normal_map_node = cmds.shadingNode("aiNormalMap", asUtility=True)
                cmds.setAttr('{}.invertY'.format(normal_map_node), 1)
                cmds.connectAttr('{}.{}'.format(file_node, out_attr), '{}.input'.format(normal_map_node), force=True)
                cmds.connectAttr('{}.outValue'.format(normal_map_node), '{}.{}'.format(shader, component), force=True)
            elif component == "specularIOR":
                # add aiRange node
                range_node = cmds.shadingNode("aiRange", asUtility=True)
                cmds.setAttr('{}.outputMin'.format(range_node), 1.32)
                cmds.setAttr('{}.outputMax'.format(range_node), 1.95)
                # ior uses outcolor from map, not outalpha as alpha_flag would suggest
                cmds.connectAttr('{}.outColor'.format(file_node), '{}.input'.format(range_node), force=True)
                cmds.connectAttr('{}.outColorR'.format(range_node), '{}.{}'.format(shader, component), force=True)
            else:
                cmds.connectAttr('{}.{}'.format(file_node, out_attr), '{}.{}'.format(shader, component), force=True)
            if alpha_flag:
                cmds.setAttr('{}.invert'.format(file_node), 1)
                cmds.setAttr('{}.alphaIsLuminance'.format(file_node), 1)
            if component == "transmission":
                cmds.setAttr('{}.invert'.format(file_node), 0)
                cmds.setAttr("{}.caustics".format(shader), 1)
                cmds.setAttr("{}.transmitAovs".format(shader), 1)

        # Create Shading Group for Arnold shader:
        shading_group = cmds.sets(shader, renderable=True, empty=True, name="{}_SHD{}".format(material, "SG"))
        cmds.setAttr("{}.base".format(shader), 1)
        cmds.connectAttr("{}.outColor".format(shader), "{}.surfaceShader".format(shading_group), force=True)

        # Reassign shading groups
        for object in cmds.sets(original_shading_group, q=True, nodesOnly=True):
            cmds.sets(object, e=1, forceElement=shading_group)

def map_interiors(building, interior_mapping_json=None):
    interior_mapping_json = interior_mapping_json or os.path.join(
        os.path.dirname(os.path.realpath(__file__)), "interior_mappings.json"
    )
    with open(interior_mapping_json) as f:
        interior_mapping = json.load(f)
    # load in ref with shader engines
    interiors_ma = os.path.join(os.path.dirname(os.path.abspath(__file__)), "interior_shaders.ma")
    cmds.file(interiors_ma, i=True, groupReference=True, ignoreVersion=True)
    for interior_name_pattern in constants.interior_naming:
        for interior_transform in cmds.ls(interior_name_pattern, transforms=True):
            transform_id = interior_transform.lower()
            if "_exposition_" in interior_transform:
                transform_id = str(cmds.polyEvaluate(interior_transform, v=True))  # vertex count
            print("Processing mapping for {}".format(transform_id))
            if interior_mapping[building].has_key(transform_id):
                shading_group = "{}".format(interior_mapping[building][transform_id])
                print("Assigning {} to transform {}".format(shading_group, interior_transform))
                cmds.sets(interior_transform, e=1, forceElement=shading_group, noWarnings=True)
    
    

def publish_mtoa_convert(path):
    project_root = utils.find_project_root(path)
    if not project_root:
        print("Input path {} is not part of a Maya project".format(path))
        return 1

    print("Project root is {}".format(project_root))
    assets_dir, refs_dir, textures_dir = set_up_dirs(project_root)
    objs, _ = retrieve_objs_mtls(path)
    publish_objs(objs, assets_dir, refs_dir, textures_dir)