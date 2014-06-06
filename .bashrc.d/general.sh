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
alias less='less -R'
alias hl='pygmentize -f terminal -g -O bg=dark'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

LESS=-iMXR
COLORFGBG="default;default" #for transparant mutt background
HISTSIZE=100000
HISTFILESIZE=100000
PATH=$PATH:$HOME/bin
TERM=xterm-256color
USER_NAME=jakl
CLICOLOR=1
GREP_OPTIONS='--color=auto'
GREP_COLOR='1;32'
LSCOLORS=ExFxCxDxBxegedabagacad


if [ -f ~/.my_aliases ]; then
  . ~/.my_aliases
fi
