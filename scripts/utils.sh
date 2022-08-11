#!/bin/bash

do_yn_prompt() {
    MSG=$1
    read -p "${MSG} (y/n) " yn

    case $yn in 
	    [yY] ) echo 1;;
	    [nN] ) echo 0;;
	    * ) echo $(do_yn_prompt "${MSG}");;
    esac
}

create_symlink() {
    SRC=$1
    DST=$2
    UNLINK_FIRST=0
    DELETE_FIRST=0

    if [[ ! -f "${SRC}" && ! -d "${SRC}" ]]; then
        echo "Source ${SRC} does not exist. Skipping.";
        return;
    fi

    if [[ -L "$DST" ]]; then
        echo "Symlink ${DST} exists and will be overwritten.";
        UNLINK_FIRST=1
    elif [[ -f "${DST}" || -d "${DST}" ]]; then
        echo "Symlink target ${DST} exists and is not a symlink.";
        DELETE_FIRST=$(do_yn_prompt "Delete ${DST}?");

        if [[ ${DELETE_FIRST} = 0 ]]; then
            return;
        fi
    fi

    if [[ ${UNLINK_FIRST} = 1 ]]; then
        echo "Unlinking ${DST}";
        unlink ${DST}
    elif [[ ${DELETE_FIRST} = 1 ]]; then
        echo "Deleting ${DST}.";
        rm -rf ${DST}
    fi

    echo "Symlinking ${SRC} to ${DST}"
    ln -s ${SRC} ${DST}
}
