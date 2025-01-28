
# godspeed-daemon Installation Guide

## Introduction

godspeed-daemon is a cross-platform daemon that can be installed and run on Windows, macOS, and Linux. This guide will walk you through the installation process for each operating system.

## Prerequisites

Before proceeding with the installation, ensure you have the following:
	•	Administrator/root privileges (required for installation)
	•	Windows: A Windows 7 or later version.
	•	macOS: macOS 10.14 (Mojave) or later.
	•	Linux: Any Linux-based system (Ubuntu, Debian, CentOS, etc.).

## Installation

### 1. Windows Installation

1.	Download the Installation Package:
Download the installation files for Windows from the releases page.

2.	Run the Install Script:

	•	Open the folder where you downloaded the installation package.

	•	Right-click on install.bat and select “Run as Administrator”.

	•	The script will copy godspeed-daemon.exe to C:\Users\%USERNAME%\AppData\Local\Programs\godspeed, and it will add the path to your environment variables.

3.	If godspeed-daemon is not recognized:
If after installation you get the error that godspeed-daemon is an unknown command, you can manually add the installation directory to your system’s user environment variable for PATH by following these steps:
	•	Open Command Prompt and type: echo %USERPROFILE%

This will return the path to your user profile (e.g., C:\Users\YourUsername).

#### Open the Environment Variables window:
1.	Press Win + R, type sysdm.cpl, and press Enter.
2.	Go to the Advanced tab and click on Environment Variables.
3.	Under User variables, select Path and click Edit.
4.	In the edit window, click New and add:

        C:\Users\%USERNAME%\AppData\Local\Programs\godspeed


5.	Click OK to save.

	Restart the Command Prompt and try running:

        godspeed-daemon


### 4.	Verify the Installation:
Open a new Command Prompt window and type:

godspeed-daemon

You should see the godspeed-daemon daemon running.

### 2. macOS Installation

1.	Download the Installation Package:
Download the macOS installation package from the releases page.

2.	Run the Install Script:
	•	Open the terminal.
	•	Navigate to the folder where you downloaded the install.sh file.

cd ~/Downloads/godspeed-daemon


####	Run the script:

       chmod +x install.sh
	   sudo ./install.sh

You will be prompted to enter your password. The script will copy the godspeed-daemon binary to /usr/local/bin.

####	3.	Verify the Installation:
Open a new terminal window and type:

godspeed-daemon

You should see the godspeed-daemon daemon running.

## 3. Linux Installation

1.	Download the Installation Package:
Download the Linux installation package from the releases page.

2.	Run the Install Script:
	•	Open the terminal.
	•	Navigate to the folder where you downloaded the install.sh file.

cd ~/Downloads/godspeed-daemon


•	Run the script:

        chmod +x install.sh
		sudo ./install.sh


You will be prompted to enter your password. The script will copy the godspeed-daemon binary to /usr/local/bin.


###	3.	Verify the Installation:
Open a new terminal window and type:

godspeed-daemon

You should see the godspeed-daemon daemon running.


### Troubleshooting

1.	Command Not Found on Windows:
If the command godspeed-daemon is not recognized after installation, ensure the executable is added to the system PATH. You can check this by typing:

        echo %PATH%

If the installation directory is not included, follow the steps in the “If godspeed-daemon is not recognized” section above to add the path manually.

2.	Permission Issues:
On macOS and Linux, ensure you have the correct permissions to run the scripts. If necessary, re-run the scripts with sudo.

