#!/bin/env bash
# SetupAOSP_AI-Generated-v4.sh - SplitConfig Enabled (WIP)

# shellcheck source=/dev/null

## TODO: Declare SplitConfig Variables/Files
#         Add Sanity Checkers
#         Enable Cecho         

###########################################################################################################################################################
# Main Program #                                                                                                                                          #
###########################################################################################################################################################

ShowConfig
Pause

SetE_Enable
Display_StartMsg

UpdateSystemPackages
Pause 

InstallRequiredPackages
Pause

ConfigureJavaAlternatives
# SetupPython2ForOlderAOSPVersions
Pause

ConfigureUdevRules
Pause

ConfigureGit

SetE_Disable
Display_SetupCompleteMsg
