#!/bin/bash

current=`awk -F':|%' '/percentage/ {print $2}' <(upower -i /org/freedesktop/UPower/devices/battery_BAT1)`
current=`echo $current | tr -d ' '`

power_state=`awk -F':' '/state/ {print $2}' <(upower -i /org/freedesktop/UPower/devices/battery_BAT1)`
power_state=`echo $power_state | tr -d ' '`

if [ "$current" -gt "80" ]; then
	color=ffff00
elif [ "$current" -gt "20" ]; then
	color=ff8700
else
	color=d70000
fi

case "$power_state" in
	charging) echo "<fc=#00d700> ⇧$current%</fc>"
		;;
	discharging) echo "<fc=#$color> ⇩$current%</fc>"
		;;
	fully-charged) echo "<fc=#008700> Charged</fc>"
esac

exit 0


