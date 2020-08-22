assets_dir_rel = "scenes/MODELS/SET/buildings"
refs_dir_rel = "scenes/REFS"
archive_dir_rel = "archive"
textures_dir_rel = "sourceimages/SETS/buildings/Textures_1024"
texture_mappings = {
    "baseColor": ("Diffuse", "Output - sRGB"),
    "specularRoughness": ("Glossiness", "Utility - Raw"),
    "specularIOR": ("ior", "Utility - Raw"),
    "normalCamera": ("Normal", "Output - sRGB"),
    "specularColor": ("Reflection", "Utility - Raw"),
    "transmission": ("Opacity", "Utility - Raw"),
}
# shader component: (texture map suffix, colourspace)

alpha_invert = (
    "specularRoughness",
    "specularIOR",
    "transmission",
)  # alpha is luminance, invert
# interior_shading_group = "am215_interior_V{}_SHDSG"
# interior_shop_shading_group = "am215_interior_shop_V{}_SHDSG"
######## interiors mapping - {num_vertices: shading_group} ########
# interiors_mapping = {786: "am215_interior_V1_SHDSG",
#                     1417: "am215_interior_V2_SHDSG",
#                     794: "am215_interior_V3_SHDSG",
#                     50: "am215_interior_V4_SHDSG",
#                     443: "am215_interior_V5_SHDSG",
#                     }  # refers to AM215_interior
# shop_interiors_mapping = {802: "am215_shop_interior_V1_SHDSG"} # AM215_Shop_interior
# shop_exposition_mappings = {1670: "AM215_props_Shop_exposition_V01_SHDSG",
#                             577: "AM215_props_Shop_exposition_V02_SHDSG",
#                             1276: "AM215_props_Shop_exposition_V03_SHDSG",
#                             802: "AM215_props_Shop_exposition_V04_SHDSG",
#                             745: "AM215_props_Shop_exposition_V05_SHDSG",
#                             970: "AM215_props_Shop_exposition_V06_SHDSG",
#                             4829: "AM215_props_Shop_exposition_V07_SHDSG",
#                             1968: "AM215_props_Shop_exposition_V08_SHDSG",
#                             972: "AM215_props_Shop_exposition_V09_SHDSG",
#                             4407: "AM215_props_Shop_exposition_V10_SHDSG",
#                             } # Shop_exposition
# interior_patterns = {"*_interior_*": interiors_mapping,
#                     "*_Shop_interior_*": shop_interiors_mapping,
#                     "*_exposition_*": shop_exposition_mappings}

interior_naming = (
    "*_interior_*",
    "*_exposition_*",
    "*hop_interior_*",
)  # for interior get shader, for exposition get map (in prep)
interior_mapping = {
    interior_naming[0]: "am215_interior_V{}_SHDSG",
    interior_naming[1]: "AM215_props_Shop_exposition_V{}_SHDSG",
    interior_naming[2]: "am215_shop_interior_V{}_SHDSG",
}

