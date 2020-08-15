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
    def __init__(scenePath=None):
        scenePath = scenePath or cmds.file(q=True, sn=True)
        self.shotTape = tape.ShotTape.from_filepath(scenePath)
        self.shotTracks = self.get_shot_tracks()
        self.assetTracks = self.get_shot_tracks()
        self.tracks = self.consolidate_tracks()
    
    def get_shot_tracks(self):
        shot_products = {}  # {datatype: list of latest_version filepaths}
        for datatype in constants.SHOT_PRODUCT_DATATYPES:
            shot_products[datatype] = []
            for track in self.shotTape.get_outputs(datatype=datatype):
                latest_version  = track.current_version_number()               
                shot_products[datatype].extend(track.get_versions_dict()[latest_version])

        return shot_products

    def get_asset_tracks(self):
        asset_products = {}
        for asset_type, asset, datatype in constants.ASSET_PRODUCTS:
             
        return {}
    
    def consolidate_tracks(self):
        return self.shotTracks.update(self.assetTracks)

class Builder():
    def __init__():
        resolver = Resolver()
        data = resolver.tracks
        for datatype, filepaths in data.items():
            print("-----Processing {}-----".format(datatype))
            if datatype == "caches":
                for filepath in filepaths:
                    print(">>>Loading {}".format(filepath))
                    cmds.file(filepath, i=True, reference=True, groupReference=True, groupName=datatype, force=True)