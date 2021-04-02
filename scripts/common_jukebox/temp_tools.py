import os
import importlib
from distutils import dir_util

from core_jukebox import templates
from python_lib import parse


# DCC_ROOT}/scenes/assets/{asset_type}/{asset}/workarea/{task}/
#####################################################################################
source = r"{DCC_ROOT}\scenes\assets\{asset_type}\city\assembly\{asset}\\"    
root = r"C:\Users\their\Documents\AJ_source\MAYA\scenes\assets\sets\city\assembly"
#####################################################################################
#####################################################################################
source = r"{DCC_ROOT}\scenes\assets\env\city\workarea\{task}\{asset}\\"    
root = r"C:\Users\their\Documents\AJ_source\MAYA\scenes\assets\sets\city\workarea\model"
#####################################################################################

def remap_template(target=templates.ASSET_WORKAREA):
    source = r"{DCC_ROOT}\scenes\assets\{asset_type}\city\assembly\{asset}\\"    
    # Get all 'paths' in {DCC_ROOT}/scenes/assets folder
    root = r"C:\Users\their\Documents\AJ_source\MAYA\scenes\assets\sets\city\assembly"
    # TODO not recursive (only one level deep) >> I think it's done with next()
    asset_folders = [os.path.join(root, x[0]) for x in next(os.walk(root)) if not os.path.isfile(os.path.join(root, x[0]))]
    print(asset_folders)
    for asset_folder in asset_folders[1:]:
        print("asset folder", asset_folder)
        path = [os.path.join(asset_folder, x[0]) for x in os.walk(asset_folder)][0]
        print(path)
        # Parse path to match source template and get fields
        fields = parse.search(source, path + r"\\").named
        print(fields)
        fields.update({"DCC_ROOT": os.environ["AJ_PROJECT"],
                        "task": "model",
        })
        print(target)
        formatted_target = target.format(**fields)
        print("Copying {} to {}".format(path, formatted_target))
        #dir_util.copy_tree(formatted_source, formatted_target)

        

remap_template()

