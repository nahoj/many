#!/usr/bin/env zsh

set -euo pipefail

{
    cd ~/.local/opt/ClipCascade
    .venv/bin/python main.py &
}

if command -v swaybg >/dev/null; then
    swaybg -i "/home/jg/perso/divers_images/wallpapers/zen sand.jpg" -m fill &
fi

konsole
