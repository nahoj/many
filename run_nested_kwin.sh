#!/usr/bin/env bash

# Point your configs
export KDEHOME=$HOME/.config/many/xdgconfig
export XDG_CONFIG_HOME=$KDEHOME
export XDG_DATA_HOME=$HOME/.local/share/many
export XDG_CACHE_HOME=$HOME/.cache/many

# Choose a single socket name
sock=wayland-1

# Launch everything inside its own DBus session
export XDG_CURRENT_DESKTOP=KDE
# Export GDK_BACKEND *before* starting the session, so it is given to programs
# run by the KDE shortcut handler, such as wofi
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland

dbus-run-session kwin_wayland \
  --no-lockscreen \
  --xwayland \
  --socket $sock \
  & # KWin runs in background relative to main script

KWIN_PID=$!

# Give KWin a moment to start
sleep 1

# Now launch Konsole into that nested compositor
# Konsole needs variables prepended as it's launched from the main script's env

WAYLAND_DISPLAY=$sock konsole &

# Wait for kwin process started by this script
wait $KWIN_PID
