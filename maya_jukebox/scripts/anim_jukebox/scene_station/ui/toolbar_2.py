
# -*- coding: utf-8 -*-
from __future__ import print_function

"""Sidebar for plugins. The sidebar comprises of actions.
Currently mode, connect and settings are defined.
"""

__author__      =   "Aviral Goel"
__credits__     =   ["Upi Lab"]
__license__     =   "GPL3"
__version__     =   "1.0.0"
__maintainer__  =   "Aviral Goel"
__email__       =   "goel.aviral@gmail.com"
__status__      =   "Development"


import sys
import os
from PySide2 import QtGui, QtCore, QtWidgets
from PySide2.QtWidgets import QDialog
from PySide2.QtWidgets import QHBoxLayout
from PySide2.QtGui import QPixmap
from PySide2.QtGui import QIcon
from PySide2.QtWidgets import QPushButton
from PySide2.QtWidgets import QAction



ICON_DIRECTORY              = "icons"
HAND_ICON_FILENAME          = "hand.png"
CONNECTOR_ICON_FILENAME     = "straight_connector_with_filled_circles.png"
WRENCH_ICON_FILENAME        = "wrench.png"
DELETE_GRAPH_ICON_FILENAME  = "add_graph.png"
ADD_GRAPH_ICON_FILENAME     = "delete_graph.png"
LIST_ICON_FILENAME          = "list.png"


def create_action( parent
                , callback
                , text
                , checkable
                , checked
                , icon_path
                ):
    pixmap = QPixmap(icon_path)
    icon = QIcon(pixmap)
    action  = QAction(icon, text, parent)
    # action.setIcon(icon)
    # action.setIconText(text)
    action.triggered.connect(callback)
    action.setCheckable(checkable)
    action.setChecked(checked)
    return action


def mode_action( parent
            , callback   = (lambda event: print("Mode Clicked!"))
            , text       = "Mode"
            , checkable  = True
            , checked    = True
            , icon_path  = os.path.join( ICON_DIRECTORY
                                        , HAND_ICON_FILENAME
                                        )
            ):
    return create_action( parent
                        , callback
                        , text
                        , checkable
                        , checked
                        , icon_path
                        )

def add_graph_action( parent
                , callback   = (lambda event: print("Add Graph Clicked!"))
                , text       = "Add Graph"
                , checkable  = False
                , checked    = False
                , icon_path  = os.path.join( ICON_DIRECTORY
                                            , ADD_GRAPH_ICON_FILENAME
                                            )
                ):
    return create_action( parent
                        , callback
                        , text
                        , checkable
                        , checked
                        , icon_path
                        )

def delete_graph_action( parent
                    , callback   = (lambda event: print("Delete Graph Clicked!"))
                    , text       = "Delete Graph"
                    , checkable  = False
                    , checked    = False
                    , icon_path  = os.path.join( ICON_DIRECTORY
                                                , DELETE_GRAPH_ICON_FILENAME
                                                )
                    ):
    return create_action( parent
                        , callback
                        , text
                        , checkable
                        , checked
                        , icon_path
                        )

def list_action( parent
            , callback   = (lambda event: print("List Clicked!"))
            , text       = "Show List"
            , checkable  = False
            , checked    = False
            , icon_path  = os.path.join( ICON_DIRECTORY
                                        , LIST_ICON_FILENAME
                                        )
            ):
    return create_action( parent
                        , callback
                        , text
                        , checkable
                        , checked
                        , icon_path
                        )

def connector_action( parent
                    , callback   = (lambda event: print("Connector Clicked!"))
                    , text       = "Mode"
                    , checkable  = True
                    , checked    = False
                    , icon_path  = os.path.join( ICON_DIRECTORY
                                            , CONNECTOR_ICON_FILENAME
                                            )
                    ):
    return create_action( parent
                        , callback
                        , text
                        , checkable
                        , checked
                        , icon_path
                        )

def settings_action( parent
                , callback   = (lambda event: print("Settings Clicked"))
                , text       = "Mode"
                , checkable  = False
                , checked    = False
                , icon_path  = os.path.join( ICON_DIRECTORY
                                            , WRENCH_ICON_FILENAME
                                            )
                ):
    return create_action( parent
                        , callback
                        , text
                        , checkable
                        , checked
                        , icon_path
                        )


        #   actions
        # , left_spacer  = False
        # , right_spacer = False

def sidebar():
    return QtWidgets.QToolBar()
    # bar.setOrientation(QtCore.Qt.Vertical)
    # return bar
    # if left_spacer:
    #     left_spacer = QWidget()
    #     left_spacer.setSizePolicy( QtGui.QSizePolicy.Expanding
    #                              , QtGui.QSizePolicy.Expanding
    #                              )
    #     toolbar.addWidget(left_spacer)

    # for action in actions:
    #     toolbar.addAction(action(toolbar))

    # if right_spacer:
    #     right_spacer = QWidget()
    #     right_spacer.setSizePolicy( QtGui.QSizePolicy.Expanding
    #                               , QtGui.QSizePolicy.Expanding
    #                               )
    #     toolbar.addWidget(right_spacer)

    # return toolbar




# def connect_action():

# def settings_action():



def main():
    app = QtWidgets.QApplication(sys.argv)
    window = QtWidgets.QMainWindow(parent=None)
    widget = QtWidgets.QWidget()
    d = QDialog()
    l = QHBoxLayout()
    d.setLayout(l)
    l.addWidget(widget)
    bar = sidebar()
    bar.addAction(mode_action(bar))
    bar.addAction(connector_action(bar))
    bar.addAction(settings_action(bar, d.show))
    window.addToolBar(bar)
    window.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()

# # spacer widget for left
# # spacer widget for right
# # you can't add the same widget to both left and right. you need two different widgets.
# right_spacer = QtGui.QWidget()
# right_spacer.setSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)

# # here goes the left one
# # toolbar.addWidget(left_spacer)
# # some dummy actions



# ################################################################################
# # Hand Tool
# ################################################################################




