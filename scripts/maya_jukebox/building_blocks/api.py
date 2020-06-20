import math
import maya.cmds as cmds


def get_local_bounding_box(shape_node):
    # Returns float[] xmin, ymin, zmin, xmax, ymax, zmax
    minbbox = cmds.getAttr("{}.boundingBoxMin".format(shape_node))
    maxbbox = cmds.getAttr("{}.boundingBoxMax".format(shape_node))

    return minbbox, maxbbox


def get_bbox_overlap(bbox1, bbox2):

    bbox1x = bbox1[1][0][0] - bbox1[0][0][0]  # xmax - xmin
    bbox1y = bbox1[1][0][1] - bbox1[0][0][1]  # xmax - xmin
    bbox1z = bbox1[1][0][2] - bbox1[0][0][2]  # xmax - xmin

    bbox2x = bbox2[1][0][0] - bbox2[0][0][0]  # xmax - xmin
    bbox2y = bbox2[1][0][1] - bbox2[0][0][1]  # xmax - xmin
    bbox2z = bbox2[1][0][2] - bbox2[0][0][2]  # xmax - xmin


    xdiff = bbox1x - bbox2x
    ydiff = bbox1y - bbox2y
    zdiff = bbox1z - bbox2z

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

    return min(bbox_overlaps, key=bbox_overlaps.get)
