TITLE Final Settings and Cleanup Before Final Restart
@ECHO OFF
REM =====================================================================================================     
REM #     FreeMortal's BatchPack v0.92
REM #     ###### 960_CleanUp.cmd ######
REM #  
REM #  Organize Start Menu
REM #  This file should not remain anywhere on your hard drive after Windows install
REM =====================================================================================================     

REM ## Hiding With cWnd.exe by n7Epsilon -- http://www.ryanvm.net/forum/viewtopic.php?t=5017
IF EXIST %systemdrive%\install\cWnd.exe %systemdrive%\install\cWnd.exe /HIDE @

REM ========== Setting Variables ==========
SET AllUProgs=%AllUsersProfile%\Start Menu\Programs
SET DefUProgs=%SystemDrive%\Documents and Settings\Default User\Start Menu\Programs
SET HomeProgs=%HomePath%\Start Menu\Programs
SET PP=%systemdrive%\install

REM ## Call Main Routine and log actions to Windows\Temp\Install.log
CALL :CleanupCmd>>"%SystemRoot%\Temp\Install.log"
EXIT

:CleanupCmd
ECHO Starting Cleanup.
ECHO. |TIME /t

REM ==================== ORGANIZING FOLDERS ==================== 
ECHO Cleaning up and organizing the Start Menu

REM ## Creating Folders to organize all the shortcuts
IF NOT EXIST "%AllUProgs%\Internet" MD "%AllUProgs%\Internet"
IF NOT EXIST "%AllUProgs%\Security" MD "%AllUProgs%\Security"
IF NOT EXIST "%AllUProgs%\Multimedia" MD "%AllUProgs%\Multimedia"
IF NOT EXIST "%AllUProgs%\Utilities" MD "%AllUProgs%\Utilities"

REM ========== DEFAULT USER PROFILE ========== 
ECHO Cleaning up Default User profile
MOVE /Y "%DefUProgs%\Remote Assistance.lnk" "%AllUProgs%\Internet\"

REM ========== MAIN USER PROFILE ========== 
ECHO Cleaning up Main User profile
REM ## Organizing Accessories\System Tools Folder
REM ## Copy Accessories\System Tools folder from Default User Profile to AllUsersProfile
XCOPY /S /C /R /Y "%HomeProgs%\Accessories\System Tools\" "%AllUProgs%\Accessories\"
MOVE /Y "%HomeProgs%\CrystalCPUID\CrystalCPUID*.lnk" "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%HomeProgs%\CrystalDiskMark\CrystalDiskMark*.lnk" "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%HomeProgs%\freshney.org\Xinorbis\Xinorbis3.lnk" "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%HomeProgs%\GPU-Z\GPU-Z*.lnk" "%AllUProgs%\Accessories\System Tools\"
REM ## Organizing Internet Folder
REM ## Copy Internet folder from Default User Profile to AllUsersProfile
XCOPY /S /C /R /Y "%HomeProgs%\Internet" "%AllUProgs%"
MOVE /Y "%HomeProgs%\FileZilla" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\FreePOPs" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Miranda IM" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Opera" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Remote Assistance.lnk" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Internet Explorer*" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Accessories\System Tools\Internet Explorer*" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Accessories\IP-Tools 2.50.lnk" "%AllUProgs%\Internet\"
MOVE /Y "%HomeProgs%\Accessories\SoftPerfect Network Scanner 3.5.lnk" "%AllUProgs%\Internet\"
REM ## Organizing Multimedia Folder
REM ## Copy Multimedia folder from Default User Profile to AllUsersProfile
XCOPY /S /C /R /Y "%HomeProgs%\Multimedia" "%AllUProgs%"
MOVE /Y "%HomeProgs%\IrfanView" "%AllUProgs%\Multimedia\"
MOVE /Y "%HomeProgs%\Windows Movie Maker.lnk" "%AllUProgs%\Multimedia\"
REM ## Organizing Security Folder
REM ## Copy Utilities folder from Default User Profile to AllUsersProfile
XCOPY /S /C /R /Y "%HomeProgs%\Security" "%AllUProgs%"
MOVE /Y "%HomeProgs%\HijackThis\HijackThis*.lnk" "%AllUProgs%\Security\"
MOVE /Y "%HomeProgs%\TrueCrypt\TrueCrypt*.lnk" "%AllUProgs%\Security\"
REM ## Organizing Utilities Folder
REM ## Copy Utilities folder from Default User Profile to AllUsersProfile
XCOPY /S /C /R /Y "%HomeProgs%\Utilities"  "%AllUProgs%"
MOVE /Y "%HomeProgs%\CCleaner\*"  "%AllUProgs%\Utilities\"
MOVE /Y "%HomeProgs%\Utilities\CCleaner\*"  "%AllUProgs%\Utilities\"
MOVE /Y "%HomeProgs%\nCleaner\nCleaner.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%HomeProgs%\Recuva\Recuva.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%HomeProgs%\Revo Uninstaller"  "%AllUProgs%\Utilities\"
MOVE /Y "%HomeProgs%\Regshot\Regshot*.lnk"  "%AllUProgs%\Utilities\"

