import logging

import maya.cmds as cmds

# from python_lib import enum
from maya_jukebox.lib import plugins as lib_plugins
from maya_jukebox.export.engines import abstract_engine

logger = logging.getLogger(__name__)


class AbcFlags(object):
    """
    Args:
    alembicFile (str): File location to write the Alembic data.
    eulerFilter (bool, optional): Apply Euler filter while sampling
        rotations. Defaults to False.
    noNormals (bool, optional): Present normal data for Alembic poly meshes
        will not be written. Defaults to False.
    preRoll (bool, optional): This frame range will not be sampled.
        Defaults to False.
    renderableOnly (bool, optional): Non-renderable hierarchy
        (invisible, or templated) will not be written out. Defaults to
        False.
    selection (bool, optional): Write out all all selected nodes from the
        active selection list that are descendents of the exports specified
        with -root. Defaults to False.
    uvWrite (bool, optional): Uv data for PolyMesh and SubD shapes will be
        written to the Alembic file.  Only the current uv map is used.
        Defaults to False.
    writeColorSets (bool, optional): Write all color sets on MFnMeshes as
        color 3 or color 4 indexed geometry parameters with face varying
        scope. Defaults to False.
    writeFaceSets (bool, optional): Write all Face sets on MFnMeshes.
        Defaults to False.
    wholeFrameGeo (bool, optional): Data for geometry will only be written
        out on whole frames. Defaults to False.
    worldSpace (bool, optional): Any root nodes will be stored in world
        space. Defaults to False.
    writeVisibility (bool, optional): Visibility state will be stored in
        the Alembic file.  Otherwise everything written out is treated as
        visible. Defaults to False.
    writeUVSets (bool, optional): Write all uv sets on MFnMeshes as vector
        2 indexed geometry parameters with face varying scope. Defaults to
        False.
    writeCreases (bool, optional): If the mesh has crease edges or crease
        vertices, the mesh (OPolyMesh) would now be written out as an OSubD
        and crease info will be stored in the Alembic file. Otherwise,
        creases info won't be preserved in Alembic file unless a custom
        Boolean attribute SubDivisionMesh has been added to mesh node and
        its value is true. Defaults to False.
    dataFormat (str, optional): The data format to use to write the file.
        Can be either "HDF" or "Ogawa". Defaults to "Ogawa".
    step (float, optional): The time interval (expressed in frames) at
        which the frame range is sampled. Additional samples around each
        frame can be specified with -frs. Defaults to 1.0.
    melPerFrameCallback (str, optional): When each frame
        (and the static frame) is evaluated the string specified is
        evaluated as a Mel command. See below for special processing rules.
        Defaults to "".
    melPostJobCallback (str, optional): When the translation has finished
        the string specified is evaluated as a Mel command. See below for
        special processing rules. Defaults to "".
    pythonPerFrameCallback (str, optional): When each frame
        (and the static frame) is evaluated the string specified is
        evaluated as a python command. See below for special processing
        rules. Defaults to "".
    pythonPostJobCallback (str, optional): When the translation has
        finished the string specified is evaluated as a python command. See
        below for special processing rules. Defaults to "".
    userAttrPrefix (list of str, optional): Prefix filter for determining
        which user attributes to write out. Defaults to [].
    userAttr (list of str, optional): Specific user attributes to write
        out. Defaults to [].
    attr (list of str, optional): A specific geometric attribute to write
        out. Defaults to [].
    attrPrefix (list of str, optional): Prefix filter for determining which
        geometric attributes to write out. Defaults to ["ABC_"].
    root (list of str, optional): Maya dag path which will be parented to
        the root of the Alembic file. Defaults to [], which means the
        entire scene will be written out.
    frameRelativeSample (list of float, optional): Frame relative sample
        that will be written out along the frame range. Defaults to [].
    frameRange (list of list of two floats, optional): The frame range to
        write. Each list of two floats defines a new frame range. step or
        frameRelativeSample will affect the current frame range only.
    stripNamespaces (int, optional): Namespaces will be stripped off of
        the node before being written to Alembic. The int specifies how
        many namespaces will be stripped off of the node name. Be careful
        that the new stripped name does not collide with other sibling node
        names.
        Examples:
        taco:foo:bar would be written as just bar with stripNamespaces=0
        taco:foo:bar would be written as foo:bar with stripNamespaces=1
        Defaults to -1, which means namespaces will be preserved.
    dontSkipUnwrittenFrames (bool, optional): When evaluating multiple
        translate jobs, this decides whether to evaluate frames between
        jobs when there is a gap in their frame ranges. Defaults to False.
    verbose (bool, optional): Prints the current frame that is being
        evaluated. Defaults to False.
    preRollStartFrame (float, optional): The frame to start scene
        evaluation at.  This is used to set the starting frame for time
        dependent translations and can be used to evaluate run-up that
        isn't actually translated. Defaults to 0.
    """

    attr = []
    attrPrefix = []
    dataFormat = "Ogawa"
    dontSkipUnwrittenFrames = False
    eulerFilter = False
    frameRange = []
    frameRelativeSample = []
    melPerFrameCallback = ""
    melPostJobCallback = ""
    noNormals = False
    preRoll = False
    preRollStartFrame = 0
    pythonPerFrameCallback = ""
    pythonPostJobCallback = ""
    renderableOnly = False
    root = []
    selection = False
    step = 1.0
    stripNamespaces = 0
    userAttr = []
    userAttrPrefix = ["ABC_"]
    uvWrite = True
    verbose = False
    wholeFrameGeo = False
    worldSpace = True
    writeColorSets = False
    writeCreases = True
    writeFaceSets = False
    writeUVSets = True
    writeVisibility = True


