#!/bin/env bash

# Define Config File #
CfgFile="config/AOSPMirrorTool.conf"

function SanityCheck_CfgFile() {
    if [ ! -f "$CfgFile" ]; then
    echo "ERROR! $CfgFile NOT Found. Quiting..."
    return
  else
   # shellcheck source=/dev/null
   source $CfgFile
  fi
}

# Run Sanity Checkr / Source Config #
SanityCheck_CfgFile

function ShowConfig() {
  echo "AOSP Home Directory:  	    $AOSP_HomeDir "
  echo "Config Dir:  		        $ConfigDir    "
  echo "Config File: 		        $ConfigFile   "
  echo "Functions Dir: 		        $FunctionsDir "
}

# Show Config #
ShowConfig

