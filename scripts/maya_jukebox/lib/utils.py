import os
import maya.cmds as cmds 

from core_jukebox import templates
from maya_jukebox.common import os_maya 

def relative_repath(*args):
    print("----------------- Relative Repath -------------")
    import maya.cmds as cmds
    from core_jukebox import templates
    fileNodes = cmds.ls(type = "file") 
    for fileNode in fileNodes:
        texturePath = cmds.getAttr("{}.fileTextureName".format(fileNode))
        relPath =  texturePath.split(templates.MAYA_PROJECT_ROOT)[-1]
        while relPath.startswith("/"):
            relPath = "/".join(relPath.split("/")[1:])
        print("--- {}".format(relPath))
        cmds.setAttr("{}.fileTextureName".format(fileNode), relPath, type="string")
        
def reference_check_callback(*args):
    # args = fileObject
    project_dir = os_maya.find_project_root(cmds.file(query=True, l=True)[0])
    reference_path = args[0].rawFullName()
    common_path = reference_path.split("{}//".format(templates.MAYA_PROJECT_ROOT))[-1]
    #new_reference_path = os.path.join(project_dir, common_path)
    new_reference_path = common_path
    print("~*"*50)
    print "Callback changed {} to {}".format(reference_path, new_reference_path)
    args[0].setRawFullName(new_reference_path)  

    #OpenMaya.MScriptUtil.setBool(args[0], True)

def get_scene_materials():
    for shading_engine in cmds.ls(type='shadingEngine'):
        if cmds.sets(shading_engine, q=True):
            for material in cmds.ls(cmds.listConnections(shading_engine), materials=True):
                yield material, shading_engine

def remove_student_license(path):
    if os.path.isfile(path):
        with open(path, "r") as f:
            lines = f.readlines()
        with open(path, "w") as f:
            for l in lines:
                if l.strip("\n") != 'fileInfo "license" "student";':
                    f.write(l)
            f.truncate()