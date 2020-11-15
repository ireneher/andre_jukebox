from core_jukebox import jukebox

def getUsdDependencies(assetName, assetType="env"):
    """
    Retrieve latest USD product's dependencies (material, overrides)
    """
    matSong = jukebox.song.Song.from_fields(assetType, assetName, "material", assetName, "ma")
    return {"material": matSong}