#----------------------------------------------------------
# setting for cygwin
#----------------------------------------------------------
export LANG=ja_JP.UTF-8
if [ "`uname -o`" = 'Cygwin' ];then
    set language = japanese utf-8
    export LANG=$(locale -uU)
    # set utf-8 (default is shift-jis = 932)
    chcp.com 65001
fi

SYMLINK_OPTION='winsymlinks:lnk'     # windows link
#SYMLINK_OPTION='winsymlinks:native' # default
#SYMLINK_OPTION='winsymlinks:nativestrict' # cannot use
export CYGWIN="${CYGWIN} ${SYMLINK_OPTION}" # priority is tail

#----------------------------------------------------------
# pkg-config
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

#----------------------------------------------------------
# read completion
#----------------------------------------------------------
# bash completion
bash_completion=/etc/bash_completion
if [ -f ${bash_completion} ]; then
    . ${bash_completion}
fi

# git completion
git_completion=~/local/shell/git-completion.bash
if [ -f ${git_completion} ]; then
    . ${git_completion}
fi

#----------------------------------------------------------
# set prompt
#----------------------------------------------------------
# ubuntu's default prompt
#prompt='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'
prompt='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]$PWD\[\e[0m\]'

# git prompt
git_prompt=~/local/shell/git-prompt.sh
if [ -f ${git_prompt} ]; then
    . ${git_prompt}
fi

# set prompt
branch=' \[\e[33m\]$(__git_ps1 "(%s)")\[\e[0m\]'
if [ `hostname` = ubuntu196 ]; then
    branch=''
fi
prompt=${prompt}${branch}
PS1=${prompt}'\n$ '

#----------------------------------------------------------
# set environmet variables
#----------------------------------------------------------
export PATH=$PATH:$HOME/local/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/c/Windows/System32
export LIBRARY_PATH=$LD_LIBRARY_PATH

#----------------------------------------------------------
# go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#----------------------------------------------------------
# rust
export RUST_BACKTRACE=1
export PATH=$PATH:$HOME/.cargo/bin

#----------------------------------------------------------
# hadoop
#export HADOOP_HOME=/usr/local/hadoop-2.7.1
#export PATH=$PATH:$HADOOP_HOME/bin

#----------------------------------------------------------
# java-8
#export PATH=$PATH:$JAVA_HOME/bin
export PATH=$JAVA_HOME/bin:$PATH

#alias java='java -J-Duser.language=en'
#alias javac='javac -J-Duser.language=en'
export JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF-8'
export JAVA_HOME=$HOME/local/packages/jdk
export PATH=$PATH:$JAVA_HOME/bin

#----------------------------------------------------------
# scala, sbt
#export SCALA_HOME=~/local/scala
#export PATH=$PATH:$SCALA_HOME/bin
#export SBT_HOME=~/local/sbt
#export PATH=$PATH:$SBT_HOME/bin

#----------------------------------------------------------
# freeglut
#export GLUT_HOME=~/local/glut
#export LD_LIBRARY_PATH=-L${GLUT_HOME}/lib
#export LDFLAGS=-L${GLUT_HOME}/lib
#export CPPFLAGS=-I${GLUT_HOME}/include

#----------------------------------------------------------
# dmd, D language
export DMD_HOME=~/local/packages/dmd2
export PATH=$PATH:$DMD_HOME/windows/bin

#----------------------------------------------------------
# ghc, haskell platform
export GHC_HOME=~/local/ghc
export PATH=$PATH:$GHC_HOME/bin
export HASKELL_HOME=~/local/ghc
export PATH=$PATH:$HASKELL_HOME/bin
export PATH=$PATH:~/.cabal/bin

#----------------------------------------------------------
# maven
export M2_HOME=$HOME/local/packages/maven/apache-maven-3.3.9
export PATH=$PATH:$M2_HOME/bin

#----------------------------------------------------------
# groovy
export GROOVY_HOME=$HOME/local/packages/groovy
export PATH=$PATH:$GROOVY_HOME/bin

#----------------------------------------------------------
# gradle
export GRADLE_HOME=$HOME/local/packages/gradle
export PATH=$PATH:$GRADLE_HOME/bin

##----------------------------------------------------------
## spark
#export SPARK_HOME=~/local/spark-1.4.0
#export PATH=$PATH:$SPARK_HOME/bin

#----------------------------------------------------------
# cuda
#export CUDA_INSTALL_PATH=/usr/local/cuda
#export PATH=$PATH:$CUDA_INSTALL_PATH/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_INSTALL_PATH/lib64

#----------------------------------------------------------
# MeCab
#export MECAB_HOME=$HOME/local/mecab
#export PATH=$PATH:${MECAB_HOME}/bin/

#----------------------------------------------------------
# CRF++
#export CRFPP_HOME=$HOME/local/crfpp
#export PATH=$PATH:${CRFPP_HOME}/bin/

#----------------------------------------------------------
# CaboCha
#export CABOCHA_HOME=$HOME/local/cabocha
#export PATH=$PATH:${CABOCHA_HOME}/bin/
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${CABOCHA_HOME}/lib/
#export PYTHONPATH=$PYTHONPATH:${CABOCHA_HOME}/python/

#----------------------------------------------------------
# SPTK(signal processing tool kit)
#export SPTK_HOME=$HOME/local/sptk
#export PATH=$PATH:${SPTK_HOME}/bin/

#----------------------------------------------------------
# python libraries
export PYTHONPATH=$PYTHONPATH:~/local/python/lib.linux-x86_64-2.7
#if [ `hostname` = ubuntu195 ]; then
#    echo "host is ubuntu195"
#    export PYTHONPATH=$PYTHONPATH:~/local/python/lib.linux-x86_64-2.7/matplotlib
#    export PYTHONPATH=$PYTHONPATH:~/local/python/lib.linux-x86_64-2.7/dateutil
#    export PYTHONPATH=$PYTHONPATH:~/local/python/lib.linux-x86_64-2.7/pyparsing
#else
#    echo "host is not ubuntu195"
#fi

#----------------------------------------------------------
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:~/lib
#export QT_SELECT=qt5

#----------------------------------------------------------
# programming language d
#export PATH=$PATH:/c/dm/bin

#----------------------------------------------------------
#export CLASSPATH=$CLASSPATH:/c/Users/hashikawa/.ivy2/cache/org.scalanlp/breeze-viz_2.11/jars
#export CLASSPATH=C:\Users\hashikawa\.ivy2\cache\org.scalanlp\breeze-viz_2.11\jars\breeze-viz_2.11-0.10.jar

#----------------------------------------------------------
# imagemagick
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/local/imagemagic

#----------------------------------------------------------
# nodejs
#export NODE_HOME=$HOME/local/nodejs
#export PATH=$PATH:$NODE_HOME/bin

#----------------------------------------------------------
# play framework
#export PLAY_HOME=$HOME/local/play
#export PATH=$PATH:$PLAY_HOME/bin

#----------------------------------------------------------
# django
export DJANGO_HOME=$HOME/local/django
export PATH=$PATH:$DJANGO_HOME/bin

#----------------------------------------------------------
# read .bashrc
#----------------------------------------------------------
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

