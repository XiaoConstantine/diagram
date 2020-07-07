# !/bin/bash

function abspath() {
    [[ $1 = /* ]] && echo $1 || echo "$PWD/${1#./}"
}


function setup_virtualenv() {
    local VENV_DIR="$(abspath $1)"; shift
    local REQUIREMENTS="$1"; shift
    local FINGERPRINT
    local PIP_INSTALL_ARGS="$@"
    local ORIGINAL_PIP_INSTALL_ARGS="$@"

    if [[ ${REQUIREMENTS} == *"requirements"* ]]; then
        if ! [ -f ${REQUIREMENTS} ]; then
            echo "${REQUIREMENTS} doesn't exist! Cannot setup virtualenv!" && exit 1
        fi
    fi

}


/usr/local/opt/python/libexec/bin/python -m venv "venv"

pushd "$(abspath)/venv/bin/"
source activate
popd

pip install -r "$@"
