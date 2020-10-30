TITLE First Boot script
@ECHO OFF
REM =====================================================================================================     
REM #     FreeMortal's BatchPack v0.92
REM #     ##### 980_1stBoot.cmd #####
REM #   
REM #  Runs after first complete boot to desktop.
REM #  Some registry settings do not save if made after the very first boot to desktop.
REM #  This script will reboot one last time and set 2ndBoot script to run next boot.
REM #  2ndBoot Script does all the real work with reg settings and shorcuts.
REM #
REM #  This file should not remain anywhere on your hard drive after Windows install
REM =====================================================================================================     

REM ## Hiding With cWnd.exe by n7Epsilon -- http://www.ryanvm.net/forum/viewtopic.php?t=5017
IF EXIST %systemdrive%\install\cWnd.exe %systemdrive%\install\cWnd.exe /HIDE @

REM ## Setting Variables
SET PP=%systemdrive%\install
SET AllUProgs=%AllUsersProfile%\Start Menu\Programs

REM ## Call Main Routine and log actions to Windows\Temp\Install.log
CALL :FirstBootCmd>>"%SystemRoot%\Temp\Install.log"
EXIT

REM ## Main Routine
:FirstBootCmd
ECHO Running First Boot script
ECHO. |TIME /t

REM ========== Replace HOSTS file ==========
REM ## Replaces default HOSTS file with custom HOSTS file, if included
REM ## WARNING: A large HOST file can cause slowdowns on network related activity
REM ## Disabling DNS client service may help
IF EXIST %PP%\hosts (
  ECHO Replacing Hosts file
  ECHO. |TIME /t
  ATTRIB %WinDir%\System32\drivers\etc\hosts -r -h -s
	COPY /Y %PP%\hosts %WinDir%\System32\drivers\etc\
	ATTRIB %WinDir%\System32\drivers\etc\hosts +r +h +s
)

ECHO Copying IEPro settings
MD "%HomePath%\Application Data\IEPro"
COPY /y "%PP%\IEPro.ini" "%HomePath%\Application Data\IEPro\conf.ini"

ECHO Setting 990_2ndBoot.cmd to run after this restart.
REM First boot RunOnce registry settings don't seem to stick, so running from Startup folder instead.
rem REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /V SecondBoot /D "%PP%\990_2ndBoot.cmd" /f
REM ## Alternate Method. Must remove 980_1stBoot.cmd first.
DEL /F /Q "%AllUProgs%\Startup\1stBoot.lnk"
COPY "%PP%\2ndBoot.lnk" "%AllUProgs%\Startup\"

ECHO Setting automatic shutdown to finalize settings
REM ## Shutdown.exe from Beyond Logic - http://www.beyondlogic.org/consulting/shutdown/shutdown.htm
%PP%\shutdown.exe -s reboot -f -l 30 -m "Finishing Install... DO NOT INTERRUPT. Windows XP will restart one last time"
REM ## Alternate Windows Shutdown
rem shutdown -r -f -t 30 -d P:2:4 -c "Finishing Install... DO NOT INTERRUPT. Windows XP will restart one last time"

GOTO :EOF
