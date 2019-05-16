#!/bin/bash

set -eo pipefail

function echo_err () {
    echo >&2 -e "$@"
}
function echo_debug () {
    if [ "$KD_DEBUG" == "1" ]; then
        echo >&2 ">>>> DEBUG >>>>> $(date "+%Y-%m-%d %H:%M:%S") $KD_NAME: $@"
    fi
}

KD_NAME="md2html"
echo_debug "begin"

# Parameter check
if [ $# -eq 0 ]; then
    echo_err "md2html: You should use [filename] as parameter or '-' to read from stdin."
    echo_debug "end"
    exit 1
fi

# markdown command check
markdownCMD="$(which markdown)"
if [ "$markdownCMD" == "" ]; then
    echo ">>>>>> md2html: Missing 'markdown' command. Abort"
    exit 1
fi

# Generate HTML from Markdown file if we have it as parameter
if [ "$1" != "-" ]; then
    if [ -f $1 ]; then
        $markdownCMD $1
        exit 0
    else
        echo_err ">>>>>> md2html: File $1 does not exist. Abort"
        exit 1
    fi
fi

# Generate HTML from stdin
(while IFS= read -r line; do
    printf '%s\n' "$line"
done)|$markdownCMD

echo_debug "end"
