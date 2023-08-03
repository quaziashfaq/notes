#!/usr/bin/env bash
# This is an example script to demonstrate how to handle pipefail.

set -e
set -u
set -o pipefail

readonly PIPE_ERROR=156

terminate() {
    local -r msg="${1}"
    local -r code="${2:-160}"
    echo "${msg}" > &2
    exit "${code}"
}

cat non-existent-file.txt | sort || {terminate "Error in piped command" "${PIPE_ERROR}"; }

exit 0

