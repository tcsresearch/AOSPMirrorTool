
## Explanation ##
Command | What It Does |
|---|---|
`set -e` | Ensures the script exits if any command fails. 
`sudo dnf update -y` | Updates all installed packages to ensure you have the latest versions.
`sudo dnf install -y ...` | Installs all the necessary packages for building AOSP. This includes:
`git-core` | Version control.
`gnupg` | Gnu Privacy Guard for verifying signatures.
`flex, bison, gperf` | Parser generators.
`build-essential, gcc-c++, libstdc++-devel, glibc-devel` | Core compilation tools and libraries.
`zip, curl, zlib-devel` | Archiving, downloading, and compression libraries.
`libX11-devel, libXrender-devel, libXrandr-devel, libXi-devel, libXt-devel` | X11 development libraries for graphical tools.
`libtool, libxml2-devel, libxslt-devel` | Utility libraries.
`perl-Digest-SHA` | Perl module for SHA hashing.
`java-1.8.0-openjdk, java-1.8.0-openjdk-devel` | Java Development Kit (JDK 8 is typically required for AOSP).
`python2, python3, python3-devel` | Python interpreters and development headers.
`ImageMagick, libpng-devel` | Image manipulation tools.
`xz` | Compression utility.
`repo` | The AOSP tool for managing Git repositories.
`rsync` | File synchronization.
`ccache` | Compiler cache for faster builds.
`android-tools` | Provides adb and fastboot. 
`sudo alternatives --config java / javac` | Allows you to select the correct Java version if multiple are installed.
`Python 2 setup` | Comments on the potential need for Python 2 for older AOSP versions and how to configure it if necessary.
`Udev rules` | Explains how to set up udev rules for proper ADB/Fastboot device recognition, which might be needed in addition to android-tools.
`Git configuration` | Sets your global Git user name and email. 

## Usage ## 

Save the script as a file   (e.g `setup_aosp_fedora.sh`). <br>
Make it executable:         `chmod +x setup_aosp_fedora.sh` <br>
Run the script:             `./setup_aosp_fedora.sh` <br>

## Important Notes ##

    Review and Customize:
    This script provides a general setup. You may need to adjust the installed packages or configurations based on your specific AOSP version and development needs.
    
    Java Version:
    AOSP typically requires a specific Java version (often OpenJDK 8). Ensure the correct version is installed and configured.
    
    Root Privileges:
    The script uses sudo for package installation and system-wide configurations, so you will be prompted for your password.
    
    Reboot:
    A reboot might be necessary after installing certain packages or configuring udev rules.
