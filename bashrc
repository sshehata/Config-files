#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin
source /usr/share/git/completion/git-prompt.sh

tput setaf 1

command fortune

tput sgr0

alias ls='ls --color=auto'
PS1='\n\[\e[0;34m\]\u@\H\[\e[m\] \[\e[38;5;13m\]\W$(__git_ps1 " (%s)")\[\e[m\] \n\$ '
