#!/bin/env bash

# Define Folders #
# AOSP_ConfigDir="config"
# AOSP_FuncDir="functions"

# ReadConfigINI.bconf
#### config.ini ###
echo "Sourcing config.ini"
source ./config/config.ini


### functions ###
echo "Sourcing Functions..."
source ./functions/InstallRepo.bfunc
source ./functions/ImportKeyFile.bfunc
# DISABLED: Doesn't work.
# source ./functions/DetectOS/DetectOS.bfunc
source ./functions/AOSP_Repo.bfunc
echo "DONE!"


################################################################

### Run Functions ###

ImportKeyFile
# DetectOS

