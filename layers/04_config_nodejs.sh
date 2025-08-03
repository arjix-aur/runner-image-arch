#!/bin/bash

USER="$1"

for home in "/root" "$HOME"; do
    echo ". /usr/share/nvm/init-nvm.sh" | sudo tee -a "$home/.bashrc"
done

. /usr/share/nvm/init-nvm.sh
sudo corepack enable

for user in "root" "$USER"; do
    sudo runuser -u "$user" -- bash -i -c 'pnpm setup'
    sudo runuser -u "$user" -- bash -i -c 'pnpm config set --global dangerouslyAllowAllBuilds true'
    sudo runuser -u "$user" -- bash -i -c 'pnpm install -g grunt gulp parcel-bundler typescript newman vercel webpack webpack-cli lerna netlify-cli'
done
