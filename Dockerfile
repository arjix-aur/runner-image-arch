FROM archlinux:base-devel

RUN pacman-key --init \
    && pacman -Syu --noconfirm \
        sudo-rs \
        devtools \
        pacman-contrib \
        openssh \
        git \
    && pacman -Qtdq | pacman -Rns --noconfirm - \
    && paccache -rk0 \
    && rm -rf /etc/pacman.d/gnupg
