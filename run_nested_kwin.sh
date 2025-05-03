#!/usr/bin/env bash
# run-nested-kde.sh

# Point your configs
export KDEHOME=$HOME/.config/many/nestedconfig
export XDG_CONFIG_HOME=$KDEHOME
export XDG_DATA_HOME=$HOME/.local/share/many
export XDG_CACHE_HOME=$HOME/.cache/many

# Choose a single socket name
sock=wayland-1

# Launch everything inside its own DBus session
export XDG_CURRENT_DESKTOP=KDE
dbus-run-session kwin_wayland \
  --socket $sock \
  &

KWIN_PID=$!

# Give KWin a moment to start
sleep 2

# Now launch Konsole into that nested compositor
WAYLAND_DISPLAY=$sock QT_QPA_PLATFORM=wayland konsole &

# Wait for kwin
wait $KWIN_PID
