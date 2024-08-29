#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Iterate over all items in the script directory
for item in "$SCRIPT_DIR"/.*; do
    # Skip if it's the current or parent directory entries
    if [ "$(basename "$item")" = "." ] || [ "$(basename "$item")" = ".." ]; then
        continue
    fi

    # Extract the name and target path
    name=$(basename "$item")
    target="$HOME/$name"

    # Check if the item already exists
    if [ -e "$target" ]; then
        echo "Warning: $target already exists. Skipping."
    else
        # Create symlink
        ln -s "$item" "$target"
        if [ -d "$item" ]; then
            echo "Created symlink: $target -> $item (directory)"
        else
            echo "Created symlink: $target -> $item (file)"
        fi
    fi
done

echo "Symlinking complete."

