from maya_jukebox.common import file_reference

NAMESPACE_DICT = {
    "CHAR" : "andre_0",
    "AMP" : "vox_0",
    "PEDAL" : "pedal_0",
    "PLANE" : "plane_0",
    "MIC" : "mic_0",
}

BLACKLIST = ["LAY", "BG"]

def remap_references():

    remaped = []
    not_found = []

    for reference in file_reference.FileReference.ls_references():
        if reference.namespace in NAMESPACE_DICT.keys() and not reference.namespace in BLACKLIST:
            reference.namespace = NAMESPACE_DICT.get(reference.namespace) 
            remaped.append(reference)
        else:
            not_found.append(reference)
    
    if not_found:
        print(
            "Reference: {} not found in the project folder skipping asset.".format(
                not_found
            )
        )
    return remaped




