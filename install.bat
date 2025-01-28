@echo off
echo Installing godspeed-daemon...

:: Check if running with administrator privileges
NET SESSION >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo This script must be run as Administrator.
    exit /b 1
)

:: Get the directory of the script
set SCRIPT_DIR=%~dp0

:: Define the target installation directory
set TARGET_DIR=%USERPROFILE%\AppData\Local\Programs\godspeed

:: Create the directory if it doesn't exist
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

:: Copy the Windows executable to the target directory
copy "%SCRIPT_DIR%executables\godspeed-daemon-win.exe" "%TARGET_DIR%\godspeed-daemon.exe"

:: Add the target directory to the PATH for this session
setx PATH "%PATH%;%TARGET_DIR%"

:: Verify if the installation was successful
where godspeed-daemon.exe >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Installation complete! You can now run 'godspeed-daemon'.
) ELSE (
    echo Installation failed.
    exit /b 1
)
