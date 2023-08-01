#!/usr/bin/env bash

set -e

readonly ERROR_CONF_FILE=150

terminate() {
    local msg="${1}"
    local code="${2:-160}"
    echo "Error: ${msg}" >&2
    echo "${code}"
}

if [[ ! -s "${CONF_FILE}" ]]; then
    terminate "Generic error message" "${ERROR_CONF_FILE}"
fi

exit 0

