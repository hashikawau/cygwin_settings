#----------------------------------------------------------
# set alias
#----------------------------------------------------------

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
alias find1='find -maxdepth 1'
alias find2='find -maxdepth 2'
alias find3='find -maxdepth 3'
alias find4='find -maxdepth 4'
alias find5='find -maxdepth 5'

alias pbcopy='clip'
alias pbpaste='cat /dev/clipboard'

alias sakura='cygstart ~/local/bin/sakura'
alias a5m2='cygstart ~/local/bin/a5m2'

