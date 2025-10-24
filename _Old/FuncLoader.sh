function LoadFunctions() {
        target_directory="/path/to/your/folder" # Replace with the actual path to your folder

        if [[ -d "$target_directory" ]]; then # Check if the directory exists
            for file in "$target_directory"/*; do
                if [[ -f "$file" ]]; then # Check if the item is a regular file
                    source "$file"
                    # Or using the shorthand: . "$file"
                fi
            done
        else
           echo "Error: Directory '$target_directory' does not exist."
        fi

