import os
import traceback
from contextlib import contextmanager

import maya.cmds as cmds
# import maya.OpenMayaUI as omui

from art_playblast import viewport 


PLAYBLAST_WINDOW = "playblast_window"

@contextmanager
def createWindow(resolution=None):

    # import maya.OpenMayaUI as omui
    # activeView = omui.M3dView.active3dView()
    # width = activeView.portWidth()
    # height = activeView.portHeight()
    path = os.path.dirname(os.path.abspath(__file__))
    config = yaml.full_load("{}/config.yml".format(path))

    resolution = resolution or config["RESOLUTION"]["mid"]

    if cmds.windowPref( PLAYBLAST_WINDOW, exists=True ):
        cmds.windowPref( PLAYBLAST_WINDOW, remove=True )
    window = cmds.window( PLAYBLAST_WINDOW, titleBar=True, iconify=True,
                            leftEdge = 100, topEdge = 100,
                            width = resolution[0], height = resolution[1],
                            sizeable = False)
    # Create editor area
    layout = cmds.formLayout()
    editor = cmds.modelEditor(config["VIEWPORT"]["modelEditor"]**)
    cmds.setFocus( editor )
    cmds.formLayout( layout, edit=True,
                    attachForm = ( ( editor, "left", 0 ),
                                    ( editor, "top", 0 ),
                                    ( editor, "right", 0 ),
                                    ( editor, "bottom", 0 ) ) )
    # Show window
    cmds.setFocus( editor )
    cmds.showWindow( window )
    cmds.refresh()
    try:
        yield True
    except:
        traceback.print_exc()
    finally:
        cmds.deleteUI(window)

