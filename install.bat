@echo off
echo Installing godspeed-daemon...

:: Check if running with administrator privileges
NET SESSION >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo This script must be run as Administrator.
    exit /b 1
)

:: Set the download URL and target directory
set DOWNLOAD_URL=https://github.com/yaswanthBonumaddi/install/main/executables/godspeed-daemon-win.exe
set TARGET_DIR=%USERPROFILE%\AppData\Local\Programs\godspeed
set FILE_PATH=%TARGET_DIR%\godspeed-daemon.exe

:: Create the target directory if it doesn’t exist
if not exist "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

:: Download the installer (if it's not already downloaded)
echo Downloading godspeed-daemon...
curl -L -o "%FILE_PATH%" %DOWNLOAD_URL%

:: Show loader while waiting for the download to complete
echo Waiting for download to finish...
set /a counter=0
:loader
set /a counter+=1
if %counter% lss 10 (
    echo . 
    timeout /t 1 >nul
    goto loader
)

:: Verify if the download is successful (check if file exists)
if exist "%FILE_PATH%" (
    echo File downloaded successfully!
) else (
    echo Download failed. Exiting script.
    exit /b 1
)

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
