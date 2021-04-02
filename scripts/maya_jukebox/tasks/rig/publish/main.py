from maya_jukebox.rig_jukebox.publish import api, ui
from maya_jukebox.lib import decorators, maya_qt


@decorators.ensure_unique_window(ui.WINDOW_NAME)
def launch():
    window = ui.RigPublishWidget(
        manager=api.Manager(), parent=maya_qt.maya_main_window()
    )
    window.show()
