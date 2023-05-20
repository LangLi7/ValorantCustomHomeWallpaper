@echo off
setlocal enabledelayedexpansion

set "source_folder=.\mp4"
set "destination_folder=C:\Riot Games\VALORANT\live\ShooterGame\Content\Movies\Menu"

set "file_extension=.mp4"
set "valorant_exe=VALORANT.exe"

set "backup_folder=%source_folder%\BackupWallpaper"
set "source_custom_wallpaper_folder=%source_folder%\YourCustomWallpaper"

set "new_name=HomepageEp6A3_Arcade"
set "not_file_random_name=sung-jin-woo-beru-solo-leveling"
set "random=False"

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

REM Warte auf das Starten von VALORANT
:CheckValorant
timeout /t 1 >nul
tasklist /fi "imagename eq !valorant_exe!" 2>nul | find /i "!valorant_exe!" >nul
if errorlevel 1 goto :CheckValorant


REM Zufällig eine Datei im source_custom_wallpaper_folder auswählen und kopieren
set /a count=0
for /r "%source_custom_wallpaper_folder%" %%f in (*%file_extension%) do (
    set /a count+=1
    set "file[!count!]=%%f"
)

if %count% EQU 0 (
    exit /b
)

set /a random_number=%random% %% %count% + 1
set "random_file=!file[%random_number%]!"


REM Überprüfe, Random ist
if "%random%" == "True" (
    REM Kopiere die zufällig ausgewählte Datei ins destination_folder
    xcopy "%random_file%" "%destination_folder%\%new_name%%file_extension%" /H /Y
) else (
    REM Kopiere die umbenannte Datei aus dem source_custom_wallpaper_folder ins destination_folder
    xcopy "%source_custom_wallpaper_folder%\%not_file_random_name%%file_extension%" "%destination_folder%\%new_name%%file_extension%" /H /Y
)

REM Schließe den Batch-Code
exit
