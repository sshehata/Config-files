#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias load-and-reindex='sudo docker exec -it -w /root/jars indexer java -jar original-contexta-dataloader.jar'
. "$HOME/.cargo/env"
