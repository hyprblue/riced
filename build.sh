#!/bin/bash
# run scripts
echo "-- Running scripts defined in recipe.yml --"
buildscripts=$(yq '.scripts[]' < /usr/etc/ublue-recipe.yml)
for script in $(echo -e "$buildscripts"); do \
    echo "Running: ${script}" && \
    /tmp/scripts/$script; \
done
echo "---"

echo "-- Removing RPMs defined in recipe.yml --"
remove_packages=$(yq '.remove[]' < /usr/etc/ublue-recipe.yml)
for pkg in $(echo -e "$remove_packages"); do \
    echo "Removing: ${pkg}" && \
    rpm-ostree override remove $pkg; \
done
echo "---"

repos=$(yq '.extrarepos[]' < /usr/etc/ublue-recipe.yml)
if [[ -n "$repos" ]]; then
    echo "-- Adding repos defined in recipe.yml --"
    for repo in $(echo -e "$repos"); do \
        wget $repo -P /etc/yum.repos.d/; \
    done
    echo "---"
fi

echo "-- Installing RPMs defined in recipe.yml --"
rpm_packages=$(yq '.rpms[]' < /usr/etc/ublue-recipe.yml)
for pkg in $(echo -e "$rpm_packages"); do \
    echo "Installing: ${pkg}" && \
    rpm-ostree install $pkg; \
done
echo "---"

# run post-install scripts
echo "-- Running post-install scripts defined in recipe.yml --"
buildscripts=$(yq '.post-install[]' < /usr/etc/ublue-recipe.yml)
for script in $(echo -e "$buildscripts"); do \
    echo "Running: ${script}" && \
    /tmp/post-install/$script; \
done
