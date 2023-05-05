#!/usr/bin/env bash

set -ouex pipefail

systemctl enable sddm.service

# Theme
mkdir -p /usr/share/sddm/themes
git clone https://github.com/MarianArlt/sddm-chili.git /usr/share/sddm/themes/chili
cat <<EOF > /etc/sddm.conf.d/50-theme.conf
[Theme]
Current=chili
EOF
