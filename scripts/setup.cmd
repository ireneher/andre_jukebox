
rem EDIT THE FOLLOWING PATHS!!!
set AJ_MAYAPY_PATH="C:/Program Files/Autodesk/Maya2018/bin/mayapy.exe"
set AJ_PROJECT_PATH="C:/Users/their/Documents/AJ_test/MAYA"
set AJ_SCRIPTS_PATH="C:/Users/their/dev/andre_jukebox/scripts"

rem -------------------------------------------------------------------------------------------------------------
rem SET ENVIRONMENT VARIABLES
setx AJ_PROJECT %AJ_PROJECT_PATH%
setx AJ_MAYAPY %AJ_MAYAPY_PATH%
setx AJ_SCRIPTS %AJ_SCRIPTS_PATH%

rem DEFINE ALIASES FOR STAND-ALONE TOOLS
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"%CD%\aliases.doskey\"" /f
reg query "HKCU\Software\Microsoft\Command Processor" /v Autorun


