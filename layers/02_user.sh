#!/bin/bash

USERNAME="$1"
UID="$2"

useradd -m -u "$UID" -G wheel -s /bin/bash "$USERNAME"
echo "$USERNAME:password" | chpasswd
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USERNAME"
