#----------------------------------------------------------
# set alias
#----------------------------------------------------------
echo 'load .bashrc'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
alias ls='ls --color=auto --file-type'
alias ll='ls -alA'
alias la='ls -a1A'
alias l='ls -1A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias diff='colordiff -u'
alias wget='wget --restrict-file-names=nocontrol'

