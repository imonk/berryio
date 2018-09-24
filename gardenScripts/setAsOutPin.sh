#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
PATH="$PATH:/usr/share/berryio/gardenScripts"
DATE=`date '+%Y-%m-%d %H:%M:%S'`
PIN=$1;

echo "$PIN" > "/sys/class/gpio/export"
sleep 1
echo "out" > "/sys/class/gpio/gpio$PIN/direction"