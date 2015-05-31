#!/bin/bash

current=`awk -F':|%' '/percentage/ {print $2}' <(upower -i /org/freedesktop/UPower/devices/battery_BAT1)`
current=`echo $current | tr -d ' '`

power_state=`awk -F':' '/state/ {print $2}' <(upower -i /org/freedesktop/UPower/devices/battery_BAT1)`
power_state=`echo $power_state | tr -d ' '`

case "$power_state" in
  charging) printf '^i(/home/sshehata/.xmonad/icons/battery.xpm)' 
		;;
	discharging) printf '^i(/home/sshehata/.xmonad/icons/bat_low_02.xpm)'
		;;
	fully-charged) printf '^i(/home/sshehata/.xmonad/icons/bat_full_02.xpm)'
esac

if [ "$current" -gt "80" ]; then
  printf '^fg(\#ffff00)'
elif [ "$current" -gt "20" ]; then
  printf '^fg(\#ff8700)'
else
  printf '^fg(\#d70000)'
fi


case "$power_state" in
  fully-charged) printf '^fg(\#006500)%8s' "Charged"
    ;;
  *) printf '%8s' "$current%"
    ;;
esac

exit 0


