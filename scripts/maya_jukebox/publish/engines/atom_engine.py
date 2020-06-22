
import logging
import maya.cmds as cmds
from collections import OrderedDict

from maya_jukebox.lib import plugins as lib_plugins
from maya_jukebox.lib.context_managers import selection

logger = logging.getlogger(__name__)

class AtomFlags(object):
    """
    - animLayers (bool)
    - baked (bool)
    - constraint (bool)
    - controlPoints (bool)
    - exportEdits (filepath)
    - hierarchy ('none')
    - options ('keys')
    - precision (int)
    - sdk (bool) "Set Driven Keys"
    - selected ('selectedOnly', 'childrenToo', 'template')
    - statics (bool)
    - useChannelBox (1, 2) - Whether or not to use only selected channel
        boxes, 1 is False, 2 is True (blame maya)
    - whichRange (2)
    """
    DEFAULT_FLAGS = [
        ("precision", 8),
        ("statics", 0),
        ("baked", 0),
        ("sdk", 0),
        ("constraint", 0),
        ("animLayers", 0),
        ("selected", "selectedOnly"),
        ("whichRange", 2),
        ("range", ""),
        ("hierarchy", "none"),
        ("controlPoints", 0),
        ("useChannelBox", 1),  # Actually means False and 2 means True
        ("options", "keys"),
    ]
    RESTRICTED_FLAGS = ("range", "copyKeyCmd")


class AtomEngine(AbstractEngine):
    """
    Exports all animation curves from the given root items  as .atom format.
    """

    def __init__(self, flags):
        super(AtomEngine, self).__init__(flags)
        self._representation = "atom"

    @lib_plugins.ensure_plugins_loaded(["atomImportExport"])
    def run_export(self, roots, destination, start_frame, end_frame, flags=None):
        flags = (self.flags + flags) if flags else self.flags
        self.export(roots, destination, start_frame, end_frame, flags)

    def export(self, root, destination, start_frame, end_frame, flags):
        option_string = self.construct_options_string(start_frame, end_frame, flags)
        logger.debug(
            "Running atomExport: {roots}, {destination}, {options}",
            roots=root,
            destination=destination,
            options=option_string,
        )
        # Ensure only the requested items are selected
        with selection.reset_selection(root):
            cmds.file(
                destination,
                force=True,
                exportSelected=True,
                options=option_string,
                type="atomExport",
            )

    @classmethod
    def construct_options_string(cls, start_frame, end_frame, flags):
        """
        Do not supply:
            - range - This is constructed from the start_frame and end_frame
            - copyKeyCmd - self generated from the supplied args as required

        Args:
            start_frame (int): First frame to cache
            end_frame (int): Final frame to cache (inclusive)
            flags (list): List of tuple pairs for flags and their values.

        Returns:
            str: String to supply to cmds.file(options=)
        """
        # Use an ordered dict so we can access keys by name but maintain order
        default_flags = OrderedDict(AtomFlags.DEFAULT_FLAGS)

        # Merge user flags into the defaults
        for opt, value in flags:
            if opt in AtomFlags.RESTRICTED_FLAGS:
                raise ValueError("Cannot override option: {}".format(opt))
            elif opt not in AtomFlags.:
                logger.warning(
                    "Unknown flag added to option string: {opt}={value}",
                    opt=opt,
                    value=value,
                )
            default_flags[opt] = int(value) if isinstance(value, bool) else value

        # Override the range using the explicit frame range
        default_flags["range"] = "{}:{}".format(start_frame, end_frame)

        # If copying a frame range, atomExport requires a copyKeyCmd string
        # constructed from the given
        if start_frame != end_frame:
            copy_flags = [
                ("-animation", "objects"),
                ("-time", ">{}:{}>".format(start_frame, end_frame)),
                ("-float", ">{}:{}>".format(start_frame, end_frame)),
                ("-option", str(default_flags["options"])),
                ("-hierarchy", str(default_flags["hierarchy"])),
                ("-controlPoints", str(default_flags["controlPoints"])),
            ]
            default_flags["copyKeyCmd"] = " ".join(
                i for pair in copy_flags for i in pair
            )

        option_string = ";".join(
            "{}={}".format(opt, val) for opt, val in default_flags.items()
        )
        return option_string
