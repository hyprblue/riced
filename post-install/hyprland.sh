#!/usr/bin/sh

# Change target of hyprland.desktop to use custom script
sed -i 's|^Exec=.*|Exec=/usr/bin/start-hyprland|' /usr/share/wayland-sessions/hyprland.desktop

# Append custom Hyprland configuration to the default config
cat <<EOT >> /usr/share/hyprland/hyprland.conf
source = /usr/share/hyprland/conf.d/50-rules-browser.conf
source = /usr/share/hyprland/conf.d/50-rules-pavucontrol.conf
source = /usr/share/hyprland/conf.d/50-rules-policykit-agent.conf
source = /usr/share/hyprland/conf.d/60-bindings-brightness.conf
source = /usr/share/hyprland/conf.d/60-bindings-media.conf
source = /usr/share/hyprland/conf.d/60-bindings-screenshot.conf
source = /usr/share/hyprland/conf.d/60-bindings-volume.conf
source = /usr/share/hyprland/conf.d/65-submap-passthrough.conf
source = /usr/share/hyprland/conf.d/90-bar.conf
source = /usr/share/hyprland/conf.d/90-swayidle.conf
source = /usr/share/hyprland/conf.d/95-autostart-policykit-agent.conf
source = /usr/share/hyprland/conf.d/95-xdg-desktop-autostart.conf
source = /usr/share/hyprland/conf.d/95-xdg-user-dirs.conf
EOT
