## Specify Folders for config and functions ##
ConfigDir="./config"
ConfigFile="config.ini"
FunctionsDir="./functions"

## Source Config and Load Functions ##

function LoadConfig() {
	if [ -f "$ConfigDir/$ConfigFile" ]; then
		echo "Sourcing Config File..."
		source $ConfigDir/$ConfigFile
		echo "Config File Sourced Successfully."
	fi
}

function LoadFunctions() {
	# target_directory="/path/to/your/folder" # Replace with the actual path to your folder
	echo "Sourcing Functions: "
	if [[ -d "$FunctionsDir" ]]; then # Check if the directory exists
    	    for funcfile in "$FunctionsDir"/*.bfunc; do
    	        if [[ -f "$funcfile" ]]; then # Check if the item is a regular file
        	    echo "$funcfile"
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

## Main Program ##

LoadConfig
LoadFunctions

