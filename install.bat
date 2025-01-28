@REM @REM @echo off
@REM @REM echo Installing godspeed-daemon...

@REM @REM :: Check if running with administrator privileges
@REM @REM NET SESSION >nul 2>nul
@REM @REM IF %ERRORLEVEL% NEQ 0 (
@REM @REM     echo This script must be run as Administrator. Please right-click and "Run as Administrator".
@REM @REM     exit /b 1
@REM @REM )

@REM @REM :: Get the directory of the script
@REM @REM set SCRIPT_DIR=%~dp0

@REM @REM :: Define the GitHub repository URL for downloading the executable
@REM @REM set REPO_URL=https://raw.githubusercontent.com/yaswanthBonumaddi/install/main

@REM @REM :: Define the target installation directory
@REM @REM set TARGET_DIR=%USERPROFILE%\AppData\Local\Programs\godspeed

@REM @REM :: Create the directory if it doesn't exist
@REM @REM if not exist "%TARGET_DIR%" (
@REM @REM     mkdir "%TARGET_DIR%"
@REM @REM )

@REM @REM :: Download the Windows executable using curl
@REM @REM echo Downloading the godspeed-daemon executable...
@REM @REM curl -L -o "%TARGET_DIR%\godspeed-daemon.exe" "%REPO_URL%\executables\godspeed-daemon-win.exe"

@REM @REM :: Check if the download was successful
@REM @REM if not exist "%TARGET_DIR%\godspeed-daemon.exe" (
@REM @REM     echo Failed to download the executable. Please check the URL or your internet connection.
@REM @REM     exit /b 1
@REM @REM )

@REM @REM :: Add the target directory to the PATH for future sessions
@REM @REM setx PATH "%PATH%;%TARGET_DIR%"

@REM @REM :: Verify if the installation was successful
@REM @REM where godspeed-daemon.exe >nul 2>nul
@REM @REM IF %ERRORLEVEL% EQU 0 (
@REM @REM     echo Installation complete! You can now run 'godspeed-daemon'.
@REM @REM ) ELSE (
@REM @REM     echo Installation failed. Please ensure that %TARGET_DIR% is in your PATH.
@REM @REM     exit /b 1
@REM @REM )


@REM @echo off
@REM echo Installing godspeed-daemon...

@REM :: Check if running with administrator privileges
@REM NET SESSION >nul 2>nul
@REM IF %ERRORLEVEL% NEQ 0 (
@REM     echo This script must be run as Administrator.
@REM     exit /b 1
@REM )

@REM :: Download the installer (if it’s not already downloaded)
@REM echo Downloading godspeed-daemon...
@REM curl -L -o %USERPROFILE%\AppData\Local\Programs\godspeed\godspeed-daemon.exe https://github.com/yaswanthBonumaddi/install/main/\executables\godspeed-daemon-win.exe

@REM :: Wait for the download to complete
@REM echo Waiting for download to finish...
@REM timeout /t 20 /nobreak

@REM :: Verify if the download is successful (file size or exist check)
@REM if exist "%USERPROFILE%\AppData\Local\Programs\godspeed\godspeed-daemon.exe" (
@REM     echo File downloaded successfully!
@REM ) else (
@REM     echo Download failed. Exiting script.
@REM     exit /b 1
@REM )

@REM :: Add the target directory to the PATH for this session
@REM setx PATH "%PATH%;C:\Users\%USERNAME%\AppData\Local\Programs\godspeed"

@REM :: Verify if the installation was successful
@REM where godspeed-daemon.exe >nul 2>nul
@REM IF %ERRORLEVEL% EQU 0 (
@REM     echo Installation complete! You can now run 'godspeed-daemon'.
@REM ) ELSE (
@REM     echo Installation failed.
@REM     exit /b 1
@REM )


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

:: Wait until the download is complete by checking the file size (you can adjust the 1-second interval as needed)
set /a "counter=0"
:wait_for_download
set /a "counter+=1"
for %%F in ("%FILE_PATH%") do set size=%%~zF
if %size% lss 50000000 (
    echo Downloading... Please wait. Size: %size% bytes
    timeout /t 1 >nul
    goto wait_for_download
)

:: Show confirmation once the download is complete
echo Download completed successfully! File size: %size% bytes

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