class AbcEngine(abstract_engine.AbstractEngine):
    def __init__(self, **kwargs):
        super(AbcEngine, self).__init__()

        self.representation = "abc"
        self.build_flags(AbcFlags, **kwargs)

    # "AbcExport.mll"
    @lib_plugins.ensure_plugins_loaded(["AbcExport"])
    def run_export(
        self, filepath, exports=None, frame_range=None,
    ):
        self.export(filepath, exports, frame_range)

    def export(
        self, filepath, exports=None, frame_range=None,
    ):
        # Generate job add_argument
        jobArg = ""

        # Boolean flags
        booleans = {
            "eulerFilter": self.flags.eulerFilter,
            "noNormals": self.flags.noNormals,
            "preRoll": self.flags.preRoll,
            "renderableOnly": self.flags.renderableOnly,
            "selection": self.flags.selection,
            "uvWrite": self.flags.uvWrite,
            "writeColorSets": self.flags.writeColorSets,
            "writeFaceSets": self.flags.writeFaceSets,
            "wholeFrameGeo": self.flags.wholeFrameGeo,
            "worldSpace": self.flags.worldSpace,
            "writeVisibility": self.flags.writeVisibility,
            "writeUVSets": self.flags.writeUVSets,
            # Not supported in Maya 2018
            # "writeCreases": self.flags.writeCreases,
        }
        for key, value in booleans.iteritems():
            if value:
                jobArg += " -{}".format(key)

        # Single argument flags
        single_arguments = {
            "dataFormat": self.flags.dataFormat,
            "step": self.flags.step,
            "melPerFrameCallback": self.flags.melPerFrameCallback,
            "melPostJobCallback": self.flags.melPostJobCallback,
            "pythonPerFrameCallback": self.flags.pythonPerFrameCallback,
            "pythonPostJobCallback": self.flags.pythonPostJobCallback,
        }
        for key, value in single_arguments.iteritems():
            if value:
                jobArg += ' -{0} "{1}"'.format(key, value)

        # Multiple arguments flags
        multiple_arguments = {
            "attr": self.flags.attr,
            "attrPrefix": self.flags.attrPrefix,
            # Exports flag
            "root": exports or self.flags.root,
            "userAttrPrefix": self.flags.userAttrPrefix,
            "userAttr": self.flags.userAttr,
            "frameRelativeSample": self.flags.frameRelativeSample,
        }
        for key, value in multiple_arguments.iteritems():
            for item in value:
                jobArg += ' -{0} "{1}"'.format(key, item)

        # Frame range flag
        frame_range = (
            frame_range
            or self.flags.frameRange
            or (
                cmds.playbackOptions(q=True, min=True),
                cmds.playbackOptions(q=True, max=True),
            )
        )

        jobArg += " -frameRange {0} {1}".format(frame_range[0], frame_range[1])

        # strip namespaces flag
        if self.flags.stripNamespaces == 0:
            jobArg += " -stripNamespaces"
        elif self.flags.stripNamespaces > 0:
            jobArg += " -stripNamespaces {}".format(self.flags.stripNamespaces)

        # file flag
        if not ".abc" in filepath:
            "{}.abc".format(filepath)
        # Alembic exporter does not like back slashes
        jobArg += " -file {}".format(filepath.replace("\\", "/"))

        # TODO: Clean this bit and see if we can make do by just passing jobArg
        export_args = {
            "dontSkipUnwrittenFrames": self.flags.dontSkipUnwrittenFrames,
            "verbose": self.flags.verbose,
            "preRollStartFrame": self.flags.preRollStartFrame,
            "jobArg": jobArg,
        }

        logger.debug("Exporting with: {}".format(export_args))

        cmds.AbcExport(**export_args)
