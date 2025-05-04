#!/usr/bin/env zsh

local selected=$(<"${XDG_CONFIG_HOME:-$HOME/.config}/many/launcher_apps" grep -v '^#' | \
                     wofi --show dmenu)
local name=${selected##*:}

case $name in
    "AI")
        falkon 'https://claude.ai/new'
        ;;
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
        falkon
        ;;
    *)
        echo "Unknown app: '$name'"
        ;;
esac
