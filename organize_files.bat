@echo off
rem powershell.exe -ExecutionPolicy Bypass -File organize_files.ps1

rem サブフォルダは処理できません
setlocal enabledelayedexpansion

echo Please input the folder path:
set /p folderPath=

cd /D %folderPath%

for %%F in (*) do (
    set "ext=%%~xF"
    set "extFolder=!ext:~1!"
    if not exist "!extFolder!" (
        mkdir "!extFolder!"
    )
    move "%%F" "!extFolder!" >nul
)