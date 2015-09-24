FROM base/archlinux:latest

RUN pacman -Sy
RUN pacman -S base-devel

RUN useradd -m user
USER user
