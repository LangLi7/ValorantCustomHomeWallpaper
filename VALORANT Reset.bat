@echo off
setlocal enabledelayedexpansion

set "source_folder=.\mp4"
set "destination_folder=C:\Riot Games\VALORANT\live\ShooterGame\Content\Movies\Menu"

set "file_extension=.mp4"
set "valorant_exe=VALORANT.exe"

set "backup_folder=%source_folder%\BackupWallpaper"
set "source_custom_wallpaper_folder=%source_folder%\YourCustomWallpaper"

set "new_name=HomepageEp6A3_Arcade"

REM Überprüfe, ob im Backup-Verzeichnis eine .mp4-Datei vorhanden ist
if exist "%backup_folder%\*%file_extension%" (
    REM Kopiere alle Dateien im destination_folder, die den Namen "HomepageEp6A3_Arcade" enthalten, ins Backup-Verzeichnis
    xcopy "%backup_folder%\*%new_name%%file_extension%" "%destination_folder%" /H /Y
) else (
    REM Kopiere alle Dateien im destination_folder, die den Namen "HomepageEp6A3_Arcade" enthalten, ins Backup-Verzeichnis
    xcopy "%destination_folder%\*%new_name%%file_extension%" "%backup_folder%" /H /Y
)

REM Start VALORANT
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Riot Games\VALORANT.lnk"
exit