import collections

import maya.cmds as cmds
from python_lib import enum
from maya_jukebox.anim_jukebox.playblasts import constants


class ViewportOverides(enum.Enum):
    dynamics = True
    hairSystems = True
    locators = False
    nurbsCurves = False
    nurbsSurfaces = True
    polymeshes = True


class modelEditorOverides(enum.Enum):
    activeView = True
    controlVertices = False
    displayAppearance = "smoothShaded"
    grid = False
    headsUpDisplay = True
    ignorePanZoom = True
    selectionHiliteDisplay = False
    shadows = False
    sortTransparent = True
    wireframeOnShaded = False


class CustomViewport(object):
    def __init__(
        self, panels=None, settings=None,
    ):

        self._panels = panels or [cmds.playblast(activeEditor=True).split("|")[-1]]
        self._status = collections.defaultdict(dict)
        self._settings = settings

        for attr in constants:
            for panel in self._panels:
                self._status[panel][attr] = cmds.modelEditor(
                    panel, q=True, **{attr: True}
                )

    def __enter__(self):
        # Get overide config
        # Hide all and set the ones listed visible
        for panel in self._panels:
            cmds.modelEditor(panel, e=True, allObjects=False)
            cmds.modelEditor(
                panel, e=True, **{item.name: item.value for item in ViewportOverides}
            )
        show_hud()

    def __exit__(self, *args):
        # Set the viewport visibility options back to the original state
        for panel in self._panels:
            cmds.modelEditor(panel, e=True, **self._status[panel])
        # Hide the hud
        hide_hud()

    def show_hud(self):
        visibleHUDs = [
            f
            for f in cmds.headsUpDisplay(listHeadsUpDisplays=True)
            if cmds.headsUpDisplay(f, query=True, visible=True)
        ]
        # hide all visible HUDs
        map(lambda f: cmds.headsUpDisplay(f, edit=True, visible=False), visibleHUDs)

        # Add required HUD
        # User name
        editExistingHUD = "HUDUserName" in cmds.headsUpDisplay(listHeadsUpDisplays=True)
        cmds.headsUpDisplay(
            "HUDUserName",
            edit=editExistingHUD,
            command=lambda: os.getenv("USERNAME", "unknown.user"),
            event="playblasting",
            section=1,
            block=1,
        )
        cmds.headsUpDisplay("HUDUserName", edit=True, visible=True, label="User:")
        # Scene name
        editExistingHUD = "HUDSceneName" in cmds.headsUpDisplay(
            listHeadsUpDisplays=True
        )
        cmds.headsUpDisplay(
            "HUDSceneName",
            edit=editExistingHUD,
            command=lambda: cmds.file(query=True, location=True, shortName=True).rsplit(
                ".", 1
            )[0],
            event="playblasting",
            section=6,
            block=1,
        )
        cmds.headsUpDisplay(
            "HUDSceneName", edit=True, visible=True, dataFontSize="large", label="Shot:"
        )
        # Focal length
        cmds.headsUpDisplay(
            "HUDFocalLength",
            edit=True,
            visible=True,
            dataFontSize="large",
            section=3,
            block=1,
        )
        cmds.headsUpDisplay(
            "HUDCurrentFrame",
            edit=True,
            visible=True,
            dataFontSize="large",
            section=8,
            block=1,
        )

    def hide_hud(self):
        # restore HUD state
        map(
            lambda f: cmds.headsUpDisplay(f, edit=True, visible=False),
            cmds.headsUpDisplay(listHeadsUpDisplays=True),
        )
        map(lambda f: cmds.headsUpDisplay(f, edit=True, visible=True), data)
