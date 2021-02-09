import maya.cmds as cmds

from maya_jukebox.usd_jukebox import publish as usd_publish
from maya_jukebox.common.publish import constants

def _parse_args(argv=None):
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "path",
        help="maya filepath",
    )

    parser.add_argument(
        "--mode",
        help="publish mode, one of {}".format(constants.PUBLISH_OPTIONS),
        options=constants.PUBLISH_OPTIONS
    )

    return parser.parse_args(args=argv)

def __main__(argv=None):
    args = _parse_args(argv=argv)
    print(args)
    cmds.file(new=True, force=True)  # clear scene
    print("hello")
    cmds.file(args.path, i=True, groupReference=True, groupName=asset_name, force=True)
    print(args.action)
    if args.action == constants.PUBLISH_OPTIONS[0]:
        usd_publish.publishAsset(mayaFile=args.path)
    elif args.action == constants.PUBLISH_OPTIONS[1]:
        usd_publish.publishComposition(mayaFile=args.path)