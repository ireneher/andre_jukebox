class VersionFile(object):

    TEMPLATE = "{asset}.{:04}{rep}"
    # Version will be index 0 since is the only non-positional
    version = 0


class Instance(object):

    TEMPLATE = "{asset}_{:d}"
    asset = 0
    count = 1


MAYA_PROJECT_ROOT = "MAYA"

ASSET = "{DCC_ROOT}/scenes/assets/{asset_type}/{asset}/"

SHOT = "{DCC_ROOT}/scenes/Concept_Animatic/SHOTS/{shot}/{task}/"

ASSET_WORKAREA = ASSET + "workarea/{task}/"

ASSET_OUTPUT = "{DCC_ROOT}/scenes/assets/{asset_type}/{asset}/" + "outputs/{datatype}/"

ASSET_ARCHIVE = ASSET_OUTPUT + "archive/"

ASSET_WORKFILE_ARCHIVE = ASSET + "archive/{task}/{name}/"

SHOT_WORKAREA = SHOT + "workarea/{task}/"

SHOT_OUTPUT = SHOT + "outputs/{datatype}/{instance}/"

SHOT_ARCHIVE = SHOT_OUTPUT + "archive/"

SHOT_WORKFILE_ARCHIVE = SHOT + "archive/{name}/"


