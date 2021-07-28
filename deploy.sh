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
    .vimrc.keymap
    .vimrc.settings
    .vrapperrc
    .ideavimrc
    .vsvimrc
)

cd "`dirname $0`"
dir_path="`pwd`"
cd ~
for file_name in "${files[@]}"
do
(
    target_file_path="${dir_path}/${file_name}"
    echo "deploy ${file_name}"
    rm -f "${file_name}"
    #ln -s "${target_file_path}"
    cp "${target_file_path}" .
)
done

#--------------------------------------
#
#--------------------------------------
bin_dirname='local/bin'
for file_name in $(ls ${dir_path}/${bin_dirname})
do
(
    if [ -z "${file_name}" ]; then
        continue
    fi
    src_file="${dir_path}/${bin_dirname}/${file_name}"
    dest_file="${bin_dirname}/${file_name}"
    echo "deploy ${src_file} -> ${dest_file}"
    rm -f "${dest_file}"
    ln -s "${src_file}" "${dest_file}"

    #cp "${src_file}" "${dest_file}"
)
done


#--------------------------------------
#
#--------------------------------------
wget https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x apt-cyg
mv apt-cyg /usr/local/bin

apt-cyg install vim
apt-cyg install curl
mkdir -p ~/bak

#--------------------------------------
#
#--------------------------------------
mkdir -p ~/local/shell
if [ ! -f ~/local/shell/git-completion.bash ]; then
    #curl https://raw.githubusercontent.com/git/git/65ed8ff376c4fdd8dd560b3ddbf7d6cd771f860e/contrib/completion/git-completion.bash \
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
        > ~/local/shell/git-completion.bash
fi
if [ ! -f ~/local/shell/git-prompt.sh ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
        > ~/local/shell/git-prompt.sh
fi

#--------------------------------------
# vim options
#--------------------------------------
mkdir -p ~/.vim/.vimundo
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim \
    > ~/.vim/colors/badwolf.vim
curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/goodwolf.vim \
    > ~/.vim/colors/goodwolf.vim
curl https://www.vim.org/scripts/download_script.php?src_id=10496 \
    > ~/.vim/colors/twilight.vim
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim \
    > ~/.vim/colors/molokai.vim

mkdir -p ~/.vim/ftplugin
cp -f ${dir_path}/.vim/ftplugin/html.vim ~/.vim/ftplugin

# neobundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

