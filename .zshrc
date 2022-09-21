# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall



zstyle :compinstall filename '/home/sshehata/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt prompt_subst
. /usr/share/git/git-prompt.sh

typeset -U path
path=(~/bin `ruby -e 'print Gem.user_dir'`/bin /home/sshehata/omnetpp-4.6/bin $path)

setopt HIST_IGNORE_DUPS

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward



eval `ssh-agent` > /dev/null
ssh-add > /dev/null

alias vim='nvim'

clear

tput setaf 1

command fortune
echo ""

tput sgr0

autoload -U colors && colors
PROMPT="%{$fg[yellow]%}%n@%m%{$reset_color%} $ "
RPROMPT=$'%{$fg_no_bold[yellow]%}%1~$(__git_ps1 " (%s)")%{$reset_color%}'

alias ubuntubox='sudo docker run -it ubuntu:16.04 bash'


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


function touchpadon() {
 synclient TouchpadOff=0
}

function touchpadoff() {
  synclient TouchpadOff=1
}

function final() {
  eval "$@"
}

function _alarm() {
  ( \speaker-test --frequency $1 --test sine )&
  pid=$!
  \sleep 0.${2}s
  \kill -9 $pid
}

function docker_clean() {
  sudo docker ps -aq --no-trunc | xargs sudo docker rm -v
  sudo docker images -q --filter dangling=true | xargs sudo docker rmi
}

function home() {
  sudo ip link set wlp4s0 down
  sudo pkill dhcpcd
  sudo netctl restart wlp4s0-Yell\ Penis\ For\ Password
}

function work() {
  sudo ip link set wlp4s0 down
  sudo pkill dhcpcd
  sudo netctl restart wlp4s0-VentureBuilders
}
if [ /usr/bin/kubectl ]; then source <(kubectl completion zsh); fi

export PATH=$PATH:/home/sshehata/bin

#source '/home/sshehata/lib/azure-cli/az.completion'

alias api_logs='az webapp log download --resource-group contexta-speech-api --name ctx-speech-api'
alias api_staging_logs='az webapp log download --resource-group contexta-speech-api --name staging'

PATH="/home/sshehata/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/sshehata/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/sshehata/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/sshehata/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/sshehata/perl5"; export PERL_MM_OPT;

alias myip='curl ifconfig.me'
alias versions='git tag -l | sort -V'

function kshell {
  pod=$1
  kubectl exec --stdin --tty $pod -- /bin/bash
}

unsetopt BEEP

export PATH=/home/sshehata/contexta-workspace/srilm/bin/i686-m64:/home/sshehata/contexta-workspace/srilm/bin:$PATH

function pretty_json () {
  cat $1 | python -m json.tool | less
}

function cover () {
  go test $1 -coverprofile=c.out -race
  go tool cover -html=c.out
  rm ./c.out
}
