#----------------------------------------------------------
# set alias
#----------------------------------------------------------

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export LSCOLORS=gxfxcxdxabegedabagacad
alias ls='ls -GF'
alias ll='ls -alA'
alias la='ls -a1A'
alias l='ls -1A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias diff='colordiff -u'
alias wget='wget --restrict-file-names=nocontrol'

#alias pbcopy='clip'
#alias pbpaste='cat /dev/clipboard'

#alias open='cygstart'
alias objdump='objdump -M intel'

