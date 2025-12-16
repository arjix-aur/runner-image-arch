#!/bin/bash
# shellcheck disable=SC2164

sudo pacman -Syu --noconfirm
sudo pacman -S git make gcc binutils fakeroot

git clone https://github.com/CachyOS/CachyOS-PKGBUILDS pkgbuilds
pushd pkgbuilds
    makepkg -si --noconfirm
popd
rm -rf pkgbuilds

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
