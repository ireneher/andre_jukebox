import maya.OpenMaya as om
 
class MayaNode(object):
    def __init__(self, node_name):
        self._mobject = om.MObject()
        self._mdagpath = om.MDagPath()
        
        self.dependency_node = om.MFnDependencyNode()
        m_selection = om.MSelectionList()
        try:
            m_selection.add(node_name)
            m_selection.getDependNode(0, self._mobject)
            self.dependency_node = om.MFnDependencyNode(self._mobject)
            m_selection.getDagPath(0, self._mdagpath, om.MObject())
        except:
            pass

    @property
    def name(self):
        return self._name(long=False)

    @property
    def long_name(self):
        return self._name(long=True)

    def _name(self, long=False):
        if self._mdagpath.isValid():
            if long:
                return self._mdagpath.fullPathName()
            return self._mdagpath.partialPathName()
        else:
            if not self._mobject.isNull():
                return self._node.name()
            return None