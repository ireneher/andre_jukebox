import os

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


def publish_objs(objs_dict, assets_dir, refs_dir):
    for asset_name, obj_path in objs_dict.items():
        print("Processing OBJ for {}".format(asset_name))
        asset_archive = utils.create_dir(assets_dir, os.path.join(asset_name, constants.archive_dir_rel))
        asset_file = os.path.join(os.path.dirname(asset_archive), "{}.ma".format(asset_name))
        cmds.file(obj_path, i=True, groupReference=True, groupName=asset_name)
        cmds.file(rename=asset_file)
        # for material in utils.get_scene_materials():
        #     print(material)

        cmds.file(save=True, type="mayaAscii")
        utils.archive_file(asset_archive, asset_file)

        ref_archive = utils.create_dir(refs_dir, os.path.join(asset_name, constants.archive_dir_rel))
        ref_file = os.path.join(os.path.dirname(ref_archive), "{}_ref.ma".format(asset_name))
        cmds.file(rename=ref_file)
        cmds.file(save=True, type="mayaAscii")
        utils.archive_file(ref_archive, ref_file)


def convert_arnold_shader():
    pass