FROM debian:9

ENV DISTRO debian

RUN apt-get update && apt-get --yes install \
    check \
    gcc \
    gdb \
    git \
    make \
    man-db \
    pkg-config \
    shellcheck \
    tmux \
    tree \
    valgrind \
    vim \
    xclip

ARG user
RUN useradd --create-home "${user}"

COPY lib "/home/${user}/lib"

COPY .bashrc "/home/${user}"
COPY .profile "/home/${user}"
COPY .tmux.conf "/home/${user}"
COPY .vimrc "/home/${user}"

RUN mkdir --parents "/home/${user}/workspace" && \
    chown --recursive "${user}:${user}" "/home/${user}"

USER "${user}"
ENV USER "${user}"
WORKDIR "/home/${user}/workspace"

ENTRYPOINT ["/bin/bash"]
