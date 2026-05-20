#!/usr/bin/env bash

# Last Updated: Tue May 19 2026

## Specify Folders for config and functions ##

BaseDir="/home/aosp"
ConfigDir="/home/aosp/config"
ConfigFile="config.ini"
FunctionsDir="/home/aosp/functions"

## Source Config and Load Functions ##

function LoadConfig() {
	if [ -f "$ConfigDir/$ConfigFile" ]; then
		echo "Sourcing Config File..."
		# shellcheck source=/dev/null
		source "ConfigDir/$ConfigFile"
		echo "Config File Sourced Successfully."
	fi
}

function LoadFunctions() {
	# target_directory="/path/to/your/folder" # Replace with the actual path to your folder
	echo "Sourcing Functions: "
	if [[ -d "$FunctionsDir" ]]; then # Check if the directory exists
    	    for funcfile in "$FunctionsDir"/*.bfunc; do
    	        if [[ -f "$funcfile" ]]; then # Check if the item is a regular file
        	    # shellcheck source=/dev/null
		    echo "$funcfile"
		    # shellcheck source=/dev/null
		    source "$funcfile"
            	    # Or using the shorthand: . "$funcfile"
                fi
    	    done
	    echo "All Functions Loaded Successfully."
        else
    	   echo "Error: Directory '$FunctionsDir' does not exist."
        fi
}

######################################################################################################################################

## Show Directories ##
echo "BaseDir: $BaseDir"
echo "ConfigDir: $ConfigDir"
echo "ConfigFile: $ConfigFile"
echo "FunctionsDir: $FunctionsDir"
echo " "

## Main Program ##

LoadConfig
LoadFunctions

