#!/bin/bash

# Check for provided directory argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a directory path."
  exit 1
fi

target_dir="$1"

# Find all directories, then create "images" subdirectories if they don't exist
find "$target_dir" -type d -print0 | while IFS= read -r -d '' dir; do
  if [ ! -d "$dir/images" ]; then
    mkdir "$dir/images"
    echo "Created 'images' folder in $dir"
  fi
done
