#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Fonts directory path in the script's root
FONTS_DIR="$SCRIPT_DIR/fonts"

# Target directory for fonts
TARGET_FONTS_DIR="$HOME/.local/share/fonts"

# Ensure the target directory exists
mkdir -p "$TARGET_FONTS_DIR"

# Recursively copy all fonts from the fonts directory
if [ -d "$FONTS_DIR" ]; then
    cp -r "$FONTS_DIR"/* "$TARGET_FONTS_DIR"
    echo "Fonts copied to $TARGET_FONTS_DIR."
else
    echo "No fonts directory found."
fi

# Iterate over all items in the script directory
for item in "$SCRIPT_DIR"/.*; do
    # Skip if it's the current or parent directory entries
    if [ "$(basename "$item")" = "." ] || [ "$(basename "$item")" = ".." ]; then
        continue
    fi

    # Skip the .git and .gitignore files
    if [ "$(basename "$item")" = ".git" ] || [ "$(basename "$item")" = ".gitignore" ]; then
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

fc-cache -fv
A
A
B
fc-cache -fv
echo "Symlinking and font copying complete."
