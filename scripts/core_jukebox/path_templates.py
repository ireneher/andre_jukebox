ASSET = "scenes/assets/{asset_type}/{asset}/"

ASSET_OUTPUT = ASSET + "/outputs/{datatype}" 

ASSET_ARCHIVE = ASSET_OUTPUT + "/archive" 

SHOT = "scenes/shots/{shot}/task"

SHOT_OUTPUT = SHOT + "/outputs/{datatype}/{asset}/{instance}" 

SHOT_ARCHIVE = SHOT_OUTPUT + "/archive" 



# Overide to test in dev environment
ASSET = "scenes/dev_test/assets/{asset_type}/{asset}/"
SHOT = "scenes/dev_test/shots/{shot}/task"
