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

SHOT = "{DCC_ROOT}/scenes/shots/{shot}/{task}/"

##########################################
# Overide to test in dev environment
# ASSET = "{DCC_ROOT}/scenes/dev_test/assets/{asset_type}/{asset}/{datatype}/"
# SHOT = "{DCC_ROOT}/scenes/dev_test/shots/{shot}/{task}/"
##########################################

ASSET_OUTPUT = ASSET + "{datatype}/outputs/"

ASSET_ARCHIVE = ASSET_OUTPUT + "archive/"

SHOT_OUTPUT = SHOT + "outputs/{datatype}/{instance}/"

SHOT_ARCHIVE = SHOT_OUTPUT + "archive/"

