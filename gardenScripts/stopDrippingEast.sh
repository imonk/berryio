#!/bin/bash
# Start Dripping East
# set pin high for pump and drip valve on side
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Stopping pump" 2>&1;
echo '0' > /sys/class/gpio/gpio9/value || { echo -e "$DATE : [EAST]:[FAIL] Stoping pump failed [FAIL]" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Closing dripping valve" 2>&1;
echo '0' > /sys/class/gpio/gpio17/value || { echo -e "$DATE : [EAST]:[FAIL] Closing dripping valve failed" [FAIL] 2>&1; } 