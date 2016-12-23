#!/bin/bash

files=(
    .bash_profile
    .gitconfig
    .tmux.conf
    .vimrc
    .vrapperrc
)

for file_name in "${files[@]}"
do
(
    target_file_path="`pwd`/${file_name}"
    #echo "${target_file_path}"
    cd ~
    rm -f "${file_name}"
    ln -s "${target_file_path}"
)
done

