#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Create swappy config directory and file
SWAPPY_CONFIG_DIR="$HOME/.config/swappy"
mkdir -p "$SWAPPY_CONFIG_DIR"

# Create swappy config if it doesn't exist
if [ ! -f "$SWAPPY_CONFIG_DIR/config" ]; then
    cat > "$SWAPPY_CONFIG_DIR/config" << EOF
[Default]
save_dir=$SCREENSHOT_DIR
save_filename_format=screenshot-%Y%m%d-%H%M%S.png
line_size=5
text_size=20
text_font=serif
padding=60
EOF
fi

# Capture area
if [ "$1" = "area" ]; then
    GEOMETRY=$(slurp)
    [ -z "$GEOMETRY" ] && exit 1
    grim -g "$GEOMETRY" - | swappy -f -
else
    grim - | swappy -f -
fi
