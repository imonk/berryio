#!/bin/bash
# Stop Water West
# set pin low for pump and valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
on=$(</sys/class/gpio/gpio4/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Pump and valve already off/closed" 
else 
	echo -e "$DATE: Stopping West pump"  
	echo '0' > /sys/class/gpio/gpio4/value || { echo -e "Stopping West pump failed" ;}
fi
