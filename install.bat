@echo off
echo Installing godspeed-daemon...

:: Check if running with administrator privileges
NET SESSION >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo This script must be run as Administrator. Please right-click and "Run as Administrator".
    exit /b 1
)

:: Get the directory of the script
set SCRIPT_DIR=%~dp0

:: Define the GitHub repository URL for downloading the executable
set REPO_URL=https://raw.githubusercontent.com/yaswanthBonumaddi/install/main

:: Define the target installation directory
set TARGET_DIR=%USERPROFILE%\AppData\Local\Programs\godspeed

:: Create the directory if it doesn't exist
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

:: Download the Windows executable using curl
echo Downloading the godspeed-daemon executable...
curl -L -o "%TARGET_DIR%\godspeed-daemon.exe" "%REPO_URL%\executables\godspeed-daemon-win.exe"

:: Check if the download was successful
if not exist "%TARGET_DIR%\godspeed-daemon.exe" (
    echo Failed to download the executable. Please check the URL or your internet connection.
    exit /b 1
)

:: Add the target directory to the PATH for future sessions
setx PATH "%PATH%;%TARGET_DIR%"

:: Verify if the installation was successful
where godspeed-daemon.exe >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Installation complete! You can now run 'godspeed-daemon'.
) ELSE (
    echo Installation failed. Please ensure that %TARGET_DIR% is in your PATH.
    exit /b 1
)
