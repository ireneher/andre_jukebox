import maya.OpenMaya as om
import maya.cmds as cmds


class MayaNode(object):
    def __init__(self, node_name):

        self.mobject = om.MObject()
        self._mdagpath = om.MDagPath()

        self.dependency_node = om.MFnDependencyNode()
        m_selection = om.MSelectionList()
        try:
            m_selection.add(node_name)
            m_selection.getDependNode(0, self.mobject)
            self.dependency_node = om.MFnDependencyNode(self.mobject)
            m_selection.getDagPath(0, self._mdagpath, om.MObject())
        except:
            pass

    @property
    def name(self):
        return self._name(long=False)

    def rename(self, new_name, force=False):

        if self.dependency_node.isLocked() and force:
            self.dependency_node.setLocked(False)
            try:
                dagMod = om.MDagModifier()
                dagMod.renameNode(self.mobject, new_name)
                dagMod.doIt()

            finally:
                self.dependency_node.setLocked(True)
        else:
            cmds.rename(self.name, new_name)

    @property
    def long_name(self):
        return self._name(long=True)

    def _name(self, long=False):
        if self._mdagpath.isValid():
            if long:
                return self._mdagpath.fullPathName()
            return self._mdagpath.partialPathName()
        else:
            if not self.mobject.isNull():
                return self.dependency_node.name()
            return None
