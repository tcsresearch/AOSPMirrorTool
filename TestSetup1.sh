#!/bin/env bash

### Define Folders ###
# AOSP_ConfigDir="config"
# AOSP_FuncDir="functions"

#### AOSPMirrorTool.conf ###
echo "Sourcing Config..."
source ./config/AOSPMirrorTool.conf


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

