#!/bin/sh
alias irc='irssi -n $USER_NAME -c irc.freenode.org'
alias v='gvim -v'
alias vi='v'
alias vim='v'
alias c='cd'
alias l='ls'
alias ls='ls -hF --group-directories-first --color=auto --sort=extension'
alias la='ls -a | grep "^\." | egrep -v "^(\./|\.\./)$" | column'
alias acp='ack -i --perl'
alias what='ps -e | grep -i'
alias bc='bc -l'
alias flushdns='dscacheutil -flushcache'
alias avg="awk '{a=a+\$1}END{print a/NR}';"
alias nr='repl.history'
alias cb='cd ~/.bashrc.d/'
alias ports='sudo fuser -n tcp {1..10000}'
alias tabs2spaces='column -t -s"	"'
alias escape=perl\ \-ne\ \'\ chomp\;\ s\/\(\\W\)\/\\\\\$1\/g\;\ print\ \"\$_\\n\"\ \'
alias t=tmux
alias cs='ctags -R'
alias b='cd ~/.bashrc.d/'
alias less='less -RS'
alias hl='pygmentize -f terminal -g -O bg=dark'
alias vc='c ~/.vimrc.d'
alias aq='ag -Q'
alias grep='grep --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

export LESS=-iMXR
export COLORFGBG="default;default" #for transparant mutt background
export HISTSIZE=100000
export HISTFILESIZE=100000
export TERM=xterm-256color
export USER_NAME=jakl
export CLICOLOR=1
export GREP_COLOR='1;32'
export LSCOLORS=ExFxCxDxBxegedabagacad
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=vim
export VISUAL=vim
unset MAILCHECK
