import maya.cmds as cmds
import maya.OpenMaya as om

from maya_jukebox.common import node


class FileReference(node.MayaNode):
    """Inspired by the pymel FileReference, without taking ages to load
    """

    @classmethod
    def create_reference(cls, filepath, namespace=None):
        """ Create a maya reference in the scene and return a class object
        Args:
            filepath (str)
        """
        new_nodes = cmds.file(
            filepath,
            reference=True,
            namespace=namespace,
            returnNewNodes=True,
            ignoreVersion=True,
            force=True,
        )
        if not new_nodes:
            om.MGlobal.displayWarning("Failed to reference: {}".format(new_nodes))
            return
        reference_node = cmds.referenceQuery(new_nodes[0], referenceNode=True)
        return cls(reference_node)

    @classmethod
    def ls_references(cls):
        iter = om.MItDependencyNodes(om.MFn.kReference)
        fn_reference = om.MFnReference()

        references = []

        while not iter.isDone():
            fn_reference.setObject(iter.thisNode())
            references.append(cls(fn_reference.name()))
            iter.next()
        return references

    def __init__(self, refnode):
        super(FileReference, self).__init__(refnode)

        self._fn_reference = om.MFnReference()
        self._fn_reference.setObject(self.mobject)

    def __repr__(self):
        return "{}({}, {})".format(
            self.__class__.__name__, self.namespace, self.ref_node
        )

    @property
    def namespace(self):
        return self._fn_reference.associatedNamespace(True)

    @namespace.setter
    def namespace(self, new_namespace):
        cmds.namespace(rename=[self.namespace, new_namespace], parent=":")

    @property
    def ref_node(self):
        return self._fn_reference.name()

    @property
    def filepath(self):
        # TODO : THis should be changed to a relative path
        return self._fn_reference.fileName(True, False, False)

    @filepath.setter
    def filepath(self, new_filepath):
        cmds.file(new_filepath, loadReference=self.ref_node)

