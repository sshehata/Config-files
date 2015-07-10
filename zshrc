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

typeset -U path
path=(~/bin `ruby -e 'print Gem.user_dir'`/bin $path)

setopt HIST_IGNORE_DUPS

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/git/completion/git-prompt.sh

tput setaf 1

command fortune
echo ""

tput sgr0

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

function jack_switch() {
  # Unmute the mic pin.
  sudo hda-verb /dev/snd/hwC0D0 0x18 0x390 0x00
  sudo hda-verb /dev/snd/hwC0D0 0x18 0x3a0 0x00
  # Set the mic pin from input to output.
  sudo hda-verb /dev/snd/hwC0D0 0x18 SET_PIN_WIDGET_CONTROL 0x44
  # Enable internal amplifier in both output jacks.
  sudo hda-verb /dev/snd/hwC0D0 0x10 SET_AMP_GAIN_MUTE 0x7200
}
