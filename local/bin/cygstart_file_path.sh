#! /bin/bash

raw_path=$(echo -n "$@" \
    | tr -d '\r\n' \
    | sed -E 's/.*\|([^|][^|]*$)/\1/' \
    | sed -e 's/^ *//; s/ *$//' \
) \
path=$(cygpath -u "$raw_path")
echo path  "$path"
cygstart "$path"
