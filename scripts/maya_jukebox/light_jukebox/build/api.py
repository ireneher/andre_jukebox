import json
import maya.cmds as cmds 

from core_jukebox.jukebox import track, tape
from ligtht_jukebox.build import constants

class Builder(object):
    pass
# (*)
# Get current scene (requires saving before building?), get shot
# Get ShotTape from scene filepath
# Get outputs (Tracks) from ShotTape
# Get asset Tracks (from json config, just need to get current version)

# objects (main=Builder):
#   resolver (*) -> Dict of {group/dept: Tracks}
#   loader
#       (group, reference_path)  / exception: vbd

class Resolver():
    def __init__(scene_path=None):
        scene_path = scene_path or cmds.file(q=True, sn=True)
        self.shot_tape = tape.ShotTape.from_filepath(scene_path)
        self.shot_tracks = self.get_shot_tracks()
        self.asset_tracks = self.get_shot_tracks()
        self.tracks = self.consolidate_tracks()
    
    def get_shot_tracks(self):
        shot_products = {}  # {datatype: list of latest_version filepaths}
        for datatype in constants.SHOT_PRODUCT_DATATYPES:
            shot_products[datatype] = []
            for shot_track in self.shot_tape.get_outputs(datatype=datatype):
                shot_products[datatype].extend(shot_track.get_latest())

        return shot_products

    def get_asset_tracks(self):
        asset_products = {}
        for asset_type, asset, datatype in constants.ASSET_PRODUCTS:
            asset_track = track.Track.from_fields(asset_type, asset, datatype)
            asset_products[datatype].extend(asset_track.get_latest())
        return asset_products
    
    def consolidate_tracks(self):
        return self.shot_tracks.update(self.asset_tracks)

class Builder():
    def __init__():
        resolver = Resolver()
        data = resolver.tracks
        for datatype, filepaths in data.items():
            print("-----Processing {}-----".format(datatype))
            if datatype == "caches":
                for filepath in filepaths:
                    print(">>>Loading {}".format(filepath))
                    # TODO how to load under same group
                    cmds.file(filepath, i=True, reference=True, groupReference=True, groupName=datatype, force=True)