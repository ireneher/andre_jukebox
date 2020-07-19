import json

class Builder(object):
    def get_scene_description():
        # Get current scene (requires saving before building?)
        scenepath = ""
        self.sd = SceneDescription.from_json(os.path.join(scenepath, "shot.json"))

    

class SceneDescription(object):
    @classmethod
    def from_json(path):
        description_dict = json.loads(path)
        shot = description_dict.keys()[0]
        return cls(shot, description_dict["inputs"])

    def __init__(shot, inputs):
        self.shot = shot
        self.inputs = inputs
        self.shot_outputs = {}
        self.asset_outputs = {}

    @property
    def characters():
        return self.inputs["char"]

    @property
    def props():
        return self.inputs["props"]

    @property
    def fx():
        return self.inputs["fx"]

    @property
    def camera():
        return self.inputs["camera"]

    def get_shot_outputs():
        

    def get_char_outputs():
        for character in self.characters:
            pass

    def get_props_outputs():
        pass

    def get_sets_outputs():   
        pass

    def get_fx_outputs():
        pass

    def get_camera():
        pass

