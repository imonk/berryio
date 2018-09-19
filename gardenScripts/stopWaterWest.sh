#!/bin/bash
# Stop Water West
# set pin low for pump and valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE : [WEST]: Stopping pump"  2>&1;
echo '0' > /sys/class/gpio/gpio4/value || { echo -e "$DATE : [WEST]:[FAIL] Stopping pump failed [FAIL]" 2>&1; }