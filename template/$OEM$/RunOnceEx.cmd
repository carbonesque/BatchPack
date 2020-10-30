TITLE Setting Programs for Install on next boot
@ECHO OFF
REM =====================================================================================================     
REM #     FreeMortal's BatchPack v0.92
REM #     ###### RunOnceEx.cmd ######
REM #  
REM #  Sets programs for install on next boot
REM #  This file should not remain anywhere on your hard drive after Windows install
REM =====================================================================================================

REM ## Hiding With cWnd.exe by n7Epsilon -- http://www.ryanvm.net/forum/viewtopic.php?t=5017
IF EXIST %systemdrive%\install\cWnd.exe %systemdrive%\install\cWnd.exe /HIDE @

REM ## Set Strings
SET PP=%SystemDrive%\Install
SET AllUProgs=%AllUsersProfile%\Start Menu\Programs
SET KEY=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
SET CDFIND=\WIN51

REM ## Call Main Routine and log actions to Windows\Temp\Install.log
CALL :RunOnceExCmd>>"%SystemRoot%\Temp\Install.log"
EXIT

REM ## Main Routine
:RunOnceExCmd
ECHO Starting RunOnceEx
ECHO. |TIME /t

REM ## NOT COMPATIBLE WITH ROGUESPEAR'S SCRIPTPACK.
REM ## If RogueSpear's scriptpack is detected, this script will exit 
REM ## and other BatchPack scripts will not be run.
IF EXIST %systemdrive%\OEM\CmdLines.vbs GOTO :SCRIPTPACK
IF EXIST %systemdrive%\$OEM$\CmdLines.vbs GOTO :SCRIPTPACK

REM ## Set CD Drive
FOR %%i In (C D E F G H I J K L M N O P Q R S T U V W X Y Z) Do If Exist "%%i:%CDFIND%" Set CDROM=%%i:
IF NOT DEFINED CDROM Set CDROM=%CD%\..\

IF EXIST %CDROM%\OEM\OEMSCAN.EXE (
  ECHO Running OEMScan
  ECHO. |TIME /t
  %CDROM%\OEM\OEMSCAN.EXE
)

IF EXIST %PP%\InsTools.7z (
  ECHO Unpacking tools for additional functions.
  ECHO. |TIME /t
  %PP%\7z.exe x -y -aoa %PP%\InsTools.7z -o%PP%
)

REM ## Importing these registry settings before OOBE runs and creates a user.
IF EXIST CmdLines.reg (
  ECHO Adding CmdLines.reg
  ECHO. |TIME /t
  REGEDIT /S CmdLines.reg
)

REM ## Rename in case AutoImage truncates filename
IF EXIST "%PP%\010_RogueSpearsRuntimesPart.exe" REN "%PP%\010_RogueSpearsRuntimesPart.exe" 010_RogueSpearsRuntimesPart2.exe

REM ## Search Install folder for RunOnceEx programs to run on next boot
ECHO Setting programs and scripts to run from RunOnceEx on next boot
ECHO. |TIME /t
REG ADD %KEY% /V TITLE /D "Installing Programs" /f

