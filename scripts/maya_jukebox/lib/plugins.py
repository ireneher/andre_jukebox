import functools

from maya import cmds


def load_plugin(plugin_name):
    """
    Args:
        plugin_name (str): Name of the plug-in
    """
    if not cmds.pluginInfo(plugin_name, q=True, loaded=True):
        return cmds.loadPlugin(plugin_name)


def ensure_plugins_loaded(plugins):
    """
    Decorator that ensure necessary Maya plug-ins are loaded before
    execution

    :param plug-ins List[str]:
    """

    def _decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for plug in plugins:
                load_plugin(plug)

            return func(*args, **kwargs)

        return wrapper

    return _decorator
