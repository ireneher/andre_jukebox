import os
import maya.cmds as cmds 

from core_jukebox import templates
from maya_jukebox.common import os_maya 

def relative_repath(*args):
    print([a for a in args])
    print("----------------- TRIGGERED -------------")
    # referenceNodes = cmds.filePathEditor(query=True, listFiles="", attributeOnly=True, byType="reference")
    # print(referenceNodes)
    # for obj in cmds.ls(type='reference'):
    #     refPath = cmds.referenceQuery(obj, filename=True, unresolvedName=True, withoutCopyNumber=True)
    #     print(refPath)
    #     relPath = refPath.split(ROOT)[-1]
    #     print(relPath)
    #     cmds.file(relPath, loadReference=obj)
    fileNodes = cmds.ls(type = "file") 
    for fileNode in fileNodes:
        texturePath = cmds.getAttr("{}.fileTextureName".format(fileNode))
        relPath =  texturePath.split(templates.MAYA_PROJECT_ROOT)[-1]
        cmds.setAttr("{}.fileTextureName".format(relPath))

def reference_check_callback(*args, filepath=None):
    # args = fileObject
    filepath = filepath or cmds.file(query=True, l=True)[0]
    project_dir = os_maya.find_project_root(filepath)
    reference_path = args[0].rawFullName()
    common_path = reference_path.split(templates.MAYA_PROJECT_ROOT)[-1]
    new_reference_path = os.path.join(project_dir, common_path)
    print("~*"*50)
    print "Callback changed this to %s" % new_reference_path
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