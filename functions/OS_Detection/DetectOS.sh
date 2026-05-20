#!/usr/bin/env bash

function SanityChecker_FuncFileExists() {
    OSD_FuncFile="DetectOS.bfunc"
    if [ -f "$OSD_FuncFile" ]; then
        source "$OSD_FuncFile"
    else
    echo "ERROR!  Functions File $OSD_FuncFile NOT Found. Quitting..."
    return
    fi
}

# Run Sanity Check Function / Source Functions File #
SanityChecker_FuncFileExists

# Determine OS #
case $(get_distro) in
    raspbian) 
        echo "This is Raspbian" 
        ;;
    fedora) 
        echo "This is Fedora" 
        ;;
    ubuntu) 
        echo "This is Ubuntu" 
        ;;
    Darwin) 
        echo "This is macOS" 
        ;;
    *)
        echo "Unknown distribution"
        ;;
esac
