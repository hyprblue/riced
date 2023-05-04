#!/usr/bin/sh

sed -i 's|^Exec=.*|Exec=/usr/bin/start-hyprland|' /usr/share/wayland-sessions/hyprland.desktop
