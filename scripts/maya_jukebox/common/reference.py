
import maya.cmds as cmds
import maya.OpenMaya as om

from maya_jukebox.common import node

class FileReference(node.MayaNode):
    "Inspired by the pymel FileReference but without the ages to load"

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
        self._fn_reference.setObject(self._mobject)
        
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
