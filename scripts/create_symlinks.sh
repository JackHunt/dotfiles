#!/bin/bash

source ./scripts/utils.sh

EMACS=".emacs.d"
ZSHRC=".zshrc"
#CONFIG=".config"

declare -A LINKS;
LINKS=(
    ["${EMACS}"]="${HOME}/${EMACS}"
    ["${ZSHRC}"]="${HOME}/${ZSHRC}"
#    ["${CONFIG}"]="${HOME}/${CONFIG}"
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

