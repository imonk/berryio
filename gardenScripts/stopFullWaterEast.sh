#!/bin/bash
# Stop Full Water East
# set pin low for pump and both valves

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Stopping pump" 2>&1;
echo '0' > /sys/class/gpio/gpio9/value || { echo -e "$DATE : [EAST]:[FAIL] Stopping pump faile [FAIL]" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Closing sprinkle valve" 2>&1;
echo '0' > /sys/class/gpio/gpio12/value || { echo -e "$DATE : [EAST]:[FAIL] Closing sprinkle valve failed [FAIL]" 2>&1;} 
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Clsing dripping valve" 2>&1;
echo '0' > /sys/class/gpio/gpio17/value || { echo -e "$DATE : [EAST]:[FAIL] Closing dripping valve failed [FAIL]" 2>&1; }