REM ========== ALL USERS PROFILE ========== 
ECHO Cleaning up All Users profile
REM ## Organizing Accessories Folder
MOVE /Y "%AllUProgs%\Adobe Reader 8.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Desktop\Agent Ransack.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Desktop\Directory Printer.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Desktop\Xplorer2 Lite.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Launchy\Launchy.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Paint .Net\Paint*"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\RocketDock\RocketDock.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Taskbar Shuffle.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\TaskSwitchXP"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\TouchStoneSoftware\UndeletePlus\UndeletePlus.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Utilities\Duplicate File Finder.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Utilities\Free Undelete.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\Visual Task Tips\Visual Task Tips.lnk"  "%AllUProgs%\Accessories\"
MOVE /Y "%AllUProgs%\XPize"  "%AllUProgs%\Utilities\"
REM ## Organizing Games Folder
MOVE /Y "%AllUProgs%\Arcade! Classic Arcade Pack"  "%AllUProgs%\Games\"
MOVE /Y "%AllUProgs%\Vista Games"  "%AllUProgs%\Games\"
REM ## Organizing Internet Folder
MOVE /Y "%AllUProgs%\Accessories\IP-Tools 2.50.lnk"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Accessories\Remote Desktop Connection.lnk" "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Mozilla Firefox"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Mozilla Thunderbird\*.*"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Network\*.*"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Network Traffic Monitor"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Network Utilities\The Dude.lnk"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\Opera.lnk"  "%AllUProgs%\Internet\"
MOVE /Y "%AllUProgs%\PuTTY"  "%AllUProgs%\Internet\"
REM ## Organizing Multimedia Folder
MOVE /Y "%AllUProgs%\Accessories\Entertainment\*"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\CD-DVD\*.lnk"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\GIMP\GIMP*"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\Graphics\*.lnk"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\ID3 renamer\ID3 renamer.lnk"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\ImgBurn\ImgBurn.lnk"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\K-Lite Codec Pack\Media Player Classic.lnk"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\K-Lite Codec Pack"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\QT Lite"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\Real Alternative"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\Windows Media Player*"  "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\Windows Movie Maker.lnk" "%AllUProgs%\Multimedia\"
MOVE /Y "%AllUProgs%\XMPlay\XMPlay 3.4.2.lnk" "%AllUProgs%\Multimedia\"
REM ## Organizing Security Folder
MOVE /Y "%AllUProgs%\KeePass Password Safe\KeePass.lnk"  "%AllUProgs%\Security\"
MOVE /Y "%AllUProgs%\SpywareBlaster\SpywareBlaster.lnk"  "%AllUProgs%\Security\"
REM ## Organizing System Tools Folder
MOVE /Y "%AllUProgs%\HD Tune\HD Tune.lnk"  "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%AllUProgs%\IObit SmartDefrag\IObit SmartDefrag.lnk"  "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%AllUProgs%\PC Wizard 2008"  "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%AllUProgs%\XPSysPad.lnk"  "%AllUProgs%\Accessories\System Tools\"
MOVE /Y "%AllUProgs%\X-Setup Pro.lnk"  "%AllUProgs%\Accessories\System Tools\"
REM ## Organizing Utilities Folder
MOVE /Y "%AllUProgs%\2BrightSparks\SyncBack\SyncBack.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\7-Zip\7-Zip File Manager.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\AI RoboForm"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\AutoHotkey"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\doPDF 5"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\Easy Duplicate Finder\Easy Duplicate Finder.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\Foxit PDF Reader.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\Glary Utilities\Glary Utilities.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\InstallWatch Pro 2.5"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\TeraCopy\TeraCopy.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\Unknown Device Identifier\Unknown Device Identifier.lnk"  "%AllUProgs%\Utilities\"
MOVE /Y "%AllUProgs%\WinRAR"  "%AllUProgs%\Utilities\"

