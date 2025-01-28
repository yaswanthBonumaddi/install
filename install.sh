#!/bin/bash

echo "Installing godspeed-daemon..."

# Check if the script is being run with sudo (root permissions)
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Define the target installation directory
TARGET_DIR="/usr/local/bin"

# Copy the Linux/macOS executable to the target directory
if [[ "$(uname)" == "Darwin" ]]; then
    cp ./executables/godspeed-daemon-macos $TARGET_DIR/godspeed-daemon
elif [[ "$(uname)" == "Linux" ]]; then
    cp ./executables/godspeed-daemon-linux $TARGET_DIR/godspeed-daemon
else
    echo "Unsupported OS"
    exit 1
fi

# Make the executable file executable
chmod +x $TARGET_DIR/godspeed-daemon

# Verify if the installation was successful
if command -v godspeed-daemon &>/dev/null; then
    echo "Installation complete! You can now run 'godspeed-daemon'."
else
    echo "Installation failed."
    exit 1
fi
