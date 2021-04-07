import os
import importlib
from distutils import dir_util
import shutil

from core_jukebox import templates
from python_lib import parse


# DCC_ROOT}/scenes/assets/{asset_type}/{asset}/workarea/{task}/
#####################################################################################
source = r"{DCC_ROOT}\scenes\assets\{asset_type}\city\assembly\{asset}\\"    
root = r"C:\Users\their\Documents\AJ_source\MAYA\scenes\assets\sets\city\assembly"
#####################################################################################
#####################################################################################
# source = r"{DCC_ROOT}\scenes\assets\{asset_type}\city\workarea\{task}\{asset}\\"    
# root = r"C:\Users\their\Documents\AJ_source\MAYA\scenes\assets\sets\city\workarea\model"
#####################################################################################

def remap_template(target=templates.ASSET_WORKAREA):
    # source = r"{DCC_ROOT}\scenes\assets\{asset_type}\city\assembly\{asset}\\"    
    # # Get all 'paths' in {DCC_ROOT}/scenes/assets folder
    # root = r"C:\Users\their\Documents\AJ_source\MAYA\scenes\assets\sets\city\assembly"
    asset_folders = [os.path.join(root, x[0]) for x in next(os.walk(root)) if (not os.path.isfile(os.path.join(root, x[0])) and not x[0].endswith((".mayaSwatches")))]
    for _, dirs, _ in os.walk(root):
        for dirName in dirs:
            if (not os.path.isfile(os.path.join(root, dirName)) and not dirName.endswith((".mayaSwatches", "archive"))):
                asset_folders.append(os.path.join(root, dirName))
        break   #prevent descending into subfolders
    print(asset_folders)

    for asset_folder in asset_folders[1:]:
        # print("asset folder", asset_folder)
        try:
            path = [os.path.join(asset_folder, x[0]) for x in os.walk(asset_folder)][0]
        except IndexError:
            continue
        # print(path)
        # Parse path to match source template and get fields
        fields = parse.search(source, path + r"\\").named
        # print(fields)
        fields.update({"DCC_ROOT": r"C:\Users\their\Documents\AJ_source\MAYA",
                        "task": "model",
        })
        # fields.update({"asset_type":"env"})  # for second set of ROOT SOURCE
        # print(target)
        formatted_target = target.format(**fields)
        print("Copying {} to {}".format(path, formatted_target))
        dir_util.copy_tree(path, formatted_target)
        print("Removing {}".format(path))
        shutil.rmtree(path)
        

remap_template()

