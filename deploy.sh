#!/bin/bash

#--------------------------------------
#
#--------------------------------------
dir_path="`dirname $0`"
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
    target_file_path="${dir_path}/${file_name}"
    #echo "${target_file_path}"
    cd ~
    rm -f "${file_name}"
    ln -s "${target_file_path}"
)
done

#--------------------------------------
#
#--------------------------------------
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    > ~/local/shell/git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    > ~/local/shell/git-prompt.sh

