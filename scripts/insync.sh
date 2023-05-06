#!/usr/bin/sh

mkdir /tmp/insync

wget https://cdn.insynchq.com/builds/linux/insync-3.8.5.50499-fc38.x86_64.rpm -o /tmp/insync/insync.rpm
wget https://cdn.insynchq.com/builds/linux/insync-nautilus-3.8.2.50468-1.noarch.rpm -o /tmp/insync/insync-nautilus.rpm

rpm-ostree install \
    /tmp/insync/insync.rpm \
    /tmp/insync/insync-nautilus.rpm
