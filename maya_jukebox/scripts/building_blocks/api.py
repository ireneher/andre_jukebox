import math
import maya.cmds as cmds


def get_local_bounding_box(shape_node):
    # Returns float[] xmin, ymin, zmin, xmax, ymax, zmax
    minbbox = cmds.getAttr("{}.boundingBoxMin".format(shape_node))
    maxbbox = cmds.getAttr("{}.boundingBoxMax".format(shape_node))

    return minbbox, maxbbox


def get_bbox_overlap(bbox1, bbox2):
    # Position both objects at origin
    xdiff = bbox1[0] - bbox2[0]
    ydiff = bbox1[1] - bbox2[1]
    zdiff = bbox1[2] - bbox2[2]
    return xdiff * ydiff * zdiff


def get_best_fitting_bbox(subject_bbox, target_bboxes):
    """
    subject_bbox: tuple containing values of bounding box
    target_bboxes: dict {bbox_id: bbox_values}
    Returns target_bbox element whose values are closest to the subject
    """
    bbox_overlaps = {}  # {id: difference}
    for target_id, target_bbox in target_bboxes.items():
        bbox_overlaps[target_id] = get_bbox_overlap(target_bbox, subject_bbox)

    return max(bbox_overlaps, key=bbox_overlaps.get)
