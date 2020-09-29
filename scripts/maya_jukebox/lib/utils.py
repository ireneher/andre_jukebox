import maya.cmds as cmds 

def relative_repath():
    referenceNodes = cmds.filePathEditor(query=True, listFiles="", attributeOnly=True, byType="reference")
    for obj in cmds.ls(type='reference'):
        refPath = cmds.referenceQuery(obj, filename=True, unresolvedName=True, withoutCopyNumber=True)
        relPath = refPath.split(ROOT)[-1]
        cmds.file(relPath, loadReference=obj)

    
    fileNodes = cmds.ls(type = "file") 
    for fileNode in fileNodes:
        texturePath = cmds.getAttr("{}.fileTextureName".format(fileNode))
        relPath =  texturePath.split(ROOT)[-1]
        cmds.setAttr("{}.fileTextureName".format(relPath))

def get_scene_materials():
    for shading_engine in cmds.ls(type='shadingEngine'):
        if cmds.sets(shading_engine, q=True):
            for material in cmds.ls(cmds.listConnections(shading_engine), materials=True):
                yield material, shading_engine