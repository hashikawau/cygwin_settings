#! /bin/bash

if [ $# -eq 0 ]; then
    exit 1
fi

trash_dir="${HOME}/trash"
dir_path=${trash_dir}/$(date '+%Y%m%d-%H%M%S')
mkdir -p "${dir_path}"

#echo "mv $@ ${dir_path}"
mv "$@" "${dir_path}"

