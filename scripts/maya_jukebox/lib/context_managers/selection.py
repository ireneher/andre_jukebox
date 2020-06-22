import contextlib
import maya.cmds as cmds


@contextlib.contextmanager
def reset_selection(*args, **kwargs):
    """Resets selections after it's done.

    args: Flags from cmds.select
    kwargs: Flags from cmds.select
    """
    existing = cmds.ls(selection=True, long=True) or []
    try:
        if args or kwargs:
            cmds.select(*args, **kwargs)
        yield existing
    finally:
        if existing:
            cmds.select(existing, replace=True)
        else:
            cmds.select(clear=True)
