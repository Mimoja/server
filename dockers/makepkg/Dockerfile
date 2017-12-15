FROM base/archlinux:latest
MAINTAINER Mimoja <git@mimoja.de>

RUN pacman-key --init
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base-devel git boost pkgbuild-introspection
RUN pacman-db-upgrade
RUN update-ca-trust
RUN pacman -Scc --noconfirm

COPY sudoers /etc/sudoers
RUN chown -c root:root /etc/sudoers
RUN chmod -c 0440 /etc/sudoers

RUN mkdir /tmp/yaourt-build
WORKDIR /tmp/yaourt-build

RUN curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
RUN curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz

RUN tar -xvzf package-query.tar.gz
RUN tar -xvzf yaourt.tar.gz

RUN useradd -d /home/makepkg -m makepkg
RUN chown -R makepkg /tmp/yaourt-build /home/makepkg

WORKDIR /tmp/yaourt-build/package-query
RUN su makepkg -c "makepkg --noconfirm -si"

WORKDIR /tmp/yaourt-build/yaourt
RUN su makepkg -c "makepkg --noconfirm -si"

RUN echo EXPORT=1 >> /etc/yaourtrc
RUN echo EXPORTDIR="/packages" >> /etc/yaourtrc

VOLUME /packages

USER makepkg
ENTRYPOINT ["yaourt","--noconfirm","-S"]
