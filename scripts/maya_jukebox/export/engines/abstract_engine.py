import logging

logger = logging.getLogger(__name__)


class AbstractEngine(object):
    def __init__(self, **kwargs):
        """
        Kwargs:
            Any engine specific flags that are needed.
        """
        self.representation = None
        self.build_flags(**kwargs)

    def __repr__(self):
        return "{}({!r}, {!r})".format(
            self.__class__.__name__, self.flags, self.representation
        )

    def build_flags(self, flags_obj, **kwargs):
        self.flags = flags_obj
        for flag, value in kwargs.items():
            try:
                setattr(self.flags, flag)
            except AttributeError:
                logger.error(
                    "Invalid flag: {} for {}".format(flag, self.__class__.__name__),
                    exc_info=True,
                )

    def run_export(self, filepath, exports=None, frame_range=None):
        self.export(exports, filepath, frame_range, flags)

    def export(self, filepath, exports=None, frame_range=None):
        raise NotImplementedError
