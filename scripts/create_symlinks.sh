#!/bin/bash

source ./scripts/utils.sh

PD="portage"
SYS_PD="/etc/portage"

ACC_KWD="package.accept_keywords"
LIC="package.license"
MASK="package.mask"
USE="package.use"
EMACS=".emacs.d"
ZSHRC=".zshrc"
CONFIG=".config"
XRES=".Xresources"
WALLPAPERS="wallpapers"

declare -A LINKS;
LINKS=(
    ["${PD}/${ACC_KWD}"]="${SYS_PD}/${ACC_KWD}"
    ["${PD}/${LIC}"]="${SYS_PD}/${LIC}"
    ["${PD}/${MASK}"]="${SYS_PD}/${MASK}"
    ["${PD}/${USE}"]="${SYS_PD}/${USE}"
    ["${EMACS}"]="${HOME}/${EMACS}"
    ["${ZSHRC}"]="${HOME}/${ZSHRC}"
    ["${CONFIG}"]="${HOME}/${CONFIG}"
    ["${XRES}"]="${HOME}/${XRES}"
    ["${WALLPAPERS}"]="${HOME}/${WALLPAPERS}"
)

for src in "${!LINKS[@]}"; do
    dst=${LINKS[$src]}

    if [[ "$dst" =~ .*"/etc".* ]]; then
        SYM_FUNC=$(declare -f create_symlink)
        sudo bash -c "$SYM_FUNC; source ./scripts/utils.sh; create_symlink "$(pwd)/$src" $dst"
    else
        create_symlink "$(pwd)/$src" $dst;
    fi
done