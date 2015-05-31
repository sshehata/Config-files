#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/bin
export PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"
source /usr/share/git/completion/git-prompt.sh

tput setaf 1

command fortune

tput sgr0

alias ls='ls --color=auto'
PS1='\n\[\e[0;34m\]\u@\H\[\e[m\] \[\e[38;5;13m\]\W$(__git_ps1 " (%s)")\[\e[m\] \n\$ '

function jack_switch() {
  # Unmute the mic pin.
  sudo hda-verb /dev/snd/hwC0D0 0x18 0x390 0x00
  sudo hda-verb /dev/snd/hwC0D0 0x18 0x3a0 0x00
  # Set the mic pin from input to output.
  sudo hda-verb /dev/snd/hwC0D0 0x18 SET_PIN_WIDGET_CONTROL 0x44
  # Enable internal amplifier in both output jacks.
  sudo hda-verb /dev/snd/hwC0D0 0x10 SET_AMP_GAIN_MUTE 0x7200
}