IF EXIST "%PP%\010_dotNET30.exe" (
  REG ADD %KEY%\010 /VE /D "Installing .NET Framework 3.0" /f
  REG ADD %KEY%\010 /V 1 /D "%PP%\010_dotNET30.exe" /f 
)
IF EXIST "%PP%\010_dotNET30-Lite.exe" (
  REG ADD %KEY%\010 /VE /D "Installing .NET Framework 3.0" /f
  REG ADD %KEY%\010 /V 1 /D "%PP%\010_dotNET30-Lite.exe" /f 
)
IF EXIST "%PP%\010_dotNET35.exe" (
  REG ADD %KEY%\010 /VE /D "Installing .NET Framework 3.5" /f
  REG ADD %KEY%\010 /V 1 /D "%PP%\010_dotNET35.exe" /f 
)
IF EXIST "%PP%\010_dotNET35-Lite.exe" (
  REG ADD %KEY%\010 /VE /D "Installing .NET Framework 3.5" /f
  REG ADD %KEY%\010 /V 1 /D "%PP%\010_dotNET35-Lite.exe" /f 
)
IF EXIST "%PP%\010_RogueSpearsRuntimesPart2.exe" (
  REG ADD %KEY%\010 /VE /D "Installing .NET Framework 3.5" /f
  REG ADD %KEY%\010 /V 1 /D "%PP%\010_RogueSpearsRuntimesPart2.exe" /f 
)
IF EXIST "%PP%\011_MSRV2008.exe" (
  REG ADD %KEY%\011 /VE /D "Microsoft Report Viewer 2008" /f
  REG ADD %KEY%\011 /V 1 /D "%PP%\011_MSRV2008.exe" /f 
)
IF EXIST "%PP%\012_VSTO20.exe" (
  REG ADD %KEY%\012 /VE /D "VS Tools for Office Runtime 2.0" /f
  REG ADD %KEY%\012 /V 1 /D "%PP%\012_VSTO20.exe" /f 
)
IF EXIST "%PP%\013_VSTO30.exe" (
  REG ADD %KEY%\013 /VE /D "VS Tools for Office Runtime 3.0" /f
  REG ADD %KEY%\013 /V 1 /D "%PP%\013_VSTO30.exe" /f 
)
IF EXIST "%PP%\020_PaintNET.exe" (
  REG ADD %KEY%\020 /VE /D "Installing Paint.NET" /f
  REG ADD %KEY%\020 /V 1 /D "%PP%\020_PaintNET.exe" /f 
)
IF EXIST "%PP%\030_WSE.exe" (
  REG ADD %KEY%\030 /VE /D "Microsoft Web Services Enhancements" /f
  REG ADD %KEY%\030 /V 1 /D "%PP%\030_WSE.exe" /f 
)
IF EXIST "%PP%\040_WindowsDefender.exe" (
  REG ADD %KEY%\040 /VE /D "Installing Windows Defender" /f
  REG ADD %KEY%\040 /V 1 /D "%PP%\040_WindowsDefender.exe" /f 
)
IF EXIST "%PP%\050_DAEMONTools.exe" (
  REG ADD %KEY%\050 /VE /D "Installing DAEMON Tools" /f
  REG ADD %KEY%\050 /V 1 /D "%PP%\050_DAEMONTools.exe" /f 
)

REM ## BTS DriverPacks Finisher will run at this point (937) if set to RunOnceEx.
REM ## An entry here is not needed because Finisher is set to run from CmdLines.txt.
REM ## If Finisher is set to GUIRunOnce, it will run after these scripts finish.
REM ## The benefit of running it here is the defrag occurs AFTER the Finisher.

IF EXIST "%PP%\950_DlReg.cmd" (
  REG ADD %KEY%\950 /VE /D "Updating Security Settings" /f
  REG ADD %KEY%\950 /V 1 /D "%PP%\950_DlReg.cmd" /f 
)
IF EXIST "%PP%\960_CleanUp.cmd" (
  REG ADD %KEY%\960 /VE /D "Installation Cleanup" /f
  REG ADD %KEY%\960 /V 1 /D "%PP%\960_CleanUp.cmd" /f
)
IF EXIST "%PP%\970_Defrag.cmd" (
  REG ADD %KEY%\970 /VE /D "Defragging Registry and Drive" /f
  REG ADD %KEY%\970 /V 1 /D "%PP%\970_Defrag.cmd" /f 
)

ECHO Setting 980_1stBoot.cmd to run when desktop loads for the first time.
REM ## It seems that using RunOnce causes the same script to be run on both first and second boot; using alt. method instead.
rem REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /V FirstBoot /D "%PP%\980_1stBoot.cmd" /f
REM ## Alternate method
COPY "%PP%\1stBoot.lnk" "%AllUProgs%\Startup\"

ECHO Normal exit for RunOnceEx.cmd
ECHO. |TIME /t
GOTO :EOF

:SCRIPTPACK
ECHO RogueSpear's ScriptPack Exists! BatchPack will not be run!
ECHO. |TIME /t
EXIT
