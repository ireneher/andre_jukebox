import glob
import os
import subprocess

from PySide2 import QtCore, QtGui, QtWidgets

import maya.cmds as cmds
from maya_jukebox.common import os_maya, publish
from core_jukebox import templates
from maya_jukebox.usd_jukebox import publish as usd_publish
#from maya_jukebox.tasks.anim.publish import api as anim_publish
from maya_jukebox.common.publish import utils

WINDOW_NAME = "Andre Jukebox Tapes"


class TapeBrowser(QtWidgets.QDialog):
    def __init__(self, mayaFile=None, parent=None):
        super(TapeBrowser, self).__init__(parent)
        #self.mayaFile = mayaFile or cmds.file(query=True, l=True)[0]
        #self.projectPath = cmds.workspace(q=True, active=True)
        self.projectPath = "C:/Users/their/Documents/AJ_test/MAYA"
        self.projectPath = os.environ["AJ_PROJECT"]

        self.publishCurrentCheckbox = QtWidgets.QCheckBox("Publish Current")
        self.publishCurrentCheckbox.setChecked(True)

        self.setWindowTitle(WINDOW_NAME)
        self.setObjectName(WINDOW_NAME)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        self.setWindowFlags(QtCore.Qt.Dialog)
        screenGeometry = QtWidgets.QDesktopWidget.screenGeometry(
            QtWidgets.QDesktopWidget()
        )
        self.setMinimumWidth(screenGeometry.width() * 0.5)
        self.setMinimumHeight(screenGeometry.height() * 0.5)

        # ----- Components -----
        # Splitter
        self.splitter = QtWidgets.QSplitter()
        self.splitter.setWindowState(QtCore.Qt.WindowMaximized)
        # Directories model
        self.assetsRoot = templates.ASSETS_ROOT.format(DCC_ROOT=self.projectPath)
        self.tapeTypeModel = QtWidgets.QFileSystemModel()
        self.tapeTypeModel.setRootPath(self.assetsRoot)
        self.tapeTypeModel.setFilter(QtCore.QDir.AllDirs | QtCore.QDir.NoDotAndDotDot)

        self.tapeModel = QtWidgets.QFileSystemModel()
        
        self.tapeModel.setFilter(QtCore.QDir.AllDirs | QtCore.QDir.NoDotAndDotDot)
        self.nameFilters = []  # placeholder for potential filters
        self.extendedNameFilters = []  # to be populated by search bar
        self.tapeModel.setNameFilters(self.nameFilters)

        # Tape type view
        self.tapeTypeView = QtWidgets.QTreeView(self.splitter)
        self.tapeTypeView.setModel(self.tapeTypeModel)
        self.tapeTypeView.hideColumn(1)
        self.tapeTypeView.hideColumn(2)
        self.tapeTypeView.hideColumn(3)
        self.tapeTypeView.resizeColumnToContents(0)
        self.tapeTypeView.expandAll()
        self.tapeTypeView.setItemsExpandable(False)
        self.tapeTypeView.setRootIndex(self.tapeTypeModel.setRootPath(self.assetsRoot))

        # Tape view
        self.tapeView = QtWidgets.QTreeView(self.splitter)
        self.tapeView.setModel(self.tapeModel)
        self.tapeView.hideColumn(1)
        self.tapeView.hideColumn(2)
        self.tapeView.hideColumn(3)
        self.tapeView.resizeColumnToContents(0)
        self.tapeView.setSelectionMode(QtWidgets.QAbstractItemView.MultiSelection)
        self.tapeView.expandAll()
        self.tapeView.setItemsExpandable(False)

        # maya project location 
        # self.projectBar = QtWidgets.QLineEdit()
        # self.projectBar.setPlaceholderText("/path/to/project/root/MAYA")
        # self.projectBar.setText(self.projectPath)
        # self.projectBar.setFont(QtGui.QFont("Open Sans", 12))

        # Search bar
        # self.searchBar = QtWidgets.QLineEdit()
        # self.searchBar.setPlaceholderText("Search")
        # self.searchBar.setFont(QtGui.QFont("Open Sans", 12))
        
        # Task input
        self.taskBar = QtWidgets.QLineEdit()
        self.taskBar.setPlaceholderText("Task")
        self.taskBar.setFont(QtGui.QFont("Open Sans", 12))

        # Dropdown
        self.optionsDropdown = QtWidgets.QComboBox()
        self.optionsDropdown.addItems(["USD Asset", "USD Composition", "Anim Cache"])

        # Button
        self.publishButton = QtWidgets.QPushButton("Publish")

        # ----- Layout -----
        self.splitter.setStretchFactor(0, 1)
        self.splitter.setStretchFactor(1, 2)
        self.splitter.setStretchFactor(2, 4)
        layout = QtWidgets.QVBoxLayout(self)
        #layout.addWidget(self.projectBar)
        #layout.addWidget(self.searchBar)
        layout.addWidget(self.publishCurrentCheckbox)
        layout.addWidget(self.splitter)
        layout.addWidget(self.taskBar)
        layout.addWidget(self.optionsDropdown)
        layout.addWidget(self.publishButton)

        # ----- Connections -----
        self.tapeTypeView.clicked.connect(self.onTreeClicked)
        #self.projectBar.returnPressed.connect(self.updateProject)
        self.publishButton.clicked.connect(self.onButtonClicked)
        
    def updateProject():
        self.projectPath = str(self.projectBar.text())
        self.assetsRoot = templates.ASSETS_ROOT.format(DCC_ROOT=self.projectPath)
        self.tapeTypeModel.setRootPath(self.assetsRoot)
        self.tapeTypeView.setRootIndex(self.tapeTypeModel.setRootPath(self.assetsRoot))


    def onTreeClicked(self, index):
        self.tapeView.setRootIndex(self.tapeModel.setRootPath(self.tapeTypeModel.filePath(index)))
        self.tapeModel.setNameFilters(self.extendedNameFilters or self.nameFilters)

    def onButtonClicked(self):
        # Don't know why this import is needed here
        from maya_jukebox.usd_jukebox import publish as usd_publish
        task = str(self.taskBar.text())  
        task_workarea = templates.ASSET_WORKAREA_REL.format(task=task)
        if self.publishCurrentCheckbox.checkState():
            self._publish(cmds.file(query=True))
        for idx in self.tapeView.selectionModel().selectedRows():
            filepath = os.path.join(self.tapeModel.filePath(idx), task_workarea)
            mayaFiles = glob.glob('{}/*.m*'.format(filepath))
            if not mayaFiles:
                print("No Maya files found at {}".format(filepath))
            mayaFile = max(mayaFiles, key=os.path.getctime)  # get most recent scene file
            self._publish(mayaFile)
            
            # scriptPath = "{}/script.py".format(publish.__path__[0])
            # maya = subprocess.Popen([self._toRaw(self.mayapyBar.text())+' '+self._toRaw(scriptPath)+' '+ self._toRaw(mayaFile) + " --mode " + publishMode],
            #                         shell=True, stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
    def _publish(mayaFile):
        if self.optionsDropdown.currentIndex() == 0:
                usd_publish.publishAsset(mayaFile=mayaFile, batch=True)
        elif self.optionsDropdown.currentIndex() == 1:
            usd_publish.publishComposition(mayaFile=mayaFile, batch=True)
        elif self.optionsDropdown.currentIndex() == 2:
            pass
            #animPublishManager = anim_publish.Manager()
            #animPublishManager.publish(archive=True, mayaFile=mayaFile)
        
        utils.sanitise(mayaFile)

    def _toRaw(self, string):
        return r'{}'.format(string)
            
            
        