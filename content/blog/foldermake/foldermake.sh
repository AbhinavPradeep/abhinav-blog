#!/bin/bash

# Check if a directory is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a directory path."
  exit 1
fi

target_dir="$1"

# Iterate through each file in the directory
for file in "$target_dir"/*; do
  if [ -f "$file" ]; then  # Check if it's a regular file
    filename="${file%.*}"  # Remove file extension
    mkdir -p "$target_dir/$filename"  # Create folder (only if it doesn't exist)
    mv "$file" "$target_dir/$filename"  # Move file into the folder
  fi
done

echo "Files organized into folders!"
