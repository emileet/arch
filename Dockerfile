FROM archlinux/base:latest
MAINTAINER Emily Maré (emileet) <emileet@plsnobully.me>

RUN \
  # first, update everything
  pacman -Syyu --noconfirm --noprogressbar --quiet && \
  # install useful packages
  pacman -S awk base-devel devtools git nano rxvt-unicode sudo zsh --noconfirm --noprogressbar --quiet && \
  # now lets cleanup
  pacman -Scc --noconfirm --noprogressbar --quiet && \
  # install ohmyzsh
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  # create user account
  echo "emileet ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
  useradd -m -G wheel -s /usr/bin/zsh emileet && \
  # set shell
  chsh -s /usr/bin/zsh

ENV LANG=en_US.UTF-8
ENV container=docker
VOLUME ["/home" "/mnt/pkg"]
CMD  ["/usr/bin/zsh"]
