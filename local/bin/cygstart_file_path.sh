#! /bin/bash

path=$(cygpath -u \
    $(echo -n "$@" \
        | sed -E 's/.*\|([^|][^|]*$)/\1/') \
)
echo $path
cygstart "$path"

