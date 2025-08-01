FROM archlinux:base-devel

RUN pacman-key --init \
    && pacman -Syu --noconfirm \
        docker \
        sudo-rs \
        devtools \
        fakechroot \
        fakeroot \
        pacman-contrib \
        openssh \
        git \
        wget \
    && paccache -rk0 \
    && rm -rf /etc/pacman.d/gnupg
