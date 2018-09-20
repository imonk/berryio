#!/bin/bash
# Stop Full Water East
# set pin low for pump and both valves

DATE=`date '+%Y-%m-%d %H:%M:%S'`
on=$(</sys/class/gpio/gpio9/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Pump already off" 2>&1;
else
	echo -e "$DATE: Stopping East pump" 2>&1;
	echo '0' > /sys/class/gpio/gpio9/value || { echo -e "Stopping East pump failed" 2>&1; exit 1; }
fi

on=$(</sys/class/gpio/gpio12/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Sprinkle valve already closed" 2>&1;
else 
	echo -e "$DATE: Closing East sprinkle valve" 2>&1;
	echo '0' > /sys/class/gpio/gpio12/value || { echo -e "Closing East sprinkle valve failed" 2>&1;} 

fi

on=$(</sys/class/gpio/gpio17/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Dripping valve already closed" 2>&1;
else 
	echo -e "$DATE: Closing East dripping valve" 2>&1;
	echo '0' > /sys/class/gpio/gpio17/value || { echo -e "Closing East dripping valve failed" 2>&1; }
fi
