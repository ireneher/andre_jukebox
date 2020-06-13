import os
import shutil

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


def retrieve_assets():
    # TODO: get assets_root from config once yaml is decided upon
    ASSETS_PATH="C:\Users\their\Documents\AndreJukebox\MAYA\scenes\REFS"
