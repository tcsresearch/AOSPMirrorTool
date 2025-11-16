#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting AOSP build environment setup on Fedora..."

# 1. Update the system
echo "Updating system packages..."
sudo dnf update -y

# 2. Install essential build tools and dependencies
echo "Installing AOSP build dependencies..."
sudo dnf install -y git-core gnupg flex bison gperf build-essential zip curl zlib-devel gcc-c++ \
  libstdc++-devel glibc-devel libX11-devel libXrender-devel libXrandr-devel \
  libXi-devel libXt-devel libtool libxml2-devel libxslt-devel \
  perl-Digest-SHA java-1.8.0-openjdk java-1.8.0-openjdk-devel \
  python2 python3 python3-devel ImageMagick libpng-devel xz \
  repo rsync ccache android-tools

# 3. Configure Java alternatives (if multiple Java versions are present)
echo "Configuring Java alternatives..."
sudo alternatives --config java
sudo alternatives --config javac

# 4. Set up Python 2 for older AOSP versions (if needed)
# AOSP builds might still rely on Python 2 for some scripts.
# Ensure 'python' points to 'python2' if building older AOSP versions.
# For newer AOSP versions, Python 3 is generally preferred.
# Uncomment and adjust if necessary:
# sudo alternatives --set python /usr/bin/python2

# 5. Configure udev rules for ADB/Fastboot (if not already handled by android-tools)
echo "Configuring udev rules for Android devices..."
# You might need to add specific udev rules for your devices if the default ones are insufficient.
# Example:
# echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="<YOUR_DEVICE_VENDOR_ID>", MODE="0666", GROUP="adbusers"' | sudo tee /etc/udev/rules.d/51-android.rules
# sudo usermod -a -G adbusers $USER
# sudo udevadm control --reload-rules
# sudo udevadm trigger

# 6. Configure git
echo "Configuring Git..."
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

echo "AOSP build environment setup complete. You may need to reboot for some changes to take effect."
echo "Now you can proceed with downloading the AOSP source code using 'repo init' and 'repo sync'."
