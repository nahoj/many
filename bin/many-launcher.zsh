#!/usr/bin/env zsh

local selected=$(<"${XDG_CONFIG_HOME:-$HOME/.config}/many/launcher_apps" grep -v '^#' | \
                     wofi --show dmenu --allow-images --parse-search)
local name=${selected##*:}
echo $name

case $name in
    "Editor")
        kate
        ;;
    "Files")
        dolphin
        ;;
    "Terminal")
        konsole
        ;;
    "Web")
        brave-browser
        ;;
    *)
        echo "Unknown app: '$name'"
        ;;
esac
