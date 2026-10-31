#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/configs/look_and_feel.lua"

# Extract current value (true/false) from the `animations = { enabled = ... }` block
CURRENT_VALUE=$(sed -n '/animations = {/,/}/ s/.*enabled\s*=\s*\(true\|false\).*/\1/p' "$CONFIG_FILE")

# Toggle the value
if [[ "$CURRENT_VALUE" == "true" ]]; then
	NEW_VALUE="false"
else
	NEW_VALUE="true"
fi

# Update the file
sed -i "/animations = {/,/}/ s/enabled\s*=\s*$CURRENT_VALUE/enabled = $NEW_VALUE/" "$CONFIG_FILE"

# Reload Hyprland config
hyprctl reload

echo "Animations toggled to $NEW_VALUE"