REM ========== Removing Useless Links ==========
ECHO Removing useless links
DEL /f /q "%AllUsersProfile%\Start Menu\Windows Update.lnk"
DEL /f /q "%AllUsersProfile%\Start Menu\Set Program Access and Defaults.lnk"
DEL /f /q "%AllUsersProfile%\Start Menu\Windows Catalog.lnk"

REM ========== Cleaning-up Desktop ==========
ECHO Cleaning up Desktop
DEL /f /q "%AllUsersProfile%\Desktop\*.lnk"
DEL /f /q "%homepath%\Desktop\*.lnk"
DEL /f /q "%userprofile%\desktop\*.lnk"
DEL /f /q "%SystemDrive%\Documents and Settings\Default User\Desktop\*.lnk"

REM ========== Cleaning-up Quicklaunch ========== 
ECHO Cleaning up Quicklaunch
DEL /f /q "%homepath%\Application Data\Microsoft\Internet Explorer\Quick Launch\Windows Sidebar.lnk"
DEL /f /q "%homepath%\Application Data\Microsoft\Internet Explorer\Quick Launch\Media Player Classic.lnk"
DEL /f /q "%homepath%\Application Data\Microsoft\Internet Explorer\Quick Launch\SamSpade.lnk"
DEL /f /q "%homepath%\Application Data\Microsoft\Internet Explorer\Quick Launch\Miranda IM.lnk"
DEL /f /q "%homepath%\Application Data\Microsoft\Internet Explorer\Quick Launch\*Torrent.lnk"

REM ========== Cleaning up empty directories ========== 
ECHO Cleaning up empty directories
RD /S /Q "%DefUProgs%\Accessories\Entertainment"
RD /S /Q "%DefUProgs%\IrfanView"
RD /S /Q "%DefUProgs%\Recuva"
RD /S /Q "%DefUProgs%\Revo Uninstaller"
RD /S /Q "%DefUProgs%\TrueCrypt"

RD /S /Q "%HomeProgs%\Accessories\Entertainment"
RD /S /Q "%HomeProgs%\CCleaner"
RD /S /Q "%HomeProgs%\CrystalDiskMark"
RD /S /Q "%HomeProgs%\CrystalCPUID"
RD /S /Q "%HomeProgs%\freshney.org"
RD /S /Q "%HomeProgs%\GPU-Z"
RD /S /Q "%HomeProgs%\HijackThis"
RD /S /Q "%HomeProgs%\nCleaner"
RD /S /Q "%HomeProgs%\Recuva"
RD /S /Q "%HomeProgs%\Regshot"
RD /S /Q "%HomeProgs%\TrueCrypt"
RD /S /Q "%HomeProgs%\XMPlay"

RD /S /Q "%AllUProgs%\Accessories\Entertainment"
RD /S /Q "%AllUProgs%\2BrightSparks"
RD /S /Q "%AllUProgs%\7-Zip"
RD /S /Q "%AllUProgs%\Network Utilities"
RD /S /Q "%AllUProgs%\Graphics"
RD /S /Q "%AllUProgs%\Glary Utilities"
RD /S /Q "%AllUProgs%\Network"
RD /S /Q "%AllUProgs%\Desktop"
RD /S /Q "%AllUProgs%\GIMP"
RD /S /Q "%AllUProgs%\HD Tune"
RD /S /Q "%AllUProgs%\ID3 renamer"
RD /S /Q "%AllUProgs%\IOBit SmartDefrag"
RD /S /Q "%AllUProgs%\ImgBurn"
RD /S /Q "%AllUProgs%\KeePass Password Safe"
RD /S /Q "%AllUProgs%\Launchy"
RD /S /Q "%AllUProgs%\Mozilla Thunderbird"
RD /S /Q "%AllUProgs%\Paint*"
RD /S /Q "%AllUProgs%\Easy Duplicate Finder"
RD /S /Q "%AllUProgs%\RocketDock"
RD /S /Q "%AllUProgs%\SpywareBlaster"
RD /S /Q "%AllUProgs%\TeraCopy"
RD /S /Q "%AllUProgs%\TouchStoneSoftware"
RD /S /Q "%AllUProgs%\Unknown Device Identifier"
RD /S /Q "%AllUProgs%\Visual Task Tips"

ECHO Done with cleanup.  
ECHO. |TIME /t
GOTO :EOF
