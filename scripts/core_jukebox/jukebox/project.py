
import os
from core_jukebox import os_common

ROOT_FILE = "root.jukebox"

def find_project_from_path(path):
    """
    Given path inside project, find the Maya project root
    """
    for upper_dir, _, _ in os_common.walk_up_path(path):
        if os.path.exists(os.path.join(upper_dir, ROOT_FILE)):
            return upper_dir

def get_project_root():
    find_project_from_path(os.path.dirname(os.path.abspath(__file__)))
