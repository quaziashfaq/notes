#!/usr/bin/env bash
set -e

readonly script_name="${0##*/}"
readonly CL_ARGS_ERROR=155

usage() {
    cat << USAGE
    USAGE: ${script_name} name
    The script greets the user with the provided name.
    Arguments:
        name    The name of the user to greet
    Option:
        -h, --help  Show this help message and exit
USAGE
}

terminate() {
    msg="${1}"
    code="${2:-160}"
    echo "Error: ${msg}" >&2
    exit "${code}"
}

if [[ $# -ne 1 ]]; then
    usage
    terminate "Command line argmunte missing" "${CL_ARGS_ERROR}"
fi

if [[ "${1}" == "-h" ]] || [[ "${1}" == "--help" ]]; then
    usage
    exit 0
fi

name="${1}"
echo "Hello, ${1}! Welcome to the example project!!"
exit 0
