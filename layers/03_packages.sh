#!/bin/bash
# shellcheck disable=SC2164

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git make gcc binutils fakeroot rust

git clone https://github.com/CachyOS/CachyOS-PKGBUILDS pkgbuilds
pushd pkgbuilds
    pushd paru
        makepkg -si --noconfirm
    popd
popd
rm -rf pkgbuilds
paru -Rsn rust --noconfirm

packages=(
    ccache
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
