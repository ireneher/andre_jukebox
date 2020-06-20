import math
import maya.cmds as cmds


def get_local_bounding_box(transform):
    # Returns float[] xmin, ymin, zmin, xmax, ymax, zmax
    return cmds.xform(transform, objectSpace=True, q=True, boundingBox=True)


def get_bbox_overlap(bbox1, bbox2):
    bbox1x = bbox1[0] - bbox1[3]  # xmax - xmin
    bbox1y = bbox1[1] - bbox1[4]  # ymax - ymin
    bbox1z = bbox1[2] - bbox1[5]  # zmax - zmin

    bbox2x = bbox2[0] - bbox2[3]
    bbox2y = bbox2[1] - bbox2[4]
    bbox2z = bbox2[2] - bbox2[5]  

    xdiff = math.pow(bbox1x - bbox2x, 2) * 0.5
    ydiff = math.pow(bbox1y - bbox2y, 2) * 0.3
    zdiff = math.pow(bbox1z - bbox2z, 2) * 0.2

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
