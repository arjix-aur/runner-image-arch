FROM archlinux:base-devel

ENV CI=1

ARG USERNAME=docker
ARG UID=1000

RUN --mount=type=bind,target=/script.sh,source=layers/01_pacman.sh,ro /script.sh
RUN --mount=type=bind,target=/script.sh,source=layers/02_user.sh,ro /script.sh "$USERNAME" "$UID"

USER $USERNAME
WORKDIR /home/$USERNAME

RUN --mount=type=bind,target=/script.sh,source=layers/03_packages.sh,ro /script.sh
RUN --mount=type=bind,target=/script.sh,source=layers/04_config_nodejs.sh,ro /script.sh "$USERNAME"
RUN --mount=type=bind,target=/script.sh,source=layers/05_config_rust.sh,ro /script.sh "$USERNAME"

USER root
WORKDIR /

RUN --mount=type=bind,target=/script.mjs,source=layers/98_makepkg.mjs,ro /script.mjs
RUN --mount=type=bind,target=/script.sh,source=layers/99_pacman.sh,ro /script.sh
