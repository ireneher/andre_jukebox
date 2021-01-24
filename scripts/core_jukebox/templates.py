class VersionFile(object):

    TEMPLATE = "{asset}.{:04}{representation}"
    # Version will be index 0 since is the only non-positional
    version = 0


class Instance(object):

    TEMPLATE = "{asset}_{:d}"
    asset = 0
    count = 1


MAYA_PROJECT_ROOT = "MAYA"
ASSETS_ROOT = "{DCC_ROOT}/scenes/assets/"
ASSET = ASSETS_ROOT+"{asset_type}/{asset}/"
#ASSET = "{DCC_ROOT}/scenes/assets/{asset_type}/city/"

SHOT = "{DCC_ROOT}/scenes/Concept_Animatic/SHOTS/{shot}/{task}/"

ASSET_WORKAREA = ASSET + "workarea/{task}/"
#ASSET_WORKAREA = ASSET + "workarea/{task}/{asset}/"

ASSET_OUTPUT_ROOT = ASSET + "outputs/{datatype}/"
#ASSET_OUTPUT_ROOT = "{DCC_ROOT}/scenes/assets/{asset_type}/{asset}/outputs/{datatype}/"
        
ASSET_OUTPUT = ASSET_OUTPUT_ROOT + "{name}.{representation}"

ASSET_ARCHIVE = ASSET_OUTPUT_ROOT + "archive/{version}/{name}.{representation}"

ASSET_WORKFILE_ARCHIVE = ASSET + "archive/{task}/{name}/{timestamp}.{representation}"

SHOT_WORKAREA = SHOT + "workarea/{task}/"

SHOT_OUTPUT_ROOT = SHOT + "outputs/{datatype}/"

# ID token is INSTANCE for Instance publishes, TASK for Shot publishes
SHOT_OUTPUT = SHOT_OUTPUT_ROOT + "{identifier}/{identifier}.{representation}"

SHOT_ARCHIVE = SHOT_OUTPUT + "archive/{version}/{name}.{representation}"

SHOT_WORKFILE_ARCHIVE = SHOT + "archive/{name}/{timestamp}.{representation}"


