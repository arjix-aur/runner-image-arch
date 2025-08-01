FROM archlinux:base-devel

RUN pacman-key --init \
    && pacman -Syu --noconfirm \
        sudo-rs \
        devtools \
        openssh \
        git
