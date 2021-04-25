# D:\AndreJukebox\MAYA\scenes\concept_animatic\shots_lgt\shot_060\shot_060_lgt_v01.ma

# from maya_jukebox.usd_jukebox import scripts, publish
# scripts.replace_refs_with_usds()
# publish.publishComposition()

import glob
import sys
import os
import maya.cmds as cmds
import maya.standalone

def extract_version():
    s = re.findall("(?:_v)\d+$",f)
    return (int(s[0]) if s else -1,f)

def main(shots=[]):
    maya.standalone.initialize()
    cmds.loadPlugin("mtoa")
    import multiverse
    import maya_jukebox.usd_jukebox.build as usd_build 
    multiverse.LoadPlugin()
    
    shots_root = os.environ["AJ_PROJECT"]+"/concept_animatic/shots_lgt"
    print(". . . Looking for shots in {}".format(shots_root))
    shot_folder_names = [d for d in os.listdir(shots_root) if d.startswith("shot")]
    for shot_folder_name in shot_folder_names:
        if shots and shot_folder_path not in shots:
            continue
        cmds.file(new=True, force=True)        
        shot_folder_path = os.path.join(shots_root, shot_folder_name)
        print("Processing {}".format(shot_folder_path))
        maya_files = glob.glob('{}/*.m*'.format(shot_folder_path))
        if not maya_files:
            print("\tNo Maya files found at {}.\n\tCreating shot!".format(shot_folder_path))
            shot_filename = "{}_lgt_v01.ma".format(shot_folder_name)
            
        else:
            prev_shot_filename = max(maya_files,key=extract_version)  # get latest version  
            print("\tUpdating {}".format(prev_shot_filename))            
            prev_version = int(prev_shot_filename.split("_v")[-1].split(".")[0]) 
            shot_filename = prev_shot_filename.replace(prev_version, prev_version + 1)            
            cmds.file(os.path.join(shot_folder_path, prev_shot_filename), o=True)

        print("\tBuilding {}".format(shot_filename))
        shot_filepath = os.path.join(shot_folder_path, shot_filename)
        print(shot_filepath)        
        cmds.file(rename=shot_filepath)
        usd_build.buildSet("city")
        cmds.file(save=True, type="mayaAscii")

    print("uninitiliasing")
    maya.standalone.uninitialize()

    return 0


if __name__ == "__main__":
    shots = sys.argv[1:] or []
    print(shots)
    sys.exit(main())
