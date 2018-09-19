#!/bin/bash
# Start Sprinkler East
# set pin high for pump and sprinkle valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Stopping pump" 2>&1;
echo '0' > /sys/class/gpio/gpio9/value || { echo -e "$DATE : [EAST]:[FAIL] Stopping pump failed [FAIL]" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Closing sprinkler valve" 2>&1;
echo '0' > /sys/class/gpio/gpio12/value || { echo -e "$DATE : [EAST]:[FAIL] Closing sprinkle valve failed [FAIL]" 2>&1; }