#!/bin/bash
# Start Sprinkler East
# set pin high for pump and sprinkle valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Stopping East pump" 2>&1;
echo '0' > /sys/class/gpio/gpio9/value || { echo -e "Stopping East pump failed" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Closing East sprinkler valve" 2>&1;
echo '0' > /sys/class/gpio/gpio12/value || { echo -e "Closing East sprinkle valve failed" 2>&1; }