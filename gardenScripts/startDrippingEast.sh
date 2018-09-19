#!/bin/bash
# Start Dripping East
# set pin high for pump and drip valve

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Opening dripping valve" 2>&1;
echo '1' > /sys/class/gpio/gpio17/value || { echo -e "$DATE : [EAST]:[FAIL] Opening dripping valve failed [FAIL]" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [EAST]: Starting pump" 2>&1;
echo '1' > /sys/class/gpio/gpio9/value || { echo -e "$DATE : [EAST]:[FAIL] Starting pump failed [FAIL]" 2>&1; }