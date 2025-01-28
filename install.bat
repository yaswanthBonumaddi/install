@REM @echo off
@REM echo Installing godspeed-daemon...

@REM :: Check if running with administrator privileges
@REM NET SESSION >nul 2>nul
@REM IF %ERRORLEVEL% NEQ 0 (
@REM     echo This script must be run as Administrator. Please right-click and "Run as Administrator".
@REM     exit /b 1
@REM )

@REM :: Get the directory of the script
@REM set SCRIPT_DIR=%~dp0

@REM :: Define the GitHub repository URL for downloading the executable
@REM set REPO_URL=https://raw.githubusercontent.com/yaswanthBonumaddi/install/main

@REM :: Define the target installation directory
@REM set TARGET_DIR=%USERPROFILE%\AppData\Local\Programs\godspeed

@REM :: Create the directory if it doesn't exist
@REM if not exist "%TARGET_DIR%" (
@REM     mkdir "%TARGET_DIR%"
@REM )

@REM :: Download the Windows executable using curl
@REM echo Downloading the godspeed-daemon executable...
@REM curl -L -o "%TARGET_DIR%\godspeed-daemon.exe" "%REPO_URL%\executables\godspeed-daemon-win.exe"

@REM :: Check if the download was successful
@REM if not exist "%TARGET_DIR%\godspeed-daemon.exe" (
@REM     echo Failed to download the executable. Please check the URL or your internet connection.
@REM     exit /b 1
@REM )

@REM :: Add the target directory to the PATH for future sessions
@REM setx PATH "%PATH%;%TARGET_DIR%"

@REM :: Verify if the installation was successful
@REM where godspeed-daemon.exe >nul 2>nul
@REM IF %ERRORLEVEL% EQU 0 (
@REM     echo Installation complete! You can now run 'godspeed-daemon'.
@REM ) ELSE (
@REM     echo Installation failed. Please ensure that %TARGET_DIR% is in your PATH.
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

:: Download the installer (if it’s not already downloaded)
echo Downloading godspeed-daemon...
curl -L -o %USERPROFILE%\AppData\Local\Programs\godspeed\godspeed-daemon.exe https://github.com/yaswanthBonumaddi/install/main/\executables\godspeed-daemon-win.exe

:: Wait for the download to complete
echo Waiting for download to finish...
timeout /t 20 /nobreak

:: Verify if the download is successful (file size or exist check)
if exist "%USERPROFILE%\AppData\Local\Programs\godspeed\godspeed-daemon.exe" (
    echo File downloaded successfully!
) else (
    echo Download failed. Exiting script.
    exit /b 1
)

:: Add the target directory to the PATH for this session
setx PATH "%PATH%;C:\Users\%USERNAME%\AppData\Local\Programs\godspeed"

:: Verify if the installation was successful
where godspeed-daemon.exe >nul 2>nul
IF %ERRORLEVEL% EQU 0 (
    echo Installation complete! You can now run 'godspeed-daemon'.
) ELSE (
    echo Installation failed.
    exit /b 1
)
