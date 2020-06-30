assets_dir_rel = "scenes/MODELS/SET/buildings"
refs_dir_rel = "scenes/REFS"
archive_dir_rel = "archive"
textures_dir_rel = "sourceimages/SETS/buildings/Textures_1024"
texture_mappings = {"baseColor": ("Diffuse", "Output - sRGB"),
                   "specularRoughness": ("Glossiness", "Utility - Raw"),
                   "specularIOR": ("ior", "Utility - Raw"),
                   "normalCamera": ("Normal", "Output - sRGB"),
                   "specularColor": ("Reflection", "Utility - Raw"),
                    "transmission": ("Opacity", "Utility - Raw")}
                   # shader component: (texture map suffix, colourspace)

alpha_invert = ("specularRoughness", "specularIOR", "transmission")  # alpha is luminance, invert
interior_shading_group = "am215_interior_V{}_SHDSG"
interior_shop_shading_group = "am215_interior_shop_V{}_SHDSG"