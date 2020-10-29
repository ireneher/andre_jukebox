import os

import core_jukebox.os_common as common_os


def find_project_root(path):
    """
    Given path inside project, find the Maya project root
    """
    return r"C:/Users/their/Documents/AJ_test"
    for upper_dir, _, _ in common_os.walk_up_path(path):
        if os.path.exists(os.path.join(upper_dir, "workspace.mel")):
            return upper_dir
