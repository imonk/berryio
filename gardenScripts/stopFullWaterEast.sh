#!/bin/bash
# Stop Full Water East
# set pin low for pump and both valves

DATE=`date '+%Y-%m-%d %H:%M:%S'`
on=$(</sys/class/gpio/gpio9/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Pump already off" 
else
	echo -e "$DATE: Stopping East pump" 
	echo '0' > /sys/class/gpio/gpio9/value || { echo -e "Stopping East pump failed";  exit 1; }
fi

on=$(</sys/class/gpio/gpio12/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Sprinkle valve already closed" 
else 
	echo -e "$DATE: Closing East sprinkle valve"; 
	echo '0' > /sys/class/gpio/gpio12/value || { echo -e "Closing East sprinkle valve failed";} 
fi

on=$(</sys/class/gpio/gpio17/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Dripping valve already closed" 
else 
	echo -e "$DATE: Closing East dripping valve" 
	echo '0' > /sys/class/gpio/gpio17/value || { echo -e "Closing East dripping valve failed";}
fi
