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
# Colors #	                                                                                                                                          #
###########################################################################################################################################################

# Define Our Colors
# NEW Sep 14, 2026: Added orange color.

  black=$(tput setaf 0)
  red=$(tput setaf 1)
  orange=$(tput setaf 166)
  green=$(tput setaf 2)
  yellowbrown=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
  whitelightgray=$(tput setaf 7)
  whitelightgrey=$(tput setaf 7)
  brightblack_darkgray=$(tput setaf 8)
  brightblack_darkgrey=$(tput setaf 8)
  brightred=$(tput setaf 9)
  brightgreen=$(tput setaf 10)
  brightyellow=$(tput setaf 11)
  brightblue=$(tput setaf 12)
  brightmagenta=$(tput setaf 13)
  brightcyan=$(tput setaf 14)
  brightwhite=$(tput setaf 15)
  reset=$(tput sgr0) # Reset to default

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
  echo " "
  echo "${green} Configuration ${reset}"
  echo "${green} ------------------------------------------------------------------------- ${reset}"
  echo "${brightred} Udev Settings ${reset}"
  echo "   ${brightblue} Udev Subsystem: ${brightwhite} $Udev_Subsystem ${reset}"
  echo "   ${brightblue} Udev Device Vendor ID: ${brightwhite} $Udev_DeviceVendorID ${reset}"
  echo "   ${brightblue} Udev Mod: ${brightwhite} $Udev_Mode ${reset}"
  echo "   ${brightblue} Udev Group: ${brightwhite} $Udev_Group ${reset}"
  echo "   ${brightblue} Udev Rules File: ${brightwhite} $Udev_RulesFile ${reset}"
  echo " "
  echo "${brightred} Git Settings ${reset}"
  echo "   ${brightblue} Git Username: ${brightwhite} $Git_UserName ${reset}"
  echo "   ${brightblue} Git Email: ${brightwhite} $Git_Email ${reset}"
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


