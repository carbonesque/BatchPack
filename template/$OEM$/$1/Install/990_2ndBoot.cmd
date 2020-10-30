TITLE Second Boot Script
@ECHO OFF
REM =====================================================================================================     
REM #     FreeMortal's BatchPack v0.92
REM #     ##### 990_2ndBoot.cmd #####
REM #   
REM #  2nd Boot Script.
REM #  Runs after SECOND complete boot to desktop.
REM #  Cleans-up Windows shortcuts and sets registry settings.
REM #
REM #  This file should not remain anywhere on your hard drive after Windows install
REM =====================================================================================================     

REM ## Hiding With cWnd.exe by n7Epsilon -- http://www.ryanvm.net/forum/viewtopic.php?t=5017
IF EXIST %systemdrive%\install\cWnd.exe %systemdrive%\install\cWnd.exe /HIDE @

REM ## Setting Variables
SET AllUProgs=%AllUsersProfile%\Start Menu\Programs
SET DefUProgs=%SystemDrive%\Documents and Settings\Default User\Start Menu\Programs
SET HomeProgs=%homepath%\Start Menu\Programs
SET PP=%systemdrive%\install

REM ## Call Main Routine and log actions to Windows\Temp\Install.log
CALL :SecondBootCmd>>"%SystemRoot%\Temp\Install.log"
EXIT

REM ## Main Routine
:SecondBootCmd
ECHO Final Cleanup
ECHO. |TIME /t
ECHO Cleaning-up shortcuts windows recreates after restart.
MOVE /Y "%HomeProgs%\Internet Explorer*" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Accessories\System Tools\Internet Explorer*" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Outlook Express.lnk" "%AllUProgs%\Internet\"
MOVE /Y "%homepath%\Start Menu\*Torrent.lnk" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Windows Media Player*" "%AllUProgs%\Multimedia\"

DEL /F /Q "%HomeProgs%\Internet Explorer*"
DEL /F /Q "%HomeProgs%\Outlook Express.lnk"
DEL /F /Q "%homepath%\Start Menu\*Torrent.lnk"
DEL /F /Q "%HomeProgs%\Windows Media Player*"

REM ========== Load final tweaks ========== 
REM ## Some IE7 tweaks (for example) only work when loaded here
%SystemDrive%
CD\Install
IF EXIST FinalTweaks.7z 7z.exe x -y -aoa FinalTweaks.7z
IF EXIST FinalTweaks.zip 7z.exe x -y -aoa FinalTweaks.zip
IF EXIST FinalTweaks.reg ECHO Updating Registry with Final Tweaks
REGEDIT /S FinalTweaks.reg
CD %HomePath%

REM =========== Show setup message "990_SetupMsg.txt" ==========
REM ## Script will continue when user closes message
IF EXIST "%PP%\990_SetupMsg.txt" (
  START "SETUPMSG" /wait "%PP%\990_SetupMsg.txt"
  ECHO User closed Setup Message
  ECHO. |TIME /t
)

ECHO Final Cleanup. Removing Install folder.
DEL /F /Q "%AllUProgs%\Startup\2ndBoot.lnk"
RD /S /Q %systemdrive%\install
ECHO Install Finished!
ECHO. |TIME /t
GOTO :EOF
