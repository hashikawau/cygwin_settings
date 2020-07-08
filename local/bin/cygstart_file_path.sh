#! /bin/bash

path=$(cygpath -u \
    $(echo -n "$@" \
        | tr -d '\r\n' \
        | sed -E 's/.*\|([^|][^|]*$)/\1/') \
)
echo $path
cygstart "$path"

