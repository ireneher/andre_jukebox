import os
import re

import maya.cmds as cmds

import constants
import utils


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
    for asset_name, obj_path in objs_dict.items():
        print("Processing OBJ for {}".format(asset_name))
        asset_archive = utils.create_dir(assets_dir, os.path.join(asset_name, constants.archive_dir_rel))
        asset_file = os.path.join(os.path.dirname(asset_archive), "{}.ma".format(asset_name))
        cmds.file(new=True, force=True)  # clear scene
        cmds.file(obj_path, i=True, groupReference=True, groupName=asset_name)
        cmds.file(rename=asset_file)

        convert_materials_to_arnold(textures_dir)

        cmds.file(save=True, type="mayaAscii")
        utils.archive_file(asset_archive, asset_file)

        ref_archive = utils.create_dir(refs_dir, os.path.join(asset_name, constants.archive_dir_rel))
        ref_file = os.path.join(os.path.dirname(ref_archive), "{}_ref.ma".format(asset_name))
        cmds.file(rename=ref_file)
        cmds.file(save=True, type="mayaAscii")
        utils.archive_file(ref_archive, ref_file)


def convert_materials_to_arnold(textures_dir):
    for material in utils.get_scene_materials():
        print(material)
        # If material name has single digit at the end, remove it
        if bool(re.search(r"(^|[a-z])\d$", material)):
            material = material[:-1]
        print(material)
        shader = cmds.shadingNode("aiStandardSurface", asShader=True, name="{}_SHD".format(material))
        for component, (map, colourspace) in constants.texture_mappings.items():
            uv_node = cmds.shadingNode("place2dTexture", asUtility=True)
            file_node = cmds.shadingNode("file", asTexture=True)
            cmds.connectAttr('{}.outUV'.format(uv_node), '{}.uvCoord'.format(file_node))
            #if component == "normalCamera":
                # add bump2d node
            cmds.connectAttr('{}.outColor'.format(file_node), '{}.{}'.format(shader, component))
            # TODO set colourspace attr
            map_filepath = os.path.join(textures_dir, "{}_{}.png".format(material, map))
            print(map_filepath)
            if os.path.exists(map_filepath):
                print("yes")
                cmds.setAttr('{}.fileTextureName'.format(file_node), map_filepath, type='string')

        shadingGroup = cmds.sets(shader, renderable=True, empty=True, name="{}_SHD{}".format(material, "SG"))
        cmds.connectAttr("{}.outColor".format(shader), "{}.surfaceShader".format(shadingGroup), force=True)
