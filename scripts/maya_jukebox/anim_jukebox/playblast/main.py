import maya.cmds as cmds

from maya_library import decorators, maya_qt
from playblast import constants


class Controller(object):
    def __init__(self):
        self.widget = widget.SketchWidget(parent=maya_qt.maya_main_window())

        self.widget.draw_signal.connect(self._on_draw_signal)
        self.widget.delete_signal.connect(self._on_delete_signal)
        self.widget.close_signal.connect(self._on_close_signal)
        # TODO: Disable buttons

    def _on_draw_signal(self):
        pass

    def _on_delete_signal(self):
        # Explicitly cast to string as PyQt4 returns QString
        pass

    def _on_close_signal(self):
        # Explicitly cast to string as PyQt4 returns QString
        self.close()

    # @ensure_qapp
    def launch(self):
        self.widget.show()
        return self.widget


@decorators.ensure_unique_window(constants.WINDOW_NAME)
def launch_playblast_tool():
    controler = Controller()
    return controler.launch()
