FROM base/archlinux:latest

RUN pacman -Sy

RUN useradd -m user
USER user
