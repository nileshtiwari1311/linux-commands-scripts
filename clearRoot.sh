# !/bin/bash
apt autoremove --purge
apt autoclean
du -sh /var/cache/apt
apt clean
du -sh /var/cache/apt
journalctl --vacuum-time=3d
du -h /var/lib/snapd/snaps
~/Documents/Scripts/deleteOldSnaps.sh
du -h /var/lib/snapd/snaps
du -sh ~/.cache/thumbnails
rm -rf ~/.cache/thumbnails/*
du -sh ~/.cache/thumbnails