#!/usr/bin/env bash

set -ouex pipefail

systemctl enable sddm.service

# Theme
mkdir -p /usr/share/sddm/themes
git clone https://framagit.org/MarianArlt/sddm-sugar-candy.git /usr/share/sddm/themes
cat <<EOF > /etc/sddm.conf.d/50-theme.conf
[Theme]
Current=sugar-candy
EOF
