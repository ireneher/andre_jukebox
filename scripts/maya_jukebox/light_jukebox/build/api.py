import json
import maya.cmds as cmds 

from core_jukebox.jukebox import song, tape
from ligtht_jukebox.build import constants
from usd_jukebox import build as usd_build 

# (*)
# Get current scene (requires saving before building?), get shot
# Get ShotTape from scene filepath
# Get outputs (Songs) from ShotTape
# Get asset Songs (from json config, just need to get current version)

# objects (main=Builder):
#   resolver (*) -> Dict of {group/dept: Songs}
#   loader
#       (group, reference_path)  / exception: vbd

class Resolver():
    def __init__(scene_path=None):
        scene_path = scene_path or cmds.file(q=True, sn=True)
        self.shot_tape = tape.ShotTape.from_filepath(scene_path)
        self.shot_songs = self.get_shot_songs()
        self.asset_songs = self.get_shot_songs()
        self.songs = self.consolidate_songs()
    
    def get_shot_songs(self):
        shot_products = {}  # {datatype: list of latest_version filepaths}
        for datatype in constants.SHOT_PRODUCT_DATATYPES:
            shot_products[datatype] = []
            for shot_song in self.shot_tape.get_outputs(datatype=datatype):
                shot_products[datatype].extend(shot_song.get_latest())

        return shot_products

    def get_asset_songs(self):
        asset_products = {}
        # TODO this is to be an excel at project level
        for asset_type, asset, datatype in constants.ASSET_PRODUCTS:
            asset_song = song.Song.from_fields(asset_type, asset, datatype)
            asset_products[datatype].extend(asset_song.get_latest())
        return asset_products
    
    def consolidate_songs(self):
        return self.shot_songs.update(self.asset_songs)

class Builder():
    def __init__():
        resolver = Resolver()
        data = resolver.songs
        for datatype, filepaths in data.items():
            print("-----Processing {}-----".format(datatype))
            if datatype == "caches":
                for filepath in filepaths:
                    print(">>>Loading {}".format(filepath))
                    # TODO how to load under same group
                    cmds.file(filepath, i=True, reference=True, groupReference=True, groupName=datatype, force=True)
                    usd_build.buildSet(assetName, assetType="sets")