# Define Variables #
GetVer_Folder="AOSP_Source/.repo/manifests"
GetVer_File="default.xml"

# GetVerCMD="cat $GetVer_Folder/$GetVer_File"
GetVerCMD_String="default revision"
NumOfChars="21"

###################################################################################################################

# Define Functions #
function GetVer_Static() {
	cat AOSP_Source/.repo/manifests/default.xml | grep "default revision" | cut -c 21-
}

function GetVer_Dynamic() {
	# 				    Read File	 Find String		  Don't display certain characters / - is required.
#	echo "Downloaded Android Release: " && cat $GetVer_Folder/$GetVer_File | grep $GetVerCMD_String | cut -c $NumOfChars-
	 echo "Downloaded Android Release: " && cat $GetVer_Folder/$GetVer_File | grep "default revision" | cut -c $NumOfChars-
###	  echo "Downloaded Android Release: " && cat $GetVer_Folder/$GetVer_File 

}

function DisplayVars() {
	echo "GetVer_Folder: $GetVer_Folder"
	echo "GetVer_File: $GetVer_File"
#	echo "GetVerCMD: $GetVer_CMD"
	echo "GetVerCMD_String: $GetVerCMD_String"
	echo "NumOfChars: $NumOfChars"
	echo " "
}

function SanityCheck_GetVer_File_Exists() {
	if [ ! -f $GetVer_Folder/$GetVer_File ]; then
		echo "ERROR! File $GetVer_Folder/GetVer_File does NOT exist! Quitting..."
		break
	else
		echo "Found File: $GetVer_Folder/$GetVer_File."
		echo " "
	fi
}

####################################################################################################################

# Main Program #

# DisplayVars
 SanityCheck_GetVer_File_Exists
# GetVer_Static
 GetVer_Dynamic

