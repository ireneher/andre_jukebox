import os
import shutil

import maya.cmds as cmds


def create_dir(root, directory):
    path = os.path.join(root, directory)
    if not os.path.exists(path):
        os.makedirs(path)
    return path


def get_next_version(archive_path):
    versions = []
    for file in os.listdir(archive_path):
        if file:
            filename, _ = os.path.splitext(file)
            versions.append(int(filename.split(".")[-1]))
    return max(versions) + 1 if versions else 1


def get_versioned_path(archive_path, asset_path):
    next_version = get_next_version(archive_path)
    _, asset_filename = os.path.split(asset_path)
    asset_name, ext = os.path.splitext(asset_filename)
    versioned_asset = "{}.{:04}{}".format(asset_name, next_version, ext)
    return os.path.join(archive_path, versioned_asset)


def archive_file(archive_dir, filepath):
    archive_filepath = get_versioned_path(archive_dir, filepath)
    shutil.copyfile(filepath, archive_filepath)


def get_scene_materials():
    for shading_engine in cmds.ls(type='shadingEngine'):
        if cmds.sets(shading_engine, q=True):
            for material in cmds.ls(cmds.listConnections(shading_engine), materials=True):
                yield material, shading_engine


def get_material_texture_root(material):
    # Get texture filepath connected via File node to the shading node color attr
    file_node = cmds.connectionInfo("{}.color".format(material), sfd=True).split(".")[0]
    if cmds.objExists(file_node):
        texture_path = cmds.getAttr("{}.fileTextureName".format(file_node))
        # Remove last part of the texture filename ({}_Diffuse.png) to get texture root
        texture_root = ("_").join(os.path.basename(texture_path).split("_")[0:-1])
        return texture_root


def walk_up_path(path):
    """
    os.walk from path to paths above (bottom to top)
    """
    path = os.path.realpath(path)
    names = os.listdir(path)
    dirs, nondirs = [], []
    for name in names:
        if os.path.isdir(os.path.join(path, name)):
            dirs.append(name)
        else:
            nondirs.append(name)

    yield path, dirs, nondirs

    upper_path = os.path.realpath(os.path.join(path, '..'))
    if upper_path == path:
        return

    for x in walk_up_path(upper_path):
        yield x


def find_project_root(path):
    """
    Given path inside project, find the Maya project root
    """
    for upper_dir, _, _ in walk_up_path(path):
        if os.path.exists(os.path.join(upper_dir, "workspace.mel")):
            return upper_dir

            

def remove_student_license(path):
    if os.path.isfile(path):
        with open(path, 'r') as f:
            lines = f.readlines()
        with open(path, 'w') as f:
            for l in lines:
                if l.strip("\n") != 'fileInfo "license" "student";':
                    f.write(l)
            f.truncate()
  
