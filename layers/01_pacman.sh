#!/bin/bash

pacman-key --init
pacman-key --populate

pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

{
    echo "[chaotic-aur]"
    echo "Include = /etc/pacman.d/chaotic-mirrorlist"
} >> /etc/pacman.conf
