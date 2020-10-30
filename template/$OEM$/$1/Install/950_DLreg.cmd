TITLE Applying updated security settings on the registry
@ECHO OFF
REM =====================================================================================================     
REM #     FreeMortal's BatchPack v0.92
REM #     ###### 950_DLreg.cmd ######
REM #  
REM #  Downloads latest security settings from RogueSpear's site, if possible.
REM #  From RogueSpears ScriptPack http://www.doitrightconsulting.net/forum/viewforum.php?f=3
REM #  Imports custom registry
REM #  
REM #  This file should not remain anywhere on your hard drive after Windows install
REM =====================================================================================================     

REM Hiding With cWnd.exe by n7Epsilon -- http://www.ryanvm.net/forum/viewtopic.php?t=5017
IF EXIST %systemdrive%\install\cWnd.exe %systemdrive%\install\cWnd.exe /HIDE @

REM Logging all actions to Install.log
SET INSLOG="%SystemRoot%\Temp\Install.log"

%SystemDrive%
CD\Install

REM ActiveX.7z, Cookies.7z, and RestrictedDomains.7z help protect Internet Explorer 
REM from spyware.  They were compiled by RogueSpear and are updated and downloaded from
REM http://www.doitrightconsulting.net/forum/viewforum.php?f=3
ECHO Downloading latest Anti-malware registry settings >>%INSLOG%
ECHO. |TIME /t  >>%INSLOG%
Wget -t3 -m -nd http://www.DoITRightConsulting.net/files/ActiveX.7z
Wget -t3 -m -nd http://www.DoITRightConsulting.net/files/Cookies.7z
Wget -t3 -m -nd http://www.DoITRightConsulting.net/files/RestrictedDomains.7z

7z.exe x -y -aoa ActiveX.7z >>%INSLOG%
7z.exe x -y -aoa Cookies.7z >>%INSLOG%
7z.exe x -y -aoa RestrictedDomains.7z >>%INSLOG%
IF EXIST RegTweaks.7z 7z.exe x -y -aoa RegTweaks.7z >>%INSLOG%
IF EXIST RegTweaks.zip 7z.exe x -y -aoa RegTweaks.zip >>%INSLOG%

ECHO Adding settings to the registry >>%INSLOG%
REGEDIT /S ActiveX.reg
REGEDIT /S Cookies.reg
REGEDIT /S RestrictedDomains.reg
REGEDIT /S RegTweaks.reg

ECHO Done updating Registry >>%INSLOG%
ECHO. |TIME /t >>%INSLOG%
EXIT
