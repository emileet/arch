FROM archlinux/base:latest
MAINTAINER Emily Maré (emileet) <emileet@plsnobully.me>

# install useful packages
RUN pacman -Syyu --noconfirm && \
    pacman -S awk base-devel devtools git nano rxvt-unicode sudo zsh --noconfirm && \
    pacman -Scc --noconfirm

# setup environment
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    echo "emileet ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    useradd -m -G wheel -s /usr/bin/zsh emileet && \
    chsh -s /usr/bin/zsh

ENV LANG=en_US.UTF-8
ENV container=docker
VOLUME ["/home" "/mnt/pkg"]
CMD  ["/usr/bin/zsh"]
