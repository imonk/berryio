#!/bin/bash
# Start Dripping East
# set pin high for pump and drip valve on East side
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Stopping East pump" 2>&1;
echo '0' > /sys/class/gpio/gpio9/value || { echo -e "Stoping East pump failed" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Closing East dripping valve" 2>&1;
echo '0' > /sys/class/gpio/gpio17/value || { echo -e "Closing East dripping valve failed" 2>&1; } 