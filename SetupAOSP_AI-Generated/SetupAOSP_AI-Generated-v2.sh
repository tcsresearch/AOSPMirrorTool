#!/bin/env bash

###########################################################################################################################################################
# Configurations #                                                                                                                                        #
###########################################################################################################################################################

Udev_Subsystem="usb"
Udev_DeviceVendorID="VendorID"
Udev_Mode="0666" # Chmod permissions?
Udev_Group="adbusers"
Udev_RulesFile="/etc/udev/rules.d/51-android.rules"

Git_UserName="John Doe"
Git_Email="user@email.com"

###########################################################################################################################################################
# Define Functions #                                                                                                                                      #
###########################################################################################################################################################

function SetE_Enable() {
# Enable Exit immediately if a command exits with a non-zero status.
  set -e
}

function SetE_Disable() {
# Disable Exit immediately if a command exits with a non-zero status.
  set +e
}

function Display_StartMsg() {
  echo "Starting AOSP build environment setup on Fedora..."
}

function Pause() {
  read -n 1 -s -r -p "Press any key to continue..."
  echo ""
}

function ShowConfig() {
  echo "Configuration"
  echo "-------------------------------------------------------------------------"
  echo "Udev Settings"
  echo "   Udev Subsystem: $Udev_Subsystem"
  echo "   Udev Device Vendor ID: $Udev_DeviceVendorID"
  echo "   Udev Mod: $Udev_Mode"
  echo "   Udev Group: $Udev_Group"
  echo "   Udev Rules File: $Udev_RulesFile"
  echo " "
  echo "Git Settings"
  echo "   Git Username: $Git_UserName"
  echo "   Git Email: $Git_Email"
  echo " "
}

function UpdateSystemPackages() {
# 1. Update the system
  echo "Updating system packages..."
  sudo dnf update -y
}

function InstallRequiredPackages() {
# 2. Install essential build tools and dependencies
  echo "Installing AOSP build dependencies..."
  sudo dnf install -y git-core gnupg flex bison gperf build-essential zip curl zlib-devel gcc-c++ \
    libstdc++-devel glibc-devel libX11-devel libXrender-devel libXrandr-devel \
    libXi-devel libXt-devel libtool libxml2-devel libxslt-devel \
    perl-Digest-SHA java-1.8.0-openjdk java-1.8.0-openjdk-devel \
    python2 python3 python3-devel ImageMagick libpng-devel xz \
    repo rsync ccache android-tools
}

function ConfigureJavaAlternatives() {
# 3. Configure Java alternatives (if multiple Java versions are present)
  echo "Configuring Java alternatives..."
  sudo alternatives --config java
  sudo alternatives --config javac
}

function SetupPython2ForOlderAOSPVersions() {
# 4. Set up Python 2 for older AOSP versions (if needed)
# AOSP builds might still rely on Python 2 for some scripts.
# Ensure 'python' points to 'python2' if building older AOSP versions.
# For newer AOSP versions, Python 3 is generally preferred.
# Uncomment and adjust if necessary:
  sudo alternatives --set python /usr/bin/python2
}

function ConfigureUdevRules() {
# 5. Configure udev rules for ADB/Fastboot (if not already handled by android-tools)
echo "Configuring udev rules for Android devices..."
# You might need to add specific udev rules for your devices if the default ones are insufficient.
### TODO: Change parameters below to use variables in Configuration section.
# Example:
# echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="<YOUR_DEVICE_VENDOR_ID>", MODE="0666", GROUP="adbusers"' | sudo tee /etc/udev/rules.d/51-android.rules
echo 'SUBSYSTEM=="$Udev_Subsystem", ATTR{idVendor}=="$Udev_VendorDeviceID", MODE="$Udev_Mode", GROUP="$Udev_Group"' | sudo tee $Udev_RulesFile
# sudo usermod -a -G adbusers $USER
# sudo udevadm control --reload-rules
# sudo udevadm trigger
}

function ConfigureGit() {
# 6. Configure git
  echo "Configuring Git..."
  ### TODO: Change parameters below to use variables in Configuration section.
    git config --global user.name "$Git_UserName"
  # git config --global user.name "Your Name"
  # git config --global user.email "you@example.com"
    git config --global user.email "$Git_Email"

}

function Display_SetupCompletMsg() {
  echo "AOSP build environment setup complete. You may need to reboot for some changes to take effect."
  echo "Now you can proceed with downloading the AOSP source code using 'repo init' and 'repo sync'."
}

###########################################################################################################################################################
# Main Program #                                                                                                                                          #
###########################################################################################################################################################

ShowConfig
Pause

SetE_Enable
Display_StartMsg

UpdateSystemPackages
InstallRequiredPackages

ConfigureJavaAlternatives
# SetupPython2ForOlderAOSPVersions

ConfigureUdevRules
ConfigureGit

SetE_Disable
Display_SetupCompleteMsg


