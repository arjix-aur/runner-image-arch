FROM archlinux:base-devel

RUN pacman-key --init \
    && pacman -Syu --noconfirm \
        sudo-rs \
        devtools \
        openssh \
        git \
    && pacman -Scc --noconfirm \
    && rm -rf /etc/pacman.d/gnupg
