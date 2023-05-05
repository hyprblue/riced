#!/usr/bin/env bash

set -ouex pipefail

systemctl enable sddm.service

# Theme
mkdir -p /usr/share/sddm/themes
git clone https://framagit.org/MarianArlt/sddm-sugar-candyu.git /usr/share/sddm/themes
cat <<EOF > /usr/lib/sddm/sddm.conf.d/sddm.conf
[Theme]
Current=sugar-candy
EOF
