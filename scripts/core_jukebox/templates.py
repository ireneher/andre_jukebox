class VersionName(object):

    TEMPLATE = "{asset}.{:04}.{rep}"
    asset = 0
    version = 1
    representation = 2

class InstanceName(object):

    TEMPLATE = "{asset}_{:d}"
    asset = 0
    count = 1

    def parse(self, instance_name):
        return parse.parse(self.TEMPLATE, instance_name)
        

ASSET = "scenes/assets/{asset_type}/{asset}/{datatype}"

SHOT = "scenes/shots/{shot}/task"

##########################################
# Overide to test in dev environment
ASSET = "scenes/dev_test/assets/{asset_type}/{asset}/{datatype}"
SHOT = "scenes/dev_test/shots/{shot}/task"
##########################################  

ASSET_OUTPUT = ASSET + "/outputs/" 

ASSET_ARCHIVE = ASSET_OUTPUT + "/archive" 

SHOT_OUTPUT = SHOT + "/outputs/{datatype}/{asset}/{instance}" 

SHOT_ARCHIVE = SHOT_OUTPUT + "/archive" 


