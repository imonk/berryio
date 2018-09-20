#!/bin/bash
# Stop Water West
# set pin low for pump and valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
on=$(</sys/class/gpio/gpio4/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Pump and valve already off/closed" 2>&1;
else 
	echo -e "$DATE: Stopping West pump"  2>&1;
	echo '0' > /sys/class/gpio/gpio4/value || { echo -e "Stopping West pump failed" 2>&1; }
fi
