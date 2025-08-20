#!/bin/bash

sudo pacman -Sy --noconfirm
sudo pacman -Su --noconfirm paru

packages=(
    docker
    docker-buildx
    devtools
    fakechroot
    fakeroot
    pacman-contrib
    openssh
    git
    git-lfs
    wget
    curl
    nodejs
    nvm
    github-cli
    tea
    jq
    yq
    zip
    unzip
    python-pipx
    rustup
)

paru -S --noconfirm "${packages[@]}"

paccache -rk0
