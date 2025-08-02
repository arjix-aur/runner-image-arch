FROM archlinux:base-devel


# Layer 1: Configure chaotic AUR repository
RUN <<EOF
#!/usr/bin/env bash

pacman-key --init
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB

pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

{
    echo "[chaotic-aur]"
    echo "Include = /etc/pacman.d/chaotic-mirrorlist"
} >> /etc/pacman.conf
EOF

# Layer 2: Install base packages
RUN <<EOF
#!/usr/bin/env bash

packages=(
    paru
    docker
    sudo-rs
    devtools
    fakechroot
    fakeroot
    pacman-contrib
    openssh
    git
    wget
    curl
)

pacman -Syu --noconfirm
pacman -S --noconfirm "${packages[@]}"

paccache -rk0
EOF
