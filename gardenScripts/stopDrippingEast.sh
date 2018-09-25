#!/bin/bash
# Start Dripping East
# set pin high for pump and drip valve on East side
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Stopping East pump"
on=$(</sys/class/gpio/gpio9/value)
if [[ $on = 0 ]]; then
	echo -e "$DATE: Pump already off"
else
	echo -e "$DATE: Stopping East pump"
	echo '0' > /sys/class/gpio/gpio9/value || { echo -e "Stoping East pump failed" ; exit 1; };
fi

on=$(</sys/class/gpio/gpio17/value)
if [[ $on = 0 ]]; then
		echo -e "$DATE: Dripping valve already closed"
else 
	echo -e "$DATE: Closing East dripping valve" ;
	echo '0' > /sys/class/gpio/gpio17/value || { echo -e "Closing East dripping valve failed";}; 
fi 