#!/bin/bash

source ./scripts/utils.sh

EMACS=".emacs.d"
ZSHRC=".zshrc"
CONFIG=".config"
#XRES=".Xresources"
CONFIG_I3="${CONFIG}/i3"
CONFIG_PICOM="${CONFIG}/picom"
CONFIG_SYSTEMD="${CONFIG}/systemd"

declare -A LINKS;
LINKS=(
    ["${EMACS}"]="${HOME}/${EMACS}"
    ["${ZSHRC}"]="${HOME}/${ZSHRC}"
    ["${CONFIG_I3}"]="${HOME}/${CONFIG_I3}"
    ["${CONFIG_PICOM}"]="${HOME}/${CONFIG_PICOM}"
    ["${CONFIG_SYSTEMD}"]="${HOME}/${CONFIG_SYSTEMD}"
#    ["${XRES}"]="${HOME}/${XRES}"
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

