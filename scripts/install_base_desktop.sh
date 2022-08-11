#!/bin/bash

EBUILDS="\
app-admin/sudo \
app-arch/lxqt-archiver \
app-editors/emacs \
app-editors/vscode \
app-misc/mc \
app-misc/neofetch \
app-misc/tmux \
app-text/mupdf \
dev-lang/julia \
dev-python/pip \
dev-vcs/git \
media-gfx/feh \
media-gfx/imagemagick \
net-misc/chrony \
net-misc/dhcpcd \
net-misc/netifrc \
sys-apps/mlocate \
sys-boot/grub \
sys-fs/cryptsetup \
sys-fs/dosfstools \
sys-kernel/genkernel \
sys-kernel/gentoo-sources \
sys-kernel/linux-firmware \
sys-process/cronie \
www-client/firefox \
x11-base/xorg-x11 \
x11-drivers/xf86-video-ati \
x11-misc/barrier \
x11-misc/dmenu \
x11-misc/i3lock \
x11-misc/i3status \
x11-misc/parcellite \
x11-misc/pcmanfm \
x11-misc/picom \
x11-terms/rxvt-unicode \
x11-wm/i3-gaps \
"

sudo emerge --ask ${EBUILDS}