#!/bin/bash

USER="$1"

for user in "root" "$USER"; do
    sudo runuser -u "$user" rustup default stable
done
