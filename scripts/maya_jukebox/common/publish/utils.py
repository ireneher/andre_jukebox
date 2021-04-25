
import maya.cmds as cmds

def sanitise(asset, filepath):
    #   . delete all refs (if present)
    
    # 	. delete all aovs
    for node in cmds.ls(type="aiAOV"):
        if not cmds.referenceQuery(node, inr=1):
            cmds.delete(node)

    # 	. delete arnold nodes, global render settings