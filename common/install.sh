common_folder="$MODPATH/common"
system_folder="$LIBDIR"
module_folder="$MODPATH/system"

# Loop through files in the common folder (including subfolders)
find "$common_folder" -type f | while read -r file; do
    # Get the relative path of the file
    relative_path="${file#$common_folder/}"
    
    # Check if the file is present in the system folder
    if [[ -f "$system_folder/$relative_path" ]]; then
        echo "File $relative_path already exists in the system folder. Skipping..."
    else
        # Copy the file to the module folder
        cp "$file" "$module_folder/$relative_path"
        echo "File $relative_path copied to the module folder."
    fi
done
