from maya_jukebox.scripts.building_blocks import api

def build(bboxes_info):
    # TODO Read in bboxes_info JSON
    # TODO query scene_boxes
    scene_boxes = []
    for box in scene_boxes:
        scene_bbox = api.get_bounding_box(box)
        closest_asset_bbox = api.get_best_fitting_bbox(scene_bbox, bboxes_info)
        # Bring in closest_asset_bbox(0) as reference