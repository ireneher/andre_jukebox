import glob
import os

from PySide2 import QtCore, QtGui, QtWidgets

import maya.cmds as cmds
from maya_jukebox.common import os_maya, publish
from core_jukebox import templates
from maya_jukebox.common.publish import constants

WINDOW_NAME = "Andre Jukebox Tapes"


class TapeBrowser(QtWidgets.QDialog):
    def __init__(self, mayaFile=None, parent=None):
        super(TapeBrowser, self).__init__(parent)
        self.mayaFile = mayaFile or cmds.file(query=True, l=True)[0]
        self.projectPath = cmds.workspace(q=True, active=True)

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
        assetsRoot = templates.ASSETS_ROOT.format(DCC_ROOT=self.projectPath)
        self.tapeTypeModel = QtWidgets.QFileSystemModel()
        self.tapeTypeModel.setRootPath(assetsRoot)
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
        self.tapeTypeView.setRootIndex(self.tapeTypeModel.setRootPath(assetsRoot))

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

        # mayapy location 
        self.mayapyBar = QtWidgets.QLineEdit()
        self.mayapyBar.setPlaceholderText("/path/to/mayapy.exe")
        self.mayapyBar.setText("C:/Program Files/Autodesk/Maya2020/bin/mayapy.exe")
        self.mayapyBar.setFont(QtGui.QFont("Open Sans", 12))

        # Search bar
        self.searchBar = QtWidgets.QLineEdit()
        self.searchBar.setPlaceholderText("Search")
        self.searchBar.setFont(QtGui.QFont("Open Sans", 12))
        
        # Task input
        self.taskBar = QtWidgets.QLineEdit()
        self.taskBar.setPlaceholderText("Task")
        self.taskBar.setFont(QtGui.QFont("Open Sans", 12))

        # Dropdown
        self.optionsDropdown = QtWidgets.QComboBox()
        self.optionsDropdown.addItems(["USD Asset", "USD Composition"])

        # Button
        self.publishButton = QtWidgets.QPushButton("Publish")

        # ----- Layout -----
        self.splitter.setStretchFactor(0, 1)
        self.splitter.setStretchFactor(1, 2)
        self.splitter.setStretchFactor(2, 4)
        layout = QtWidgets.QVBoxLayout(self)
        layout.addWidget(self.mayapyBar)
        layout.addWidget(self.searchBar)
        layout.addWidget(self.splitter)
        layout.addWidget(self.taskBar)
        layout.addWidget(self.optionsDropdown)
        layout.addWidget(self.publishButton)

        # ----- Connections -----
        self.tapeTypeView.clicked.connect(self.onTreeClicked)
        self.searchBar.returnPressed.connect(self.search)
        self.publishButton.clicked.connect(self.onButtonClicked)

    def search(self):
        searchStr = str(self.searchBar.text())
        if searchStr:
            searchStr = "*{}*".format(searchStr)
            self.extendedNameFilters = [searchStr + f for f in self.nameFilters] if self.nameFilters else [searchStr]
            print(self.extendedNameFilters)
            self.tapeModel.setNameFilters(self.extendedNameFilters)
        else:
            self.extendedNameFilters = []
            self.tapeModel.setNameFilters(self.nameFilters)

    def onTreeClicked(self, index):
        self.tapeView.setRootIndex(self.tapeModel.setRootPath(self.tapeTypeModel.filePath(index)))
        self.tapeModel.setNameFilters(self.extendedNameFilters or self.nameFilters)

    def onButtonClicked(self):
        publishMode = constants.PUBLISH_OPTIONS[0] if self.optionsDropdown.currentIndex() == 0 else constants.PUBLISH_OPTIONS[1]
        task = str(self.taskBar.currentText())  
        for idx in self.tapeView.selectionModel().selectedIndexes():
            filepath = os.path.join(self.tapeModel.filePath(idx), task)
            mayaFiles = glob.glob('{}/*.m*'.format(filepath))
            print(mayaFiles)
            if not mayaFiles:
                print("No Maya files found at {}".format(filepath))
            mayaFile = max(mayaFiles, key=os.path.getctime)  # get most recent scene file
            scriptPath = "{}/script.py".format(publish.__path__)
            maya = subprocess.Popen(self.mayapyBar.currentText()+' '+scriptPath+' '+ mayaFile + "--mode", publishMode, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            
            
        