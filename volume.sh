#!/bin/bash

volume=`awk -F"[][]|%" '/dB/ {print $2}' <(amixer sget 'Master')`
state=`awk -F"[][]|%" '/dB/ {print $7}' <(amixer sget 'Master')`

case $state in
	on) color=00afff
		;;
	off) color=8a8a8a
		;;
esac

echo "<fc=#$color> ♫$volume </fc>"

	

