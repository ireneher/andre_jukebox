import math
import maya.cmds as cmds


def get_local_bounding_box(shape_node):
    # Returns float[] xmin, ymin, zmin, xmax, ymax, zmax
    minbbox = cmds.getAttr("{}.boundingBoxMin".format(shape_node))
    maxbbox = cmds.getAttr("{}.boundingBoxMax".format(shape_node))

    return minbbox, maxbbox


def get_bbox_overlap(bbox1, bbox2):
    # Position both objects at origin
    xdiff = math.pow(bbox1[0] - bbox2[0], 2) * 0.5
    ydiff = math.pow(bbox1[1] - bbox2[1], 2) * 0.3
    zdiff = math.pow(bbox1[2] - bbox2[2], 2) * 0.2
    return xdiff + ydiff + zdiff


def get_best_fitting_bbox(subject_bbox, target_bboxes):
    """
    subject_bbox: tuple containing values of bounding box
    target_bboxes: dict {bbox_id: bbox_values}
    Returns target_bbox element whose values are closest to the subject
    """
    bbox_overlaps = {}  # {id: difference}
    for target_id, target_bbox in target_bboxes.items():
        bbox_overlaps[target_id] = get_bbox_overlap(target_bbox, subject_bbox)

    return min(bbox_overlaps, key=bbox_overlaps.get)
