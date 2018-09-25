#!/bin/bash
# Start Sprinkler East
# set pin high for pump and sprinkle valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Stopping East pump" 
echo '0' > /sys/class/gpio/gpio9/value || { echo -e "Stopping East pump failed";  exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Closing East sprinkler valve" 
echo '0' > /sys/class/gpio/gpio12/value || { echo -e "Closing East sprinkle valve failed" ;}