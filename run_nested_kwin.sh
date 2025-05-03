#!/usr/bin/env bash
# run-nested-kde.sh

# 1) Prepare isolated runtime
# export XDG_RUNTIME_DIR=$HOME/.cache/many/runtime
# rm -rf   "$XDG_RUNTIME_DIR"
# mkdir -p "$XDG_RUNTIME_DIR"
# chmod 700 "$XDG_RUNTIME_DIR"

# 2) Point your configs
export KDEHOME=$HOME/.config/many/nestedconfig
# export XDG_CONFIG_HOME=$KDEHOME
# export XDG_DATA_HOME=$HOME/.local/share/many
# export XDG_CACHE_HOME=$HOME/.cache/many

# 3) Choose a single socket name
sock=wayland-1

# 4) Launch everything inside its own DBus session
kwin_wayland \
  --socket $sock \
  --wayland-display $WAYLAND_DISPLAY &

KWIN_PID=$!
sleep 0.5

# 5) Now launch Konsole into that nested compositor
#export QT_QPA_PLATFORM=wayland
export WAYLAND_DISPLAY=$sock
konsole

# 6) Wait for kwin
wait $KWIN_PID

