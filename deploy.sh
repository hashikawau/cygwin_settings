#!/bin/bash

#--------------------------------------
#
#--------------------------------------
files=(
    .bash_profile
    .bashrc
    .gitconfig
    .tmux.conf
    .vimrc
    .vrapperrc
)

#--------------------------------------
#
#--------------------------------------
cd "`dirname $0`"
dir_path="`pwd`"
cd ~

for file_name in "${files[@]}"
do
(
    target_file_path="${dir_path}/${file_name}"
    rm -f "${file_name}"
    ln -s "${target_file_path}"
)
done

#--------------------------------------
#
#--------------------------------------
mkdir -p ~/local/shell
#curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
curl https://raw.githubusercontent.com/git/git/65ed8ff376c4fdd8dd560b3ddbf7d6cd771f860e/contrib/completion/git-completion.bash \
    > ~/local/shell/git-completion.bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    > ~/local/shell/git-prompt.sh

