#!/bin/bash
# Stop Water West
# set pin low for pump and valve
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Stopping West pump"  2>&1;
echo '0' > /sys/class/gpio/gpio4/value || { echo -e "Stopping West pump failed" 2>&1; }