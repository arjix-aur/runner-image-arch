#!/bin/bash

USER="$1"

for home in "/root" "$HOME"; do
    echo ". /usr/share/nvm/init-nvm.sh" | sudo tee -a "$home/.bashrc"
done
