# Define Config File
CfgFile="config/AOSPMirrorTool.conf"

function SanityCheck_CfgFileExists() {
  if [ ! -f "$CfgFile" ]; then
    echo "ERROR! Config File $CfgFile NOT Found.  Quitting..."
    return
  else 
    ReadConfig
  fi
}

# Run Sanity Check
SanityCheck_CfgFileExists

function ReadCfgFile() {
  while IFS='=' read -r key value; do
    # Skip comments and empty lines
    [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
  
    echo "Variable: $key | Value: $value"
    done < "$CfgFile"
}

# Read Config
ReadCfgFile
