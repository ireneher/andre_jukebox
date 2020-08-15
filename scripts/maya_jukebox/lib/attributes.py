"""Module will have attribute related generic code."""

import maya.cmds as cmds
from maya.api import OpenMaya as om2


def set_string_attr(object_name, attr_name, attr_value, create_new=True, lock=True):
    """Set the string value to the attribute if it exists in the object 
    
    Args:
        object_name (str): The object to which the attribute belongs to or will belong to.
        attr_name (str): The name of the attribute to set the value in.
        attr_value (str): The value to set in the attribute.

    Keyword Args:
        create_new (bool): Defaults to True. whether to create a new attribute.
    
    Raises:
        ValueError: "No object with name object_name found in the scene,
        if there is no object with the name provided in the maya scene.
    """

    attr_full_name = object_name + "." + attr_name

    if not cmds.objExists(object_name):
        raise ValueError("No object with name %s found in the scene" % object_name)

    if not cmds.attributeQuery(attr_name, node=object_name, exists=True):
        if create_new:
            cmds.addAttr(object_name, ln=attr_name, dt="string")
        else:
            raise ValueError("Attribute %s does not exist." % attr_name)

    is_locked = cmds.getAttr(attr_full_name, lock=True)

    if is_locked:
        cmds.setAttr(attr_full_name, lock=False)

    cmds.setAttr(attr_full_name, attr_value, type="string")

    if is_locked or lock:
        cmds.setAttr(attr_full_name, lock=True)


def set_is_locked(object_name, attribute, lock=True):
    """ Toggle the lock on specified keyable attribute.
    Args:
        object_name (str): The object to which the attribute belongs to.
        attribute (str): The attribute to be locked.

    Keyword Args:
        lock (bool): Defaults to True. Toggle to lock or ulock the attribute.
    
    Raises:
        ValueError: if there is no object with the name provided in the maya scene.
    """
    try:
        cmds.setAttr("{}.{}".format(object_name, attribute), lock=lock)
    except RuntimeError:
        om2.MGlobal.displayError(
            "No object matches name: {object_name}.{attribute}",
            object_name=object_name,
            attribute=attribute,
        )
        raise


def lock_all_attr(object_name):
    for attribute in cmds.listAttr(object_name, k=True):
        set_is_locked(object_name, attribute, lock=True)


def unlock_all_attr(object_name):
    for attribute in cmds.listAttr(object_name, k=True):
        set_is_locked(object_name, attribute, lock=False)


def set_lock_attr(object_name, attribute, value):
    """ Unlocks, sets and then locks a specified attribute.
    Args:
        object_name (str): Object to which the attribute belongs to.
        attribute (str): Attribute to be set and locked.
        value (str): Value to set the attribute to.
    Raises:
        ValueError: if there is no object with the name provided in the maya scene.
    """
    try:
        set_is_locked(object_name, attribute, lock=False)
        cmds.setAttr("{}.{}".format(object_name, attribute), value)
        set_is_locked(object_name, attribute, lock=True)
        return True
    except RuntimeError:
        om2.MGlobal.displayError(
            "No object matches name: {object_name}.{attribute}",
            object_name=object_name,
            attribute=attribute,
        )
        raise
