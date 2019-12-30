# BatchPack
Script for slipstreaming Windows XP into an image that can detect and install on OEM hardware


######## FreeMortal's RunOnceEx BatchPack #########

Info: The RunOnceExe BatchPack is a set of files and folders that serves as a template to handle the RunOnceEx phase win XP installation through to the final restart. Unzip the $OEM$ folder into the root of your XP source folder alongside i386.
Version: v0.9.2 (Jul-22-2008)
MD5: 
Size: 
Author: FreeMortal (msdemich)
Website: http://www.doitrightconsulting.net/forum/viewforum.php?f=15

Details:
Sets RunOnceEx.cmd to run at T-13 phase, which sets all other programs and scripts to run next boot at runOnceEx Phase.
Runs switchless installers at RunOnceEx phase.
If OEMScan is found in the OEM folder on the XP install CD, it will run OEMscan and apply custom OEMBIOS files.
Downloads and imports latest anti-malware registry settings from RogueSpear's site.
Sets additional custom registry tweaks.
Cleans-up and organizes the Start Menu.
Optimizes registry and defrags the hard drive.
Reboots one last time after first complete boot to desktop.
Applies any final registry settings. (Some IE settings only stick when applied here)
Places log file in \Windows\temp\install.log
NOTE: Batch files are numbered in the order they are run, similar to RogueSpear's ScriptPack.
NOTE: Incompatible with RogueSpear's ScriptPack; will automaticly exit if ScriptPack is detected. 

Installation:
Inside the zip file you download is a single folder, $OEM$. Unzip that folder to the root of your XP source folder right beside i386. (NOT INSIDE i386). You can do this at any time before or after using nlite, RVMi, WMP11Slipstreamer, or XPize. However, if you use the BTS DriverPacks with the Finisher set to run at RunOnceEx instead of GuiRunOnce, you should copy over the BatchPack BEFORE integrating the DriverPacks. This is because Driverpacks may modify the $OEM$\CmdLines.txt file. Its better to use the BTS DriverPacks Finisher in RunOnceEx mode instead of the default GuiRunOnce because this allows the BatchPack to defrag the registry and hard drive AFTER the DriverPacks Finisher finishes.

How to Use:
Use RVM, nLite, XPize, and/or WMP11 slipstreamer on your XP source
Make sure OEMPreinstall is set either by nLite or in WINNT.SIF.
Copy the $OEM$ folder from your downloaded zip file to the root of your source alongside i386 before running driverpacks. 
If you want to use any of RogueSpears's Addons or Runtimes that were specificly designed for RunOnceExe, simply copy them into the $OEM$\$1\Install Folder and the BatchPack will detect and run them at the prper time during the RunOnceEx stage.
If you want to use OEMScan, then copy all the necessary files into a folder named "OEM" and place that OEM folder along side the i386 and $OEM$ folders. BatchPack will run OEMScan at T-13 phase.
If you want to customize the registry tweaks, then unzip Regtweaks.7z and edit RegTweaks.reg. This file contains registry settings which are applied at after first login at RunOnceEx --after T13, reboot and OOBE, but before the desktop loads. This means that these tweaks will overwrite nLite tweaks if they are different. (for example, I prefer to do my Command Prompt and Open/save dialog box a little different then nLite does it) Many of the tweaks are commented-out because I don't use them often, but they are still useful. I'll be happy to take suggestions on new tweaks to add.
If you integrate many addons, you'll likely find a messy Start Menu after installation is complete. Use the 960_Cleanup.cmd as a template to move shortcuts around the start menu and clean up unneeded shortcuts/folders.

BatchPack Files Explained:
$OEM$\CmdLines.txt - Runs at the end of t13. Calls RunOnceEx.cmd.
$OEM$\RunOnceEx.cmd - Runs at the end of t13. Runs OEMScan, if included, then sets other installers and batch files (files with names that begin with numbers) to run after reboot at RunOnceEx phase.
$OEM$\$1\Install\7z.exe - Command line extractor. Used by RunOnceEx.cmd and DLReg.cmd
$OEM$\$1\Install\950_DLReg.cmd - Runs at RunOnceEx, after installers and driverpacks. Downloads and imports anti-malware reg settings. Extracts and imports RegTweaks.7z.
$OEM$\$1\Install\960_CleanUp.cmd - Runs during RunOnceEx, after installers and driverpacks. Organizes and cleans-up Start Menu. 
My method for organizing the shortcuts on the Start Menu is as follows:
Accessories - All Microsoft-related programs including PowerToys and SysInternals
CD-DVD (not implemented yet) - ISOs, CD mastering, burning
Games - All Games
Internet - All network-related programs that aren't too technical - IE, OE, Opera, Filezilla, Thunderbird
Multimedia - Programs involving audio or video, codecs, volume control
Security - Anti-malware programs, encryption, password programs, wipers
System Tools (not implemented yet) - Hardware or OS related - diagnostics, drivers, imaging
Utilities - All other programs
$OEM$\$1\Install\970_Defrag.cmd - Runs during RunOnceEx, after installers and driverpacks. Defrags registry with NtRegOp then defrags the hard drive with JkDefrag.
$OEM$\$1\Install\980_1stBoot.cmd - Runs after Destop loads for the first time. Sets computer to reboot one more time to finalize install.
$OEM$\$1\Install\990_2ndBoot.cmd - Runs after Desktop Loads the second time. Imports final reg tweaks, deletes shortcuts Windows recreates.
$OEM$\$1\Install\cWnd.exe - Neat tool from n7Epsilon that hides the command prompt. (so far, it does not trigger false av alarms like cmdow)
$OEM$\$1\Install\ActiveX.7z - RogueSpears anti-malware Reg settings from his ScriptPack
$OEM$\$1\Install\Cookies.7z - RogueSpears anti-malware Reg settings from his ScriptPack
$OEM$\$1\Install\RestrictedDomains.7z - RogueSpears anti-malware Reg settings from his ScriptPack
$OEM$\$1\Install\RegTweaks.7z - Unzipped and imported by DLReg.cmd BEFORE Desktop boots the first time.
$OEM$\$1\Install\FinalTweaks.7z - Unzipped and Impoted by 2ndBoot.cmd AFTER Destop boots for SECOND time.
$OEM$\$1\Install\InsTools.7z Contains files necessary for downloading (wget), defrag (JkDefrag), reg optimization (NTRegOpt), and custom restart (Restart).
Shortcut 1stBoot.lnk - Copied to Startup folder before first boot in order to run 1stBoot.cmd on first complete boot to desktop.
Shortcut 2ndBoot.lnk - Copied to Startup folder after first boot to desktop in order to run 2ndBoot.cmd on second complete boot to desktop.
