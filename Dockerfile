FROM archlinux/base:latest
MAINTAINER Emily Maré (emileet) <emileet@plsnobully.me>

# variables
ARG username=emileet

# install useful packages
RUN pacman -Syu --noconfirm && \
    pacman -S base-devel devtools nano pigz sudo zsh --noconfirm && \
    pacman -Scc --noconfirm

# setup environment
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    useradd -m -G wheel -s /bin/zsh $username && \
    chsh -s /bin/zsh

# install oh-my-zsh
RUN sudo -u $username sh -c 'yes | zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' && \
    chown -R root:root /home/$username/.oh-my-zsh && \
    ln -s /home/$username/.zshrc /root/.zshrc

# install yay
RUN git clone https://aur.archlinux.org/yay.git && \
    chown -R $username:$username yay && cd yay && \
    sudo -u $username makepkg -cfirs --noconfirm && \
    cd .. && rm -rf yay

# install configs and scripts
COPY .zshrc /home/$username
COPY makepkg.conf /etc
COPY leet.sh /emi/

CMD ["/bin/zsh", "/emi/leet.sh"]
