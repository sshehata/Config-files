#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
