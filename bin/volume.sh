#!/bin/bash

volume=`awk -F"[][]|%" '/dB/ {print $2}' <(amixer sget 'Master')`
state=`awk -F"[][]|%" '/dB/ {print $7}' <(amixer sget 'Master')`

case $state in
  on) printf '^i(/home/sshehata/.xmonad/icons/vol-hi.xpm)^fg(\#00afff) ' 
		;;
  off) printf '^i(/home/sshehata/.xmonad/icons/vol-mute.xpm)^fg(\#a9a9a9) '
		;;
esac
 
printf '%4s' "$volume%"
