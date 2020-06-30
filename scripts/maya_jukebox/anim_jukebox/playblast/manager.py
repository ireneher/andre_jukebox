import datetime
import os
import pprint
import re
import shutil
import sys
import traceback
import logging

import maya.cmds as cmds

logger = logging.getLogger(__name__)


class PlayblastManager(object):

    """
    Main playblast functionality
    """

    def __init__(self, frame_range=None):
        # setting playback range
        self.original_range = (
            cmds.playbackOptions(query=True, minTime=True),
            cmds.playbackOptions(query=True, maxTime=True),
        )

        if frame_range:
            self.start_frame, self.end_frame = frame_range
        else:
            self.start_frame = cmds.playbackOptions(query=True, animationStartTime=True)
            self.end_frame = cmds.playbackOptions(query=True, animationEndTime=True)

    def doPlayblast(self):

        # Get value of optional config field "temp_directory". If path is
        # invalid or not absolute, use default tempdir.
        temp_directory = ""
        # make sure it is exists
        if not os.path.isdir(temp_directory):
            os.mkdir(temp_directory)
        # use the basename of generated names
        self.localPlayblastPath = os.path.join(
            temp_directory, os.path.basename(self.shotPlayblastPath)
        )
        # run actual playblast routine
        self.__createPlayblast()
        logger.info("Playblast for %s succesful" % sceneName)

    def __createPlayblast(self):
        localPlayblastPath = self.localPlayblastPath

        cmds.playbackOptions(edit=True, minTime=startTime, maxTime=endTime)

        # with the created window, do a playblast
        with createWindow():
            playblastParams.update(overridePlayblastParams)
            playblastSuccessful = False
            while not playblastSuccessful:
                try:
                    # set required visibleHUDs from hook
                    visibleHUDs = self._app.execute_hook(
                        "hook_setup_window", action="hud_set"
                    )

                    resultPlayblastPath = cmds.playblast(**playblastParams)
                    playblastSuccessful = True
                except RuntimeError, e:
                    logger.error("")
                    return
                finally:
                    # restore HUD state
                    # restore playback range
                    originalMinTime, originalMaxTime = originalPlaybackRange
                    cmds.playbackOptions(
                        edit=True, minTime=originalMinTime, maxTime=originalMaxTime
                    )

        # do post playblast process, copy files

        if result:
            logger.info("Playblast local file created: %s" % localPlayblastPath)
