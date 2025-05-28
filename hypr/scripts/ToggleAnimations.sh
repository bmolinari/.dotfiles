#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/configs/LookAndFeel.conf"
START_LINE=$(grep -n "animations {" "$CONFIG_FILE" | cut -d: -f1)
END_LINE=$(awk "NR>$START_LINE && /}/ {print NR; exit}" "$CONFIG_FILE")

# Extract the enabled line within the animations block
ANIMATIONS_LINE=$(awk "NR>$START_LINE && NR<$END_LINE && /enabled\s*=/ {print; exit}" "$CONFIG_FILE")

# Extract current value (true/false)
CURRENT_VALUE=$(echo "$ANIMATIONS_LINE" | awk -F '=' '{print $2}' | xargs)

# Toggle the value
if [[ "$CURRENT_VALUE" == "true" ]]; then
	NEW_VALUE="false"
else
	NEW_VALUE="true"
fi

# Update the file
sed -i "/animations {/,/}/ s/enabled\s*=\s*$CURRENT_VALUE/enabled = $NEW_VALUE/" "$CONFIG_FILE"

# Reload Hyprland config
hyprctl reload

echo "Animations toggled to $NEW_VALUE"
