import os


def walk_up_path(path):
    """
    os.walk from path to paths above (bottom to top)
    """
    path = os.path.realpath(path)
    names = os.listdir(path)
    dirs, nondirs = [], []
    for name in names:
        if os.path.isdir(os.path.join(path, name)):
            dirs.append(name)
        else:
            nondirs.append(name)

    yield path, dirs, nondirs

    upper_path = os.path.realpath(os.path.join(path, '..'))
    if upper_path == path:
        return

    for x in walk_up_path(upper_path):
        yield x


def find_project_root(path):
    """
    Given path inside project, find the Maya project root
    """
    for upper_dir, _, _ in walk_up_path(path):
        if os.path.exists(os.path.join(upper_dir, "workspace.mel")):
            return upper_dir