import maya.cmds as cmds


def get_toplevel_node():
    toplevel_nodes = cmds.ls(assemblies=True)
    # Filter out default cameras
    for toplevel_node in toplevel_nodes:
        try:
            cmds.camera(toplevel_node, q=True, startupCamera=True)
        except RuntimeError:
            return toplevel_node


def merge_shapes(shape_name):
    toplevel_node = get_toplevel_node()
    shapes = cmds.listRelatives(toplevel_node)
    cmds.polyUnite(shapes, name=shape_name)
