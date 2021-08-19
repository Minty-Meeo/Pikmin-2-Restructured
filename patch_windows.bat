@ECHO OFF
CHCP 65001 >nul
SET argc=0 & FOR %%i IN (%*) DO SET /A argc+=1

SET home=%~d0%~p0
SET drop=%~d1%~p1

ECHO Welcome to the Pikmin 2 Restructured patcher!

IF %argc% EQU 0 (
    ECHO Please pass the filepath to a Pikmin 2 USA v1.00 *.gcm file as an argument.
    GOTO END
)

IF EXIST "%drop%root" (
    ECHO Please remove "%drop%root".
    GOTO END
)

:: Extract GCM
ECHO Step 1) Extracting "%~n1%~x1" to "%drop%root".  This may take a while.
"%home%nodtool.win64" extract -c 2 "%~1" "%drop%root"
IF %errorlevel% == 1 (
    ECHO Error while extracting
    GOTO :END
)

:: Patch things
ECHO "Step 2) Restructuring filesystem and patching in new files."
CALL "%home%restructure.bat" "%drop%root\files\"
ROBOCOPY /E "%home%patch\files" "%drop%root\files" *
ROBOCOPY /E "%home%patch\sys" "%drop%root\sys" *

CHOICE /M "Would you like to rebuild a new *%~x1 and remove the root folder?"
IF %ERRORLEVEL% EQU 2 GOTO :END

:: Rebuild GCM
ECHO Step 3) Rebuilding new *%~x1 at "%drop%Pikmin 2 Restructured%~x1".
"%home%nodtool.win64" makegcn -c 2 "%drop%root" "%drop%Pikmin 2 Restructured%~x1"
IF %errorlevel% == 1 (
    ECHO Error while rebuilding
    GOTO :END
)

:: Cleanup
echo Step 4) Removing "%drop%root" folder
RMDIR /S /Q "%drop%root"

:END
PAUSE