#!/bin/bash

# markdown command check
markdownCMD="$(which markdown)"
if [ "$markdownCMD" == "" ]; then
    echo "Missing 'markdown' command. Abort"
    exit 1
fi

# Generate HTML from Markdown file if we have it as parameter
if [ "$1" != "" ]; then
    if [ -f $1 ]; then
        $markdownCMD $1
        exit 0
    else
        echo "File $1 does not exist. Abort"
        exit 1
    fi
fi

# Generate HTML from standard input
(while read -t 5 line; do
    echo $line
done)|$markdownCMD
