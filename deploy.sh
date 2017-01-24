#!/bin/bash

<<<<<<< 3719e3eb2513ada94b02cff62553232196f88e67
#--------------------------------------
#
#--------------------------------------
||||||| merged common ancestors
=======
dir_path="`dirname $0`"
cd ~

>>>>>>> temporary commit
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
<<<<<<< 3719e3eb2513ada94b02cff62553232196f88e67
    target_file_path="${dir_path}/${file_name}"
||||||| merged common ancestors
    target_file_path="`pwd`/${file_name}"
    #echo "${target_file_path}"
    cd ~
=======
    target_file_path="$dir_path/${file_name}"
    #echo "${target_file_path}"
>>>>>>> temporary commit
    rm -f "${file_name}"
    ln -s "${target_file_path}"
)
done

#--------------------------------------
#
#--------------------------------------
#curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
#    > ~/local/shell/git-completion.bash
#curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
#    > ~/local/shell/git-prompt.sh

