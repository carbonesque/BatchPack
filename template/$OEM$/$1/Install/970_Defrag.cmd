TITLE Defrag
@ECHO OFF
REM =====================================================================================================     
REM #     FreeMortal's BatchPack v0.92
REM #     ###### 970_Defrag.cmd ######
REM #  
REM #  Defrag hard drive after install but before first complete boot to desktop
REM #
REM #  This file should not remain anywhere on your hard drive after Windows install
REM =====================================================================================================     

REM ## Hiding With cWnd.exe by n7Epsilon -- http://www.ryanvm.net/forum/viewtopic.php?t=5017
IF EXIST %systemdrive%\install\cWnd.exe %systemdrive%\install\cWnd.exe /HIDE @

REM  ========== Setting Variables ==========
SET PP=%systemdrive%\install

REM ## Call Main Routine and log actions to Windows\Temp\Install.log
CALL :DefragCmd>>"%SystemRoot%\Temp\Install.log"
EXIT

REM ## Main Routine
:DefragCmd
ECHO Starting Defrag
ECHO. |TIME /t
REM ## http://www.larshederer.homepage.t-online.de/erunt/
REM ## WARNING: NTRegOpt will lock the registry from any more changes until next boot. (where 990_2ndBoot.cmd runs)
IF EXIST %PP%\NTRegOpt.exe (
  ECHO Defraging the registry
  ECHO. |TIME /t
  %PP%\NTRegOpt.exe silent
)
REM ## http://www.kessels.com/Jkdefrag/
IF EXIST %PP%\JkDefrag.exe (
  ECHO Defraging the hard drive
  ECHO. |TIME /t
  %PP%\JkDefrag.exe -a 7 -d 2 -q %systemdrive%
)

ECHO Done with Defrag
ECHO. |TIME /t
GOTO :EOF